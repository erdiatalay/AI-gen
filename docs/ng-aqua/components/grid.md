# Grid

**Selectors**: `[nxLayout="grid"]`, `[nxRow]`, `[nxCol]`  
**Module**: `NxGridModule`  
**Import**: `@allianz/ng-aqua/grid`  
**Category**: Layout  
**Stability**: Stable  
**B2C Allowed**: Yes

## Description

A responsive 12-column grid system based on flexbox. The grid uses directives on regular HTML elements: `nxLayout="grid"` for the container, `nxRow` for rows, and `nxCol` for columns. Supports breakpoint-specific column sizing and offsets across 7 breakpoints (tiny, small, medium, large, xlarge, 2xlarge, 3xlarge).

## Quick Start

### 1. Install & Import

```typescript
// app.module.ts or standalone component
import { NxGridModule} from '@allianz/ng-aqua/grid';

@NgModule({
  imports: [NxGridModule]
})
export class AppModule { }
```

### 2. Basic Usage

```html
<!-- Basic grid container -->
<div nxLayout="grid">
  <div nxRow>
    <div nxCol="6">Column 1 (50%)</div>
    <div nxCol="6">Column 2 (50%)</div>
  </div>
</div>
```

## API Reference

### nxLayout="grid"

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `nogutters` | `boolean` | `false` | Removes gutters (spacing) between columns |
| `maxwidth` | `boolean` | `false` | Applies maximum width constraint to grid |

### nxRow

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `nxRow` | `string` | `''` | CSS flexbox alignment classes (e.g., 'justify-content-start', 'align-items-center') |

### nxCol

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `nxCol` | `string \| number` | `''` | Column width (1-12) or responsive sizes (e.g., '12,6,4') |
| `nxOffset` | `string \| number` | `''` | Column offset or responsive offsets |

#### Responsive Format

Format: `[tiny],[small],[medium],[large],[xlarge],[2xlarge],[3xlarge]`

Example: `nxCol="12,12,6,4"` means:
- 12 columns on tiny screens
- 12 columns on small screens
- 6 columns on medium screens
- 4 columns on large+ screens

Named format: `nxCol="small-6,large-4"`

## Examples

### Example 1: Basic Grid

```html
<div nxLayout="grid">
  <div nxRow>
    <div nxCol="4">4 columns</div>
    <div nxCol="4">4 columns</div>
    <div nxCol="4">4 columns</div>
  </div>
</div>
```

### Example 2: Responsive Grid

```html
<div nxLayout="grid">
  <div nxRow>
    <!-- Full width on mobile, half on tablet, third on desktop -->
    <div nxCol="12,6,4">Product 1</div>
    <div nxCol="12,6,4">Product 2</div>
    <div nxCol="12,6,4">Product 3</div>
  </div>
</div>
```

### Example 3: Named Breakpoints

```html
<div nxLayout="grid">
  <div nxRow>
    <div nxCol="small-12,medium-8,large-6">Main Content</div>
    <div nxCol="small-12,medium-4,large-6">Sidebar</div>
  </div>
</div>
```

### Example 4: Column Offsets

```html
<div nxLayout="grid">
  <div nxRow>
    <!-- Offset by 3 columns -->
    <div nxCol="6" nxOffset="3">Centered 6-column content</div>
  </div>
</div>
```

### Example 5: No Gutters

```html
<div nxLayout="grid" nogutters>
  <div nxRow>
    <div nxCol="6">No space between</div>
    <div nxCol="6">these columns</div>
  </div>
</div>
```

### Example 6: Max Width

```html
<div nxLayout="grid" maxwidth>
  <div nxRow>
    <div nxCol="12">Constrained to max width</div>
  </div>
</div>
```

### Example 7: Row Alignment

```html
<div nxLayout="grid">
  <!-- Center content horizontally -->
  <div nxRow="justify-content-center">
    <div nxCol="6">Centered column</div>
  </div>
  
  <!-- Align items vertically -->
  <div nxRow="align-items-center" style="min-height: 200px;">
    <div nxCol="12">Vertically centered</div>
  </div>
</div>
```

## Accessibility

- **Semantic HTML**: Grid directives work on any HTML element; use semantic elements when appropriate:
  ```html
  <div nxLayout="grid">
    <article nxRow>
      <section nxCol="8">Main article</section>
      <aside nxCol="4">Related content</aside>
    </article>
  </div>
  ```

- **Reading Order**: Ensure content order in HTML matches visual reading order

- **Responsive Design**: Test layouts at all breakpoints for accessibility

## Breakpoints

| Breakpoint | Size | Columns |
|-----------|------|---------|
| Tiny | < 320px | 12 |
| Small | ≥ 320px | 12 |
| Medium | ≥ 704px | 12 |
| Large | ≥ 992px | 12 |
| XLarge | ≥ 1280px | 12 |
| 2XLarge | ≥ 1472px | 12 |
| 3XLarge | ≥ 1760px | 12 |

## Theming

```scss
// Grid theming
--nx-grid-gutter-width: <spacing-value>;
--nx-grid-max-width: <max-width-value>;
```

See the [Theming Guide](../guides/theming.md) for more details.

## Related Components

- [card.md](card.md) - Cards often used within grid layouts
- [accordion.md](accordion.md) - Accordion within grid columns
- [formfield.md](formfield.md) - Form fields in grid layouts

## Common Issues

- **Issue**: Columns not adding up to 12
  - **Solution**: Ensure column numbers total 12 for proper layout (e.g., 8+4, 6+6, 4+4+4)

- **Issue**: Grid not responsive
  - **Solution**: Use comma-separated values or named breakpoints for responsive sizing

- **Issue**: Gutters too wide/narrow
  - **Solution**: Customize `--nx-grid-gutter-width` or use `nogutters` attribute

- **Issue**: Content overflowing on mobile
  - **Solution**: Always start with `12` columns for mobile breakpoints

---
*Documentation extracted from ng-aqua v20.6.0*
