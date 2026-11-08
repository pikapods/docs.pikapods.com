---
title: Calibre Web
layout: page
parent: App Notes
---
# Calibre Web

Calibre Web is a web app for browsing, reading, and downloading e-books from a Calibre library. This help page addresses common scenarios for users who have [deployed Calibre Web on PikaPods](https://www.pikapods.com/apps/calibre-web). Refer to the [official Calibre Web docs](https://github.com/janeczku/calibre-web/wiki) for complete documentation.

## Uploading Books

To enable uploading books from the web interface, got o _Admin > Edit Basic Configuration > Feature Configuration > Enable Uploads_. Then click _Save_. After this, an _Upload_ button will appear in the top-right corner.

## Reading Books

To enable uploading books from the web interface, got o _Admin > Edit Basic Configuration > External Binaries_ and set the value as follows:

- *Path to Calibre binaries*: `/usr/bin/`
- _Path to Kepubify E-Book Converter_: `/usr/bin/kepubify`

Finally, allow viewing books in _Admin > Users > Edit Users > Allow View_. After this a "Read in Browser" button will appear when opening the book.
