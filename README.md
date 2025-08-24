# PikaPods App Docs

Has the content of [docs.pikapods.com](https://docs.pikapods.com). Feel free to open a pull request if you notice any mistake or would like to add something.

## Setup

### Option 1: Docker (Recommended)

No local Ruby installation needed. Requires Docker or Podman. All dependencies are pre-installed in the Docker image.

### Option 2: Local Ruby Installation

Traditional setup requiring local Ruby environment.

1. **Install dependencies**:
   ```bash
   gem install --user-install jekyll bundler
   bundler install
   ```

## Running the Site

### With Docker

- **Development server** (with live reload):
  ```bash
  docker-compose up develop
  ```
  Site available at http://localhost:4000 with automatic rebuilds on file changes.

- **Build static site**:
  ```bash
  docker-compose run build
  ```
  Generates production files in `_site/` folder.

### With Local Ruby

- **Development server**:
  ```bash
  bundle exec jekyll serve
  ```

## Development

### Embed Videos

Embed tutorial videos muted with a normal video tag:
```html
<video controls loop muted preload="none" src="1-search-photos.mp4" poster="1-search-photos.webp"></video>
```

To create the preview poster (webp format), use ffmpeg:
```bash
ffmpeg -i 1-search-photos.mp4 -ss 00:00:00.001 -vframes 1 1-search-photos.webp
```

### SEO Tags

This theme uses the *Jekyll SEO Plugin*. See their docs for [supported fields](https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/usage.md).

## Updating Dependencies

### With Docker
```bash
docker-compose run --rm develop bundle update
```

### With Local Ruby
```bash
bundle update
```

## Credits

- Theme: [https://github.com/pmarsceill/just-the-docs]
- Colors: [https://vuetifyjs.com/en/framework/colors#colors]