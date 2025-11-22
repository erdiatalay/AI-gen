# Typography

## Overview

ng-aqua provides a comprehensive typography system with directives for headings, body text, and specialized text styles. All typography follows accessibility best practices and responsive design principles.

## Headline Directive

Use the `nxHeadline` directive for headings:

```html
<h1 nxHeadline="page">Page Title</h1>
<h2 nxHeadline="section">Section Title</h2>
<h3 nxHeadline="subsection-large">Subsection Large</h3>
<h4 nxHeadline="subsection-medium">Subsection Medium</h4>
<h5 nxHeadline="subsection-small">Subsection Small</h5>
```

### Headline Sizes

| Size | Usage | HTML Element |
|------|-------|--------------|
| `page` | Page title | `<h1>` |
| `section` | Major sections | `<h2>` |
| `subsection-large` | Subsections | `<h3>` |
| `subsection-medium` | Smaller subsections | `<h4>` |
| `subsection-small` | Minor subsections | `<h5>`, `<h6>` |

## Copytext Directive

Use `nxCopytext` for body text:

```html
<p nxCopytext>This is standard body text.</p>
<p nxCopytext="large">This is large body text.</p>
<p nxCopytext="medium">This is medium body text (default).</p>
<p nxCopytext="small">This is small body text.</p>
```

### Copytext Sizes

- `large` - Larger body text
- `medium` - Default body text
- `small` - Smaller body text, fine print

## Text Modifiers

```html
<!-- Bold text -->
<span nxCopytext="medium" class="nx-font-weight-bold">Bold text</span>

<!-- Italic text -->
<em nxCopytext>Emphasized text</em>

<!-- Monospace -->
<code>const example = 'monospace';</code>
```

## Typography Scale

```scss
// Font sizes
--nx-font-size-headline-page: 2.5rem;
--nx-font-size-headline-section: 2rem;
--nx-font-size-headline-subsection-large: 1.5rem;
--nx-font-size-headline-subsection-medium: 1.25rem;
--nx-font-size-headline-subsection-small: 1rem;

--nx-font-size-copytext-large: 1.125rem;
--nx-font-size-copytext-medium: 1rem;
--nx-font-size-copytext-small: 0.875rem;
```

## Font Families

```scss
:root {
  --nx-font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  --nx-font-family-mono: "Roboto Mono", "Courier New", monospace;
}
```

## Line Height

```scss
:root {
  --nx-line-height-tight: 1.25;
  --nx-line-height-normal: 1.5;
  --nx-line-height-loose: 1.75;
}
```

## Examples

### Article Layout

```html
<article>
  <h1 nxHeadline="page">Article Title</h1>
  <p nxCopytext="large">Introduction paragraph with larger text for emphasis.</p>
  
  <h2 nxHeadline="section">Section Heading</h2>
  <p nxCopytext>Standard body paragraph text goes here.</p>
  
  <h3 nxHeadline="subsection-large">Subsection</h3>
  <p nxCopytext>More content here.</p>
</article>
```

### Card with Typography

```html
<nx-card>
  <h3 nxHeadline="subsection-medium">Card Title</h3>
  <p nxCopytext>Card description text.</p>
  <p nxCopytext="small">Additional fine print or metadata.</p>
</nx-card>
```

## Best Practices

1. **Semantic HTML**: Use proper heading hierarchy (`<h1>` through `<h6>`)
2. **Don't Skip Levels**: Don't jump from `<h2>` to `<h5>`
3. **One H1**: Use only one `<h1>` per page
4. **Responsive Text**: Text sizes adjust automatically for mobile
5. **Line Length**: Keep lines 45-75 characters for readability
6. **Contrast**: Ensure sufficient color contrast (WCAG AA: 4.5:1 minimum)

## Accessibility

- Always use semantic HTML elements
- Provide proper heading hierarchy for screen readers
- Don't use headings for styling alone
- Ensure text is resizable up to 200% without loss of functionality

---
*ng-aqua v20.6.0 Typography Guide*
