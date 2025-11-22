# Card

**Selector**: `nx-card`  
**Module**: `NxCardModule`  
**Import**: `@allianz/ng-aqua/card`  
**Category**: Layout  
**Stability**: Stable  
**B2C Allowed**: Yes

## Description

The `nx-card` component is a versatile content container used to group related information and actions. It can be used as a simple visual container or as a selectable element (checkbox or radio style). Supports standard and expert appearances.

## Quick Start

### 1. Install & Import

```typescript
// app.module.ts or standalone component
import { NxCardModule } from '@allianz/ng-aqua/card';

@NgModule({
  imports: [NxCardModule]
})
export class AppModule { }
```

### 2. Basic Usage

```html
<!-- Simple card -->
<nx-card>
  <h3>Card Title</h3>
  <p>Card content goes here.</p>
</nx-card>

<!-- Selectable card -->
<nx-card selectable [(selected)]="isSelected">
  <p>Click to select this card</p>
</nx-card>
```

## API Reference

### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `appearance` | `'default' \| 'expert'` | `'default'` | Card styling variant |
| `selectable` | `boolean` | `false` | Makes the card selectable (checkbox/radio behavior) |
| `selected` | `boolean` | `false` | Whether the selectable card is selected |
| `disabled` | `boolean` | `false` | Disables the selectable card |
| `highlight` | `boolean` | `false` | Adds highlight styling to the card |
| `required` | `boolean` | `false` | Marks the selectable card as required |
| `value` | `any` | `undefined` | Value associated with the selectable card |
| `name` | `string` | `undefined` | Name attribute for underlying input (radio cards) |
| `type` | `'checkbox' \| 'radio'` | `'checkbox'` | Type of selectable card |

### Outputs

| Event | Payload | Description |
|-------|---------|-------------|
| `selectedChange` | `boolean` | Emits when the selected state changes |

## Examples

### Example 1: Basic Card

```html
<nx-card>
  <h2>Welcome</h2>
  <p>This is a simple content card.</p>
  <button nxButton="primary">Learn More</button>
</nx-card>
```

### Example 2: Selectable Checkbox Cards

```html
<nx-card selectable [(selected)]="option1" value="opt1">
  <h3>Option 1</h3>
  <p>Select this option for feature A</p>
</nx-card>

<nx-card selectable [(selected)]="option2" value="opt2">
  <h3>Option 2</h3>
  <p>Select this option for feature B</p>
</nx-card>
```

```typescript
export class MyComponent {
  option1 = false;
  option2 = true; // Pre-selected
}
```

### Example 3: Selectable Radio Cards

```html
<nx-card 
  *ngFor="let plan of plans"
  selectable 
  type="radio"
  name="planSelection"
  [value]="plan.id"
  [(selected)]="selectedPlan">
  <h3>{{ plan.name }}</h3>
  <p>{{ plan.description }}</p>
  <p><strong>{{ plan.price }}</strong></p>
</nx-card>
```

```typescript
export class MyComponent {
  selectedPlan = 'basic';
  
  plans = [
    { id: 'basic', name: 'Basic Plan', description: 'For individuals', price: '$10/mo' },
    { id: 'pro', name: 'Pro Plan', description: 'For teams', price: '$25/mo' },
    { id: 'enterprise', name: 'Enterprise', description: 'For organizations', price: 'Contact us' }
  ];
}
```

### Example 4: Highlight Card

```html
<nx-card highlight>
  <h3>Featured</h3>
  <p>This card is highlighted to draw attention.</p>
</nx-card>
```

### Example 5: Disabled Selectable Card

```html
<nx-card selectable [disabled]="true">
  <h3>Unavailable Option</h3>
  <p>This option is currently disabled.</p>
</nx-card>
```

### Example 6: Expert Appearance

```html
<nx-card appearance="expert">
  <h3>Expert Mode Card</h3>
  <p>This card uses the expert styling variant.</p>
</nx-card>
```

### Example 7: Card with Custom Content

```html
<nx-card>
  <div style="display: grid; grid-template-columns: auto 1fr; gap: 1rem; align-items: center;">
    <nx-icon name="info" size="large"></nx-icon>
    <div>
      <h4>Information</h4>
      <p>Cards can contain any type of content including icons, images, forms, and more.</p>
    </div>
  </div>
</nx-card>
```

## Accessibility

- **Selectable Cards**: Implemented using native `<input type="checkbox">` or `<input type="radio">` elements internally, ensuring full accessibility
- **Keyboard**: Selectable cards are keyboard accessible (Space to toggle, Tab to navigate)
- **Labels**: Content within the card acts as the label for the underlying input
- **Required State**: The `required` attribute is properly announced to screen readers
- **Disabled State**: Disabled cards prevent interaction and are announced as disabled

## Theming

```scss
// Card theming
--nx-card-background-color: <color>;
--nx-card-border-color: <color>;
--nx-card-border-radius: <radius-value>;
--nx-card-padding: <padding-value>;
--nx-card-shadow: <shadow-value>;

// Selectable card theming
--nx-card-selectable-border-color: <color>;
--nx-card-selectable-selected-border-color: <color>;
--nx-card-selectable-hover-border-color: <color>;

// Highlight theming
--nx-card-highlight-border-color: <color>;
```

See the [Theming Guide](../guides/theming.md) for more details.

## Related Components

- [grid.md](grid.md) - Layout grid for card placement
- [accordion.md](accordion.md) - Expandable card-like containers
- [tile.md](tile.md) - Alternative tile component
- [checkbox.md](checkbox.md) - Standalone checkbox
- [radio-button.md](radio-button.md) - Standalone radio button

## Common Issues

- **Issue**: Selectable card not responding to clicks
  - **Solution**: Ensure `selectable` is set to `true` and check that the card is not disabled

- **Issue**: Radio cards allowing multiple selections
  - **Solution**: Ensure all radio cards have the same `name` attribute

- **Issue**: Selected state not updating
  - **Solution**: Use two-way binding `[(selected)]` or handle `(selectedChange)` event manually

- **Issue**: Card content overflowing
  - **Solution**: Apply appropriate CSS to card content or use `overflow` styles

---
*Documentation extracted from ng-aqua v20.6.0*
