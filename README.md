# bettertext.css

Improved typography styles for naked HTML (without any classnames) and Markdown-generated content.

## Usage in HTML

Insert bettertext.css after [normalize.css](https://github.com/necolas/normalize.css) and after your `@font-face` declaration.

## Default values

Component has global mixin with settings named `.bettertext-settings();` and global variable `bettertext` which contains all the code.

Default settings:

```less
.bettertext-settings() {

    //settings
    @fz: 16px;          // default font-size
    @fz-small: 0.8em;   // smaller font-size
    @rythm: 24px;       // vertical rythm = line-height in pixels
    @linel: 50em;       // max-width for text
    @font1: sans-serif; // body
    @font2: sans-serif; // headers
    @scale1: 1.125;     // header size multiplier for small screens
    @scale2: 1.250;     // header size multiplier for large screens

    @bettertext-breakpoint: ~"(min-width: 768px)"; // large screens starts from that value

    //calculations
    // ...
}
```

## Usage in LESS

Running with default parameters:

```less
@import (less) "uicomponents/bettertext.less";
```

Setting up basic parameters:

```less
@import (less) "uicomponents/bettertext.less";

.bettertext-settings() {

    //settings
    @fz: 16px;                   // default font-size
    @font1: 'Arial', sans-serif; // body
    @font2: 'Georgia', serif;    // headers

    @bettertext-breakpoint: ~"(min-width: 50em)"; // large screens starts from that value

}
```

Deep customization: you able to redefine any formula in calculation section inside `bettertext-settings` mixin.

```less
@import (less) "uicomponents/bettertext.less";

.bettertext-settings() {

    //settings
    @fz: 16px;                   // default font-size
    @font1: 'Arial', sans-serif; // body
    @font2: 'Georgia', serif;    // headers

    @bettertext-breakpoint: ~"(min-width: 50em)"; // large screens starts from that value

    //redefining header margin-top
    @h1-mt: 3em;
    @h2-mt: 2.5em;
    @h3-mt: 2em;
    @h4-mt: 1.5em;
    @h5-mt: unit( 2 * @lh * @fz / @h5-fz, em);
    @h6-mt: unit( 2 * @lh * @fz / @h6-fz, em);
}
```
