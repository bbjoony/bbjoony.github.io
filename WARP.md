# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is a Jekyll-based personal blog for a game QA professional. Layouts are based on the plainwhite theme (kept in the repo, no `theme:` set); GitHub Pages applies its default primer CSS. The blog focuses on sharing experiences in game testing, daily life stories, and learning journeys.

## Development Commands

### Build and Serve
```bash
# One-time setup (Homebrew Ruby 3.3, same Jekyll 3.10 as GitHub Pages)
brew install ruby@3.3
export PATH=/opt/homebrew/opt/ruby@3.3/bin:$PATH LANG=en_US.UTF-8
bundle config set --local path vendor/bundle
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk bundle install

# Start Jekyll server locally (http://localhost:4000)
bundle exec jekyll serve

# Build with draft posts visible
bundle exec jekyll serve --drafts
```

### Content Management
```bash
# Create a new blog post (naming convention: YYYY-MM-DD-post-title.md)
touch _posts/$(date +%Y-%m-%d)-new-post.md

# Check for problems
bundle exec jekyll doctor
```

## Architecture and Structure

### Jekyll Configuration
- **Main Config**: `_config.yml` - Site title, author info, `plainwhite:` settings read by the layouts, `exclude` list
- **Theme Assets**: plainwhite JavaScript for dark mode and search (plainwhite CSS is not in the repo yet); Clean Blog leftovers (`package.json`, `img/`, `assets/scripts.js`) are unused
- **Plugins**: jekyll-feed, jekyll-seo-tag for RSS and SEO optimization

### Content Organization
- **Posts**: `_posts/` directory follows Jekyll convention (YYYY-MM-DD-title.md format)
- **Pages**: Root level markdown files (about.md, index.md, posts.md) for static pages
- **Layouts**: `_layouts/` contains HTML templates (default, home, page, post)
- **Includes**: `_includes/` has reusable components (navbar, footer, analytics, scripts)

### Theme Components
- **JavaScript**: 
  - `assets/js/darkmode.js` - Dark mode toggle functionality
  - `assets/js/search.js` - Site search implementation
  - `assets/scripts.js` - Main theme scripts

### Search Functionality
The site implements Jekyll Simple Search plugin with a `search.json` file generated at build time containing post metadata for client-side search.

### Legacy Content
- `-old/` directory contains previous Jekyll setup with Gemfile configuration
- Migrated from Clean Blog theme to plainwhite-based layouts

## Post Front Matter Template
```yaml
---
layout: post
title: "포스트 제목"
subtitle: "부제목"
date: YYYY-MM-DD HH:MM:SS +0900
categories: [카테고리1, 카테고리2]
---
```

## Site-Specific Notes
- Blog is in Korean, focusing on game QA experiences
- Images are stored in the root directory (e.g., conference photos)
- Root `Gemfile` (github-pages gem) is for local preview only; GitHub Pages builds with its own environment