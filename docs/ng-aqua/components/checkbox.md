# Checkbox

**Selectors**: `nx-checkbox`, `nx-checkbox-group`  
**Module**: `NxCheckboxModule`  
**Import**: `@allianz/ng-aqua/checkbox`  
**Category**: Forms  
**Stability**: Stable  
**B2C Allowed**: Yes

## Description

The `nx-checkbox` component allows users to select one or more options from a set. It can be used individually or within an `nx-checkbox-group` for managing multiple related checkboxes. Supports indeterminate state, disabled state, label sizing, and negative (light-on-dark) styling.

## Quick Start

### 1. Install & Import

```typescript
// app.module.ts or standalone component
import { NxCheckboxModule } from '@allianz/ng-aqua/checkbox';

@NgModule({
  imports: [NxCheckboxModule]
})
export class AppModule { }
```

### 2. Basic Usage

```html
<!-- Single checkbox -->
<nx-checkbox [(checked)]="isChecked">Accept terms and conditions</nx-checkbox>

<!-- Checkbox group -->
<nx-checkbox-group>
  <nx-checkbox [(checked)]="option1">Option 1</nx-checkbox>
  <nx-checkbox [(checked)]="option2">Option 2</nx-checkbox>
</nx-checkbox-group>
```

## API Reference

### nx-checkbox

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `checked` | `boolean` | `false` | Whether the checkbox is checked |
| `disabled` | `boolean` | `false` | Disables the checkbox |
| `indeterminate` | `boolean` | `false` | Sets the checkbox to indeterminate state |
| `negative` | `boolean` | `false` | Applies negative (light-on-dark) styling |
| `labelSize` | `'small' \| 'large'` | `'large'` | Size of the label text |
| `value` | `any` | `undefined` | Value associated with the checkbox |
| `name` | `string` | `undefined` | Name attribute for the checkbox |
| `required` | `boolean` | `false` | Marks the checkbox as required |
| `ariaLabel` | `string` | `undefined` | ARIA label for accessibility |
| `ariaLabelledBy` | `string` | `undefined` | ID of element labelling the checkbox |

#### Outputs

| Event | Payload | Description |
|-------|---------|-------------|
| `checkedChange` | `boolean` | Emits when checked state changes |
| `indeterminateChange` | `boolean` | Emits when indeterminate state changes |

### nx-checkbox-group

#### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `disabled` | `boolean` | `false` | Disables all checkboxes in the group |
| `negative` | `boolean` | `false` | Applies negative styling to the group |
| `labelSize` | `'small' \| 'large'` | `'large'` | Label size for all checkboxes in the group |
| `required` | `boolean` | `false` | Marks the group as required |
| `name` | `string` | `undefined` | Name for the checkbox group |

## Examples

### Example 1: Basic Checkbox

```html
<nx-checkbox [(checked)]="agreedToTerms">
  I agree to the terms and conditions
</nx-checkbox>
```

```typescript
export class MyComponent {
  agreedToTerms = false;
}
```

### Example 2: Indeterminate State

```html
<nx-checkbox 
  [checked]="allSelected" 
  [indeterminate]="someSelected"
  (checkedChange)="toggleAll($event)">
  Select All
</nx-checkbox>

<nx-checkbox-group>
  <nx-checkbox *ngFor="let item of items" 
               [(checked)]="item.selected"
               (checkedChange)="updateSelectAll()">
    {{ item.name }}
  </nx-checkbox>
</nx-checkbox-group>
```

```typescript
export class MyComponent {
  items = [
    { name: 'Item 1', selected: false },
    { name: 'Item 2', selected: true },
    { name: 'Item 3', selected: false }
  ];

  get allSelected() {
    return this.items.every(item => item.selected);
  }

  get someSelected() {
    const selected = this.items.filter(item => item.selected).length;
    return selected > 0 && selected < this.items.length;
  }

  toggleAll(checked: boolean) {
    this.items.forEach(item => item.selected = checked);
  }

  updateSelectAll() {
    // Logic handled by getters
  }
}
```

### Example 3: Checkbox Group (Template-Driven)

```html
<form #form="ngForm">
  <nx-checkbox-group name="options">
    <nx-checkbox name="opt1" [(ngModel)]="options.opt1" value="1">
      Option 1
    </nx-checkbox>
    <nx-checkbox name="opt2" [(ngModel)]="options.opt2" value="2">
      Option 2
    </nx-checkbox>
    <nx-checkbox name="opt3" [(ngModel)]="options.opt3" value="3">
      Option 3
    </nx-checkbox>
  </nx-checkbox-group>
</form>
```

```typescript
export class MyComponent {
  options = {
    opt1: false,
    opt2: true,
    opt3: false
  };
}
```

### Example 4: Checkbox Group (Reactive Forms)

```html
<form [formGroup]="myForm">
  <nx-checkbox-group formGroupName="preferences">
    <nx-checkbox formControlName="newsletter">
      Subscribe to newsletter
    </nx-checkbox>
    <nx-checkbox formControlName="updates">
      Receive product updates
    </nx-checkbox>
    <nx-checkbox formControlName="promotions">
      Receive promotional emails
    </nx-checkbox>
  </nx-checkbox-group>
</form>
```

```typescript
export class MyComponent {
  myForm = this.fb.group({
    preferences: this.fb.group({
      newsletter: [false],
      updates: [true],
      promotions: [false]
    })
  });

  constructor(private fb: FormBuilder) {}
}
```

### Example 5: Disabled Checkboxes

```html
<!-- Disabled group -->
<nx-checkbox-group [disabled]="true">
  <nx-checkbox>Disabled Option 1</nx-checkbox>
  <nx-checkbox>Disabled Option 2</nx-checkbox>
</nx-checkbox-group>

<!-- Individual disabled checkbox -->
<nx-checkbox [disabled]="true" [checked]="true">
  This option is disabled
</nx-checkbox>
```

### Example 6: Label Sizes

```html
<nx-checkbox labelSize="small">Small label</nx-checkbox>
<nx-checkbox labelSize="large">Large label (default)</nx-checkbox>
```

### Example 7: Negative (Light on Dark)

```html
<div style="background: #0f2a3d; padding: 1rem;">
  <nx-checkbox-group negative>
    <nx-checkbox [(checked)]="darkOpt1">Dark theme option 1</nx-checkbox>
    <nx-checkbox [(checked)]="darkOpt2">Dark theme option 2</nx-checkbox>
  </nx-checkbox-group>
</div>
```

## Accessibility

- **Labels**: Always provide label text. If using checkbox without visible label, use `ariaLabel`:
  ```html
  <nx-checkbox ariaLabel="Accept privacy policy" [(checked)]="accepted"></nx-checkbox>
  ```

- **Keyboard**: Fully keyboard accessible (Space to toggle, Tab to navigate)

- **Required Fields**: Use `required` attribute for form validation:
  ```html
  <nx-checkbox [(checked)]="agreed" required>I agree</nx-checkbox>
  ```

- **Group Labels**: Use `ariaLabelledBy` to associate checkboxes with group headings:
  ```html
  <h3 id="preferences-heading">Preferences</h3>
  <nx-checkbox-group ariaLabelledBy="preferences-heading">
    <nx-checkbox>Option 1</nx-checkbox>
  </nx-checkbox-group>
  ```

## Theming

```scss
// Checkbox theming
--nx-checkbox-border-color: <color>;
--nx-checkbox-background-color: <color>;
--nx-checkbox-checked-background-color: <color>;
--nx-checkbox-checked-border-color: <color>;
--nx-checkbox-hover-border-color: <color>;
--nx-checkbox-disabled-opacity: <value>;
--nx-checkbox-size: <size-value>;
```

See the [Theming Guide](../guides/theming.md) for more details.

## Related Components

- [radio-button.md](radio-button.md) - Radio button for single selection
- [switcher.md](switcher.md) - Toggle switch component
- [formfield.md](formfield.md) - Form field wrapper
- [card.md](card.md) - Card with selectable checkbox behavior

## Common Issues

- **Issue**: Checkbox not responding to clicks
  - **Solution**: Check that the checkbox is not disabled and events are properly bound

- **Issue**: Two-way binding not working
  - **Solution**: Ensure you're using `[(checked)]` not `[checked]` alone

- **Issue**: Indeterminate state not showing
  - **Solution**: Set `[indeterminate]="true"` explicitly; this state is not controlled by clicking

- **Issue**: Form validation not working
  - **Solution**: Ensure checkbox has `name` attribute and is within a form

---
*Documentation extracted from ng-aqua v20.6.0*
