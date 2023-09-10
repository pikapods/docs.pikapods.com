# PikaPods App Docs

Has the content of [docs.pikapods.com](https://docs.pikapods.com). Feel free to open a pull request if you notice any mistake or would like to add something.

## Setup
- Install dependencies: `gem install --user-install jekyll bundler`
- Run in project dir: `bundler install`

## Run
- `bundle exec jekyll serve`

## Embed videos

Embed tutorial videos muted with a normal video tag:
```
<video controls loop muted preload="none" src="1-search-photos.mp4" poster="1-search-photos.webp"></video>
```

To create the preview poster (webp format), use ffmpeg:
```
$ ffmpeg -i 1-search-photos.mp4 -ss 00:00:00.001 -vframes 1 1-search-photos.webp
```

## SEO Tags
This theme uses the *Jekyll SEO Plugin*. See their docs for [supported fields](https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/usage.md).

## Build/Deploy
Workaround for Netlify Ruby issue. In `Gemfile.lock`:

```
 BUNDLED WITH
-   2.0.1
+   1.16.0
```

## Update
- `bundle update`

## Credits
- Theme: [https://github.com/pmarsceill/just-the-docs]
- Colors: [https://vuetifyjs.com/en/framework/colors#colors]