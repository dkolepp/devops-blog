+++
date = '{{ .Date }}'
draft = true
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
#series = [""]
tags = [
  "technology",
  "tools",
  "techniques", 
  "patterns",
  {{ range .Site.Params.book_tags }}
  "{{ .}} Book",
  {{ end }}
  {{ range .Site.Params.podcast_tags }}
  "{{ .}} Podcast",
  {{ end }}
  {{ range .Site.Params.principle_tags }}
  "{{ .}} Principle",
  {{ end }}
]
+++
Short summary of {{ replace .File.ContentBaseName "-" " " | title }} goes here...

<!--more-->

## Headline 1

### Headline 1.1


### Headline 1.2

## Headline 2


