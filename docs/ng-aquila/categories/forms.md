# Forms Components

## Overview

ng-aquila provides a comprehensive set of form components for building interactive, accessible forms. All form components integrate seamlessly with Angular's template-driven and reactive forms, support validation, and follow accessibility best practices.

## Components in this Category

### Input
**File**: [input.md](../components/input.md)  
**Quick Description**: Text input and textarea field with auto-trim and auto-resize features  
**Common Use**: Basic text input, email, password, multi-line text entry

### Checkbox
**File**: [checkbox.md](../components/checkbox.md)  
**Quick Description**: Single or grouped checkbox selections with indeterminate state support  
**Common Use**: Multi-select options, terms acceptance, settings toggles

### Radio Button
**File**: [radio-button.md](../components/radio-button.md)  
**Quick Description**: Mutually exclusive selection from a set of options  
**Common Use**: Single-choice questions, option selection

### Dropdown
**File**: [dropdown.md](../components/dropdown.md)  
**Quick Description**: Dropdown select menu with filtering and multi-select support  
**Common Use**: Select from list of options, multi-select, searchable lists

### Formfield
**File**: [formfield.md](../components/formfield.md)  
**Quick Description**: Wrapper component providing labels, hints, and error messages for form inputs  
**Common Use**: Wrapping all form inputs for consistent styling and validation display

### Autocomplete
**File**: [autocomplete.md](../components/autocomplete.md)  
**Quick Description**: Input with auto-suggest dropdown based on user typing  
**Common Use**: City selection, search with suggestions, predictive input

### Date Field
**File**: [date-field.md](../components/date-field.md)  
**Quick Description**: Date input with datepicker popup  
**Common Use**: Date selection, date ranges, appointment booking

### Timefield
**File**: [timefield.md](../components/timefield.md)  
**Quick Description**: Time input field with formatting  
**Common Use**: Time selection, appointment times, scheduling

### Phone Input
**File**: [phone-input.md](../components/phone-input.md)  
**Quick Description**: Specialized input for phone numbers with country code support  
**Common Use**: Phone number entry, international numbers, contact forms

### Code Input
**File**: [code-input.md](../components/code-input.md)  
**Quick Description**: Input for codes, PINs, or OTPs with individual character fields  
**Common Use**: Verification codes, PIN entry, 2FA codes

### File Uploader
**File**: [file-uploader.md](../components/file-uploader.md)  
**Quick Description**: File upload component with drag-and-drop support  
**Common Use**: Document uploads, image uploads, multi-file uploads

### Switcher
**File**: [switcher.md](../components/switcher.md)  
**Quick Description**: Toggle switch for boolean options  
**Common Use**: Enable/disable features, on/off toggles, settings

### Circle Toggle
**File**: [circle-toggle.md](../components/circle-toggle.md)  
**Quick Description**: Circular toggle buttons for selection  
**Common Use**: Visual option selection, filter toggles

### Toggle Button
**File**: [toggle-button.md](../components/toggle-button.md)  
**Quick Description**: Button group with toggle selection behavior  
**Common Use**: View mode selection, filter options, grouped choices

### Number Stepper
**File**: [number-stepper.md](../components/number-stepper.md)  
**Quick Description**: Numeric input with increment/decrement buttons  
**Common Use**: Quantity selection, age input, numeric adjustments

### Slider
**File**: [slider.md](../components/slider.md)  
**Quick Description**: Range slider for numeric value selection  
**Common Use**: Price ranges, volume control, rating scales

### Natural Language Form
**File**: [natural-language-form.md](../components/natural-language-form.md)  
**Quick Description**: Form with natural language-style layout  
**Common Use**: Conversational forms, quote forms, inline forms

## Common Patterns

### Pattern 1: Complete Form with Validation

```html
<form [formGroup]="myForm" (ngSubmit)="onSubmit()">
  <!-- Text Input -->
  <nx-formfield nxLabel="Full Name">
    <input nxInput formControlName="name" required />
    <nx-formfield-error *ngIf="myForm.get('name')?.hasError('required')">
      Name is required
    </nx-formfield-error>
  </nx-formfield>

  <!-- Email -->
  <nx-formfield nxLabel="Email">
    <input nxInput type=" email" formControlName="email" required />
    <nx-formfield-error *ngIf="myForm.get('email')?.hasError('email')">
      Invalid email address
    </nx-formfield-error>
  </nx-formfield>

  <!-- Dropdown -->
  <nx-formfield nxLabel="Country">
    <nx-dropdown formControlName="country">
      <nx-dropdown-item *ngFor="let country of countries" [value]="country.code">
        {{ country.name }}
      </nx-dropdown-item>
    </nx-dropdown>
  </nx-formfield>

  <!-- Checkbox -->
  <nx-checkbox formControlName="terms" required>
    I agree to the terms and conditions
  </nx-checkbox>

  <!-- Submit -->
  <button nxButton="primary" type="submit" [disabled]="myForm.invalid">
    Submit
  </button>
</form>
```

```typescript
export class MyFormComponent {
  myForm = this.fb.group({
    name: ['', Validators.required],
    email: ['', [Validators.required, Validators.email]],
    country: ['', Validators.required],
    terms: [false, Validators.requiredTrue]
  });

  countries = [
    { code: 'us', name: 'United States' },
    { code: 'de', name: 'Germany' },
    { code: 'uk', name: 'United Kingdom' }
  ];

  constructor(private fb: FormBuilder) {}

  onSubmit() {
    if (this.myForm.valid) {
      console.log(this.myForm.value);
    }
  }
}
```

### Pattern 2: Date and Time Selection

```html
<form [formGroup]="appointmentForm">
  <nx-formfield nxLabel="Appointment Date">
    <nx-date-field formControlName="date"></nx-date-field>
  </nx-formfield>

  <nx-formfield nxLabel="Appointment Time">
    <nx-timefield formControlName="time"></nx-timefield>
  </nx-formfield>
</form>
```

### Pattern 3: File Upload with Validation

```html
<nx-formfield nxLabel="Upload Documents">
  <nx-file-uploader 
    formControlName="files"
    [multiple]="true"
    accept=".pdf,.doc,.docx"
    [maxFileSize]="5242880">
  </nx-file-uploader>
  <nx-formfield-hint>Max 5MB per file, PDF or Word documents only</nx-formfield-hint>
</nx-formfield>
```

### Pattern 4: Dynamic Form Fields

```html
<form [formGroup]="dynamicForm">
  <div formArrayName="items">
    <div *ngFor="let item of items.controls; let i = index" [formGroupName]="i">
      <nx-formfield [nxLabel]="'Item ' + (i + 1)">
        <input nxInput formControlName="name" />
      </nx-formfield>
      <button nxButton="tertiary" type="button" (click)="removeItem(i)">Remove</button>
    </div>
  </div>
  <button nxButton="secondary" type="button" (click)="addItem()">Add Item</button>
</form>
```

```typescript
export class DynamicFormComponent {
  dynamicForm = this.fb.group({
    items: this.fb.array([])
  });

  get items() {
    return this.dynamicForm.get('items') as FormArray;
  }

  constructor(private fb: FormBuilder) {
    this.addItem();
  }

  addItem() {
    this.items.push(this.fb.group({
      name: ['']
    }));
  }

  removeItem(index: number) {
    this.items.removeAt(index);
  }
}
```

## Category-Specific Guidelines

### Form Validation
- Always provide clear error messages using `nx-formfield-error`
- Use built-in Angular validators when possible
- Show errors only after user interaction (touched/dirty)
- Consider async validators for server-side validation

### Accessibility
- Every form field must have a visible label (`nxLabel`)
- Use `required` attribute for required fields
- Provide helpful hints with `nx-formfield-hint`
- Ensure keyboard navigation works throughout the form
- Test with screen readers

### User Experience
- Group related fields together
- Use appropriate input types (email, tel, number, etc.)
- Provide autocomplete attributes for browser autofill
- Show real-time validation feedback when appropriate
- Disable submit button until form is valid

### Performance
- Use `OnPush` change detection strategy where possible
- Debounce expensive validation operations
- Lazy-load large dropdown options
- Consider virtual scrolling for very long lists

## Related Guides
- [Error Handling](../guides/error-handling.md) - Form validation patterns
- [Accessibility](../guides/accessibility.md) - Accessible form design
- [Layout Patterns](../guides/layout-patterns.md) - Form layout best practices
