---
title: Calibre Web
layout: page
parent: Apps
---

## Uploading Books
To enable uploading books from the web interface, got o *Admin > Edit Basic Configuration > Feature Configuration > Enable Uploads*. Then click *Save*. After this, an *Upload* button will appear in the top-right corner.

## Reading Books
To enable uploading books from the web interface, got o *Admin > Edit Basic Configuration > External Binaries* and set the value as follows:

- *Path to Calibre Ebook Converter*: `/usr/bin/ebook-convert`
- *Path to Kepubify E-Book Converter*: `/usr/bin/kepubify`

Finally, allow viewing books in *Admin > Users > Edit Users > Allow View*. After this a "Read in Browser" button will appear when opening the book.