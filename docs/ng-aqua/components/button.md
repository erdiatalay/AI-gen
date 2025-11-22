# Button

**Selectors**: `button[nxButton]`, `a[nxButton]`, `button[nxIconButton]`, `a[nxIconButton]`, `button[nxPlainButton]`, `a[nxPlainButton]`  
**Module**: `NxButtonModule`  
**Import**: `@allianz/ng-aqua/button`  
**Category**: Buttons & Actions  
**Stability**: Stable  
**B2C Allowed**: Yes

## Description

The button component is used for actions in forms, dialogs, and more. It supports multiple visual styles (primary, secondary, tertiary, etc.), various sizes, loading states, and can be rendered as either a `<button>` or `<a>` anchor tag. Three button variants are available: standard buttons (`nxButton`), icon buttons (`nxIconButton`), and plain buttons (`nxPlainButton`).

## Quick Start

### 1. Install & Import

```typescript
// app.module.ts or standalone component
import { NxButtonModule } from '@allianz/ng-aqua/button';

@NgModule({
  imports: [NxButtonModule]
})
export class AppModule { }
```

### 2. Basic Usage

```html
<!-- Standard button -->
<button nxButton="primary">Click me</button>

<!-- Icon button -->
<button nxIconButton="primary">
  <nx-icon name="check"></nx-icon>
</button>

<!-- Plain button -->
<button nxPlainButton>Plain action</button>
```

## API Reference

### Standard Button (nxButton)

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `nxButton` | `'primary' \| 'secondary' \| 'tertiary' \| 'emphasis' \| 'attention' \| 'cta' \| 'danger'` | `'primary'` | Button style variant |
| `size` | `'small' \| 'medium' \| 'large' \| 'xlarge' \| '2xlarge'` | `'medium'` | Button size |
| `loading` | `boolean` | `false` | Shows loading spinner |
| `disabled` | `boolean` | `false` | Disables the button |
| `block` | `boolean` | `false` | Makes button full-width |
| `negative` | `boolean` | `false` | Applies negative (light-on-dark) styling |
| `danger` | `boolean` | `false` | Applies danger styling |

### Icon Button (nxIconButton)

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `nxIconButton` | `'primary' \| 'secondary' \| 'tertiary' \| 'emphasis'` | `'primary'` | Icon button style variant |
| `size` | `'small' \| 'medium' \| 'large'` | `'medium'` | Icon button size |
| `disabled` | `boolean` | `false` | Disables the button |

### Plain Button (nxPlainButton)

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `nxPlainButton` | `boolean` | `true` | Marks as plain button |
| `danger` | `boolean` | `false` | Applies danger styling |

### Outputs

Uses standard HTML events:
- `(click)` - Fired when button is clicked

## Examples

### Example 1: Button Styles

```html
<!-- Different button styles -->
<button nxButton="primary">Primary</button>
<button nxButton="secondary">Secondary</button>
<button nxButton="tertiary">Tertiary</button>
<button nxButton="emphasis">Emphasis</button>
<button nxButton="attention">Attention</button>
<button nxButton="cta">Call to Action</button>
<button nxButton="danger">Danger</button>
```

### Example 2: Button Sizes

```html
<!-- Different sizes -->
<button nxButton="primary" size="small">Small</button>
<button nxButton="primary" size="medium">Medium</button>
<button nxButton="primary" size="large">Large</button>
<button nxButton="primary" size="xlarge">XLarge</button>
<button nxButton="primary" size="2xlarge">2XLarge</button>
```

### Example 3: Loading State

```html
<!-- Loading button -->
<button nxButton="primary" [loading]="isLoading" (click)="onSubmit()">
  {{ isLoading ? 'Saving...' : 'Save' }}
</button>
```

```typescript
export class MyComponent {
  isLoading = false;

  onSubmit() {
    this.isLoading = true;
    // Perform async operation
    setTimeout(() => {
      this.isLoading = false;
    }, 2000);
  }
}
```

### Example 4: Icon Buttons

```html
<!-- Icon buttons -->
<button nxIconButton="primary" aria-label="Add item">
  <nx-icon name="plus"></nx-icon>
</button>

<button nxIconButton="secondary" aria-label="Edit" size="small">
  <nx-icon name="edit"></nx-icon>
</button>
```

### Example 5: Link Buttons

```html
<!-- Button styled as anchor -->
<a nxButton="primary" href="/dashboard">Go to Dashboard</a>

<!-- With Angular routing -->
<a nxButton="secondary" routerLink="/settings">Settings</a>
```

### Example 6: Block Buttons

```html
<!-- Full-width block button -->
<button nxButton="primary" block>Full Width Button</button>
```

### Example 7: Negative (Light on Dark)

```html
<!-- For use on dark backgrounds -->
<div style="background: #0f2a3d; padding: 1rem;">
  <button nxButton="primary" negative>Negative Button</button>
</div>
```

## Accessibility

- **ARIA Labels**: Icon-only buttons must include `aria-label` for screen readers:
  ```html
  <button nxIconButton="primary" aria-label="Delete item">
    <nx-icon name="trash"></nx-icon>
  </button>
  ```

- **Loading State**: When `loading` is true, add descriptive `aria-label`:
  ```html
  <button nxButton="primary" [loading]="isLoading" 
          [attr.aria-label]="isLoading ? 'Saving changes, please wait' : 'Save changes'">
    Save
  </button>
  ```

- **Keyboard**: Buttons are fully keyboard accessible (Enter/Space to activate)
  
- **Disabled State**: Use `[disabled]` attribute, which prevents interaction and announces disabled state to screen readers

## Theming

Button components support CSS custom properties for theming:

```scss
// Primary button theming
--nx-button-primary-background-color: <color>;
--nx-button-primary-color: <text-color>;
--nx-button-primary-hover-background-color: <hover-color>;

// Secondary button theming
--nx-button-secondary-background-color: <color>;
--nx-button-secondary-color: <text-color>;

// Size and spacing
--nx-button-padding: <padding-value>;
--nx-button-border-radius: <radius-value>;
```

See the [Theming Guide](../guides/theming.md) for more details.

## Related Components

- [action.md](action.md) - Text-only action buttons
- [link.md](link.md) - Styled hyperlinks
- [toggle-button.md](toggle-button.md) - Toggle button group
- [icon.md](icon.md) - Icon component for use within buttons

## Common Issues

- **Issue**: Icon button not visible
  - **Solution**: Ensure you've imported `NxIconModule` and the icon name is correct

- **Issue**: Button not full width with `block` attribute
  - **Solution**: Make sure the button's parent container has a defined width

- **Issue**: Loading spinner not showing
  - **Solution**: Verify the `loading` property is set to `true` and check console for errors

- **Issue**: Click event firing twice
  - **Solution**: Ensure you're not using both `(click)` on the button and a parent element

---
*Documentation extracted from ng-aqua v20.6.0*
