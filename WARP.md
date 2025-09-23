# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is a Jekyll-based personal blog for a game QA professional, built with the Clean Blog Jekyll theme. The blog focuses on sharing experiences in game testing, daily life stories, and learning journeys.

## Development Commands

### Build and Serve
```bash
# Start Jekyll server locally
jekyll serve

# Build with draft posts visible
jekyll serve --drafts

# Build for production
jekyll build

# Serve with live reload
jekyll serve --livereload
```

### Content Management
```bash
# Create a new blog post (naming convention: YYYY-MM-DD-post-title.md)
touch _posts/$(date +%Y-%m-%d)-new-post.md

# Check for broken links
jekyll build && jekyll doctor
```

### Dependencies
```bash
# Install npm dependencies for theme assets
npm install

# Update npm packages
npm update
```

## Architecture and Structure

### Jekyll Configuration
- **Main Config**: `_config.yml` - Site title, author info, theme settings (currently uses jekyll-theme-cayman)
- **Theme Assets**: Bootstrap-based Clean Blog theme with custom JavaScript for dark mode and search functionality
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
- **Styling**: Bootstrap 4.6.0 based with Font Awesome 4.7.0 icons
- **Dependencies**: jQuery 3.6.0, startbootstrap-clean-blog 5.1.0

### Search Functionality
The site implements Jekyll Simple Search plugin with a `search.json` file generated at build time containing post metadata for client-side search.

### Legacy Content
- `-old/` directory contains previous Jekyll setup with Gemfile configuration
- Migration from plainwhite theme to current Clean Blog theme

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
- No Gemfile in root - using system Jekyll installation
- npm packages managed separately for theme assets