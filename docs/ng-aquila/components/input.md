# Input

**Selectors**: `input[nxInput]`, `textarea[nxInput]`  
**Module**: `NxInputModule`  
**Import**: `@allianz/ng-aquila/input`  
**Category**: Forms  
**Stability**: Stable  
**B2C Allowed**: Yes

## Description

The `nxInput` directive is used on `<input>` and `<textarea>` elements to apply standard ng-aquila styling. It is typically used within an `nx-formfield` component for proper labels, hints, and error messages. Supports both template-driven and reactive forms, with features like auto-trimming and auto-resize for textareas.

## Quick Start

### 1. Install & Import

```typescript
// app.module.ts or standalone component
import { NxInputModule } from '@allianz/ng-aquila/input';
import { NxFormfieldModule } from '@allianz/ng-aquila/formfield';

@NgModule({
  imports: [NxInputModule, NxFormfieldModule]
})
export class AppModule { }
```

### 2. Basic Usage

```html
<!-- Simple input -->
<nx-formfield nxLabel="Email">
  <input nxInput type="email" />
</nx-formfield>

<!-- Textarea -->
<nx-formfield nxLabel="Description">
  <textarea nxInput rows="4"></textarea>
</nx-formfield>
```

## API Reference

### Inputs (nxInput)

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `type` | `string` | `'text'` | Standard HTML input type (text, number, email, password, etc.) |
| `disabled` | `boolean` | `false` | Disables the input |
| `readonly` | `boolean` | `false` | Makes the input read-only |
| `placeholder` | `string` | `''` | Placeholder text |
| `required` | `boolean` | `false` | Marks the input as required |
| `nxTrim` | `boolean` | `true` | Automatically trims whitespace on blur |
| `nxAutoResize` | `boolean` | `false` | (Textarea only) Auto-resize based on content |
| `nxAutoResizeMinRows` | `number` | `2` | Minimum rows for auto-resize |
| `nxAutoResizeMaxRows` | `number` | `undefined` | Maximum rows for auto-resize |

### Password Toggle Component (nx-password-toggle)

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `control` | `FormControl \| NgModel` | `required` | The input control to toggle visibility for |
| `ariaLabel` | `string` | `'Show password'` | ARIA label for the toggle button |

### Outputs

Standard HTML events:
- `(input)` - Fired on every input change
- `(change)` - Fired when value changes and input loses focus
- `(blur)` - Fired when input loses focus
- `(focus)` - Fired when input gains focus

## Examples

### Example 1: Template-Driven Forms

```html
<nx-formfield nxLabel="Full Name">
  <input nxInput [(ngModel)]="userName" name="userName" required />
</nx-formfield>
```

```typescript
export class MyComponent {
  userName = '';
}
```

### Example 2: Reactive Forms

```html
<form [formGroup]="myForm">
  <nx-formfield nxLabel="Email Address">
    <input nxInput formControlName="email" type="email" />
  </nx-formfield>
</form>
```

```typescript
export class MyComponent {
  myForm = this.fb.group({
    email: ['', [Validators.required, Validators.email]]
  });

  constructor(private fb: FormBuilder) {}
}
```

### Example 3: Password with Toggle

```html
<nx-formfield nxLabel="Password">
  <input nxInput type="password" formControlName="password" />
  <nx-password-toggle 
    nxFormFieldSuffix 
    [control]="myForm.controls.password"
    ariaLabel="Toggle password visibility">
  </nx-password-toggle>
</nx-formfield>
```

### Example 4: Auto-Resize Textarea

```html
<nx-formfield nxLabel="Comments">
  <textarea 
    nxInput 
    nxAutoResize 
    [nxAutoResizeMinRows]="3"
    [nxAutoResizeMaxRows]="10"
    placeholder="Enter your comments...">
  </textarea>
</nx-formfield>
```

### Example 5: Read-Only Input

```html
<nx-formfield nxLabel="Order ID">
  <input nxInput [value]="orderId" readonly />
</nx-formfield>
```

### Example 6: Disabled Input without Trim

```html
<nx-formfield nxLabel="Code">
  <input nxInput [(ngModel)]="code" [nxTrim]="false" />
  <nx-formfield-hint>Whitespace will be preserved</nx-formfield-hint>
</nx-formfield>
```

## Accessibility

- **Labels**: Always use `nxLabel` on `nx-formfield` or associate a `<label>` element
- **Required Fields**: Use `required` attribute and provide visual indicators
- **Error Messages**: Use `nx-formfield-error` to display validation errors
- **Placeholder**: Don't rely solely on placeholders; always provide labels
- **ARIA**: Password toggle includes proper ARIA labels; customize via `ariaLabel` property

## Theming

```scss
// Input field theming
--nx-input-border-color: <color>;
--nx-input-background-color: <color>;
--nx-input-text-color: <color>;
--nx-input-focus-border-color: <color>;
--nx-input-disabled-background-color: <color>;
--nx-input-padding: <padding-value>;
```

See the [Theming Guide](../guides/theming.md) for more details.

## Related Components

- [formfield.md](formfield.md) - Form field wrapper (use with Input)
- [date-field.md](date-field.md) - Specialized date input
- [phone-input.md](phone-input.md) - Phone number input
- [code-input.md](code-input.md) - Code/PIN input
- [autocomplete.md](autocomplete.md) - Autocomplete input

## Common Issues

- **Issue**: Input not styled correctly
  - **Solution**: Ensure the input is wrapped in `nx-formfield` and `NxFormfieldModule` is imported

- **Issue**: Validation errors not showing
  - **Solution**: Add `<nx-formfield-error>` within the form field and ensure validators are in place

- **Issue**: Auto-trim removing needed spaces
  - **Solution**: Set `[nxTrim]="false"` on the input

- **Issue**: Password toggle not working
  - **Solution**: Ensure you're passing the correct FormControl or NgModel reference to the `control` input

---
*Documentation extracted from ng-aquila v20.6.0*
