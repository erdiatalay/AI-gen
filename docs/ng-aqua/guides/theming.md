# Theming

## Overview

ng-aqua provides a comprehensive theming system based on CSS custom properties (CSS variables). You can customize colors, spacing, typography, and component-specific styles to match your brand.

## Default Theme

ng-aqua includes a default Allianz theme. The library can be used with:
- **Allianz Branding**: Default theme with Allianz colors
- **White Label**: Customizable theme for non-Allianz applications

## CSS Custom Properties

### Global Colors

```scss
:root {
  // Primary colors
  --nx-color-primary: #003781;
  --nx-color-secondary: #0077c8;
  
  // Status colors
  --nx-color-success: #00966e;
  --nx-color-danger: #d50f3c;
  --nx-color-warning: #ff9000;
  --nx-color-info: #0077c8;
  
  // Neutral colors
  --nx-color-text: #1a1a1a;
  --nx-color-background: #ffffff;
  --nx-color-border: #cccbca;
  
  // Dark theme colors
  --nx-dark-background: #0f2a3d;
}
```

### Typography

```scss
:root {
  // Font families
  --nx-font-family: "Open Sans", sans-serif;
  --nx-font-family-mono: "Roboto Mono", monospace;
  
  // Font sizes
  --nx-font-size-small: 0.875rem;
  --nx-font-size-medium: 1rem;
  --nx-font-size-large: 1.125rem;
  
  // Font weights
  --nx-font-weight-normal: 400;
  --nx-font-weight-bold: 700;
}
```

### Spacing

```scss
:root {
  // Spacing scale
  --nx-spacing-xs: 0.25rem;
  --nx-spacing-s: 0.5rem;
  --nx-spacing-m: 1rem;
  --nx-spacing-l: 1.5rem;
  --nx-spacing-xl: 2rem;
  --nx-spacing-2xl: 3rem;
}
```

## Component Theming

### Button

```scss
:root {
  // Button primary
  --nx-button-primary-background-color: var(--nx-color-primary);
  --nx-button-primary-color: #ffffff;
  --nx-button-primary-hover-background-color: #002a66;
  
  // Button secondary
  --nx-button-secondary-background-color: transparent;
  --nx-button-secondary-color: var(--nx-color-primary);
  --nx-button-secondary-border-color: var(--nx-color-primary);
  
  // Button sizing
  --nx-button-padding: 0.5rem 1rem;
  --nx-button-border-radius: 0.25rem;
}
```

### Input

```scss
:root {
  --nx-input-border-color: var(--nx-color-border);
  --nx-input-background-color: #ffffff;
  --nx-input-text-color: var(--nx-color-text);
  --nx-input-focus-border-color: var(--nx-color-primary);
  --nx-input-disabled-background-color: #f5f5f5;
  --nx-input-padding: 0.5rem 0.75rem;
  --nx-input-border-radius: 0.25rem;
}
```

### Card

```scss
:root {
  --nx-card-background-color: #ffffff;
  --nx-card-border-color: var(--nx-color-border);
  --nx-card-border-radius: 0.5rem;
  --nx-card-padding: 1.5rem;
  --nx-card-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
```

## Creating a Custom Theme

### 1. Create Theme File

```scss
// styles/my-theme.scss
:root {
  // Override primary color
  --nx-color-primary: #e2001a;  // Your brand color
  
  // Override success color
  --nx-color-success: #00a000;
  
  // Customize buttons
  --nx-button-border-radius: 1rem;  // Rounded buttons
  
  // Customize cards
  --nx-card-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}
```

### 2. Import in Angular

```scss
// styles.scss
@import 'styles/my-theme.scss';
```

Or in `angular.json`:

```json
{
  "styles": [
    "src/styles/my-theme.scss",
    "src/styles.scss"
  ]
}
```

##Dark Mode Support

```scss
// Dark mode theme
@media (prefers-color-scheme: dark) {
  :root {
    --nx-color-background: #1a1a1a;
    --nx-color-text: #ffffff;
    --nx-card-background-color: #2a2a2a;
    --nx-input-background-color: #333333;
  }
}

// Manual dark mode toggle
[data-theme="dark"] {
  --nx-color-background: #1a1a1a;
  --nx-color-text: #ffffff;
  --nx-card-background-color: #2a2a2a;
}
```

## Negative (Light on Dark) Mode

Many components support a `negative` property for use on dark backgrounds:

```html
<div style="background: #0f2a3d; padding: 2rem;">
  <button nxButton="primary" negative>Click me</button>
  <nx-checkbox negative>Option</nx-checkbox>
</div>
```

## Expert Mode

Expert mode provides an alternative visual style:

```typescript
// Enable expert mode globally
import { NxExpertModule } from '@allianz/ng-aqua/config';

@NgModule({
  imports: [NxExpertModule]
})
```

## Best Practices

1. **Use CSS Custom Properties**: Override CSS variables instead of component CSS
2. **Test Themes**: Ensure sufficient color contrast (WCAG AA minimum 4.5:1)
3. **Consistent Naming**: Follow the established naming convention
4. **Document Changes**: Keep a theme documentation file
5. **Test Dark Mode**: If supporting dark mode, test all components

## Resources

- [ng-aqua Theming Documentation](https://allianz.github.io/ng-aqua/guides/theming)
- [CSS Custom Properties (MDN)](https://developer.mozilla.org/en-US/docs/Web/CSS/--*)
- [Contrast Checker](https://webaim.org/resources/contrastchecker/)

---
*ng-aqua v20.6.0 Theming Guide*
