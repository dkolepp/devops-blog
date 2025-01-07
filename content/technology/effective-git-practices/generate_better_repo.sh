#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
REPO_NAME="git_sample_repo"
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
# Ensure the repo does not allow merge commits
gh api -X PATCH /repos/"$GITHUB_USER"/"$REPO_NAME" -f allow_merge_commit=false > /dev/null
cd "$REPO_NAME"

# Configure user
git config user.name "Fake User"
git config user.email "fakeuser@example.com"

# Create an initial commit on the main branch
echo "# Overview" > README.md
echo "This repository is used to demonstrate effective Git practices." >> README.md
git add README.md > /dev/null 2>&1
git commit -m "feat(docs): add README.md" > /dev/null 2>&1
git push -u origin main > /dev/null 2>&1

echo ""
echo ""

# Function to create a feature branch with commits
create_branch_with_commit() {
  branch_name=$1
  start_branch=$2
  message=$3

  echo ""
  # all stdout and stderr goes to /dev/null
  git checkout "$start_branch" > /dev/null 2>&1
  # Redirect stderr to stdout, and stdout to /dev/null
  git pull > /dev/null 2>&1
  git checkout -b "$branch_name"

  for i in $(seq 1 1); do
    echo "$branch_name commit $(date)" > "$branch_name-file.txt"
    git add "$branch_name-file.txt" > /dev/null 2>&1
    git commit -m "$message" > /dev/null 2>&1
  done

  # Push the feature branch to the remote repository
  git push -u origin "$branch_name" > /dev/null 2>&1
}

# Function to add commits to an existing branch
add_commit_to_branch() {
  branch_name=$1
  message=$2

  git checkout "$branch_name" > /dev/null 2>&1
  git pull > /dev/null 2>&1

  for i in $(seq 1 1); do
    echo "$branch_name additional commit $(date)" >> "$branch_name-file.txt"
    git add "$branch_name-file.txt" > /dev/null 2>&1
    git commit -m "WIP" > /dev/null 2>&1
  done

  # Push the new commits to the remote repository
  git push > /dev/null 2>&1
}

# Function to simulate the creation of a PR
create_pr() {
  branch_name=$1
  # Create a simulated PR
  gh pr create --base main --head "$branch_name" --fill --body "This is a simulated PR for $branch_name" > /dev/null 2>&1
  # Edit the PR title, to match the format of the merge commit message
  pr_number=$(gh pr list --json number,headRefName | \
     jq '.[] | select(.headRefName == "'"$branch_name"'") | .number')
  echo "PR #$pr_number created for $branch_name"
}

# Function to update a branch based on the content of main
update_branch_from_main() {
  git checkout main > /dev/null 2>&1
  git pull > /dev/null 2>&1
  branch_name=$1
  git checkout "$branch_name" > /dev/null 2>&1
  git rebase main > /dev/null 2>&1
  git push -f origin "$branch_name" > /dev/null 2> /dev/null
}

# Function to merge a PR and delete the associated branch
merge_pr() {
  branch_name=$1
  pr_number=$(gh pr list --head "$branch_name" --json number -q '.[0].number')

  if [ -z "$pr_number" ]; then
    echo "No open PR found for branch $branch_name"
    return 1
  fi

  gh pr merge "$pr_number" --squash --delete-branch > /dev/null 2>&1
  echo "PR #$pr_number merged and branch $branch_name deleted"
}

# Simulate Repo activity

# Create feature branches
create_branch_with_commit "feature1" "main" "feat: add feature1-file.txt"
create_pr "feature1"
create_branch_with_commit "feature2" "main" "feat: add feature2-file.txt"
create_pr "feature2"
merge_pr "feature1"

create_branch_with_commit "feature3" "main" "feat: add feature3-file.txt"
create_pr "feature3"
add_commit_to_branch "feature2" "fix: update feature2-file.txt"
update_branch_from_main "feature2"
create_branch_with_commit "feature4" "main" "feat: add feature4-file.txt"
create_pr "feature4"
add_commit_to_branch "feature3" "fix: update feature3-file.txt"
add_commit_to_branch "feature4" "fix: update feature4-file.txt"
update_branch_from_main "feature3"
merge_pr "feature3"

create_branch_with_commit "feature3" "main" "fix: set correct date in feature3-file.txt"
create_pr "feature3"
merge_pr "feature3"

create_branch_with_commit "feature1" "main" "chore: upgrade libxyz to v1.0.1"
create_pr "feature1"
merge_pr "feature1"



create_branch_with_commit "feature5" "main" "feat: add feature5-file.txt"
create_pr "feature5"
add_commit_to_branch "feature2" "fix: update feature2-file.txt"
update_branch_from_main "feature2"
update_branch_from_main "feature4"
merge_pr "feature4"

add_commit_to_branch "feature2" "fix: update feature2-file.txt"
create_branch_with_commit "feature6" "main" "feat: add feature6-file.txt"
create_pr "feature6"
add_commit_to_branch "feature5" "fix: update feature5-file.txt"
update_branch_from_main "feature5"
