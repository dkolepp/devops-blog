#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
REPO_NAME="anti_pattern_repo"
GITHUB_USER="dkolepp"

# Function to delete a GitHub repository if it exists
delete_repo_if_exists() {
  if gh repo view "$GITHUB_USER/$REPO_NAME" &>/dev/null; then
    gh repo delete "$GITHUB_USER/$REPO_NAME" --yes
  fi
}

# Delete the repository if it exists
delete_repo_if_exists

# Create a new GitHub repository and clone it locally
gh repo create "$GITHUB_USER/$REPO_NAME" --public --clone
cd "$REPO_NAME"

# Configure user
git config user.name "Fake User"
git config user.email "fakeuser@example.com"

# Create an initial commit on the main branch
echo "Initial commit" > file.txt
git add file.txt
git commit -m "Initial commit (#1)" > /dev/null
git push -u origin main > /dev/null

echo ""
echo ""

# Function to create a feature branch with commits
create_branch_with_commits() {
  branch_name=$1
  start_branch=$2
  num_commits=$3

  echo ""
  # all stdout and stderr goes to /dev/null
  git checkout "$start_branch" > /dev/null 2>&1
  # Redirect stderr to stdout, and stdout to /dev/null
  git pull > /dev/null 2>&1
  git checkout -b "$branch_name" > /dev/null 2>&1

  for i in $(seq 1 $num_commits); do
    echo "$branch_name commit $i" > "$branch_name-file.txt"
    git add "$branch_name-file.txt" > /dev/null 2>&1
    git commit -m "WIP" > /dev/null 2>&1
  done

  # Push the feature branch to the remote repository
  git push -u origin "$branch_name" > /dev/null 2>&1
}

# Function to add commits to an existing branch
add_commits_to_branch() {
  branch_name=$1
  num_commits=$2

  git checkout "$branch_name" 2> /dev/null
  git pull > /dev/null 2>&1

  for i in $(seq 1 $num_commits); do
    echo "$branch_name additional commit $i" >> "$branch_name-file.txt"
    git add "$branch_name-file.txt" > /dev/null 2>&1
    git commit -m "WIP" > /dev/null 2>&1
  done

  # Push the new commits to the remote repository
  git push origin "$branch_name" > /dev/null 2>&1
}

# Function to simulate the creation of a PR
create_pr() {
  branch_name=$1
  # Create a simulated PR
  gh pr create --base main --head "$branch_name" --title "temp" --body "This is a simulated PR for $branch_name" > /dev/null 2>&1
  # Edit the PR title, to match the format of the merge commit message
  pr_number=$(gh pr list --json number,headRefName | \
     jq '.[] | select(.headRefName == "'"$branch_name"'") | .number')
  gh pr edit $pr_number --title "Merge pull request #$pr_number from $branch_name" > /dev/null 2>&1
  echo "PR #$pr_number created for $branch_name"
}

# Function to update a branch based on the content of main
update_branch_from_main() {
  git checkout main 2> /dev/null
  git pull > /dev/null 2>&1
  branch_name=$1
  git checkout "$branch_name" 2> /dev/null
  git merge main -m "Merge main into $branch_name" 2> /dev/null
  git push origin "$branch_name" > /dev/null 2> /dev/null
}

# Function to merge a PR and delete the associated branch
merge_pr() {
  branch_name=$1
  pr_number=$(gh pr list --head "$branch_name" --json number -q '.[0].number')

  if [ -z "$pr_number" ]; then
    echo "No open PR found for branch $branch_name"
    return 1
  fi

  gh pr merge "$pr_number" --merge --delete-branch > /dev/null 2>&1
  echo "PR #$pr_number merged and branch $branch_name deleted"
}

# Simulate Repo activity

# Create feature branches
create_branch_with_commits "feature1" "main" 1
create_branch_with_commits "feature2" "main" 1
create_pr "feature1"
merge_pr "feature1"
create_branch_with_commits "feature3" "main" 2
add_commits_to_branch "feature2" 1
create_pr "feature2"
update_branch_from_main "feature2"
create_branch_with_commits "feature4" "main" 2
add_commits_to_branch "feature3" 1
add_commits_to_branch "feature4" 2
create_pr "feature3"
merge_pr "feature3"
create_branch_with_commits "feature5" "main" 1
add_commits_to_branch "feature2" 1
update_branch_from_main "feature2"
create_pr "feature4"
update_branch_from_main "feature4"
merge_pr "feature4"
add_commits_to_branch "feature2" 2
create_branch_with_commits "feature6" "main" 1
add_commits_to_branch "feature5" 2
create_pr "feature5"
update_branch_from_main "feature2"
update_branch_from_main "feature5"
update_branch_from_main "feature2"
create_pr "feature6"