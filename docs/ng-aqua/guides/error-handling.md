# Error Handling

## Overview

ng-aqua provides built-in error handling for forms and validation. This guide covers best practices for displaying and managing errors in your application.

## Form Validation Errors

### Display Errors with nx-formfield-error

```html
<nx-formfield nxLabel="Email">
  <input nxInput type="email" formControlName="email" required />
  <nx-formfield-error *ngIf="myForm.get('email')?.hasError('required') && myForm.get('email')?.touched">
    Email is required
  </nx-formfield-error>
  <nx-formfield-error *ngIf="myForm.get('email')?.hasError('email')">
    Please enter a valid email address
  </nx-formfield-error>
</nx-formfield>
```

### Error Patterns

```typescript
export class MyFormComponent {
  myForm = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', [Validators.required, Validators.minLength(8)]],
    age: ['', [Validators.required, Validators.min(18), Validators.max(120)]]
  });

  // Helper method for error checking
  hasError(field: string, error: string): boolean {
    const control = this.myForm.get(field);
    return control?.hasError(error) && (control?.dirty || control?.touched) || false;
  }
}
```

```html
<!-- Using helper method -->
<nx-formfield nxLabel="Password">
  <input nxInput type="password" formControlName="password" />
  <nx-formfield-error *ngIf="hasError('password', 'required')">
    Password is required
  </nx-formfield-error>
  <nx-formfield-error *ngIf="hasError('password', 'minlength')">
    Password must be at least 8 characters
  </nx-formfield-error>
</nx-formfield>
```

## Global Error Messages

### Using nx-message Component

```html
<nx-message type="error" *ngIf="globalError">
  <strong>Error:</strong> {{ globalError }}
</nx-message>
```

### Message Types

```html
<nx-message type="error">Critical error message</nx-message>
<nx-message type="warning">Warning message</nx-message>
<nx-message type="info">Informational message</nx-message>
<nx-message type="success">Success message</nx-message>
```

## API Error Handling

```typescript
export class DataService {
  constructor(private http: HttpClient) {}

  getData() {
    return this.http.get('/api/data').pipe(
      catchError(error => {
        console.error('API Error:', error);
        return throwError(() => new Error('Failed to load data'));
      })
    );
  }
}
```

```typescript
export class MyComponent {
  errorMessage = '';
  
  loadData() {
    this.dataService.getData().subscribe({
      next: (data) => this.handleData(data),
      error: (error) => {
        this.errorMessage = error.message;
        // Optionally show notification
        this.showNotification('error', error.message);
      }
    });
  }

  showNotification(type: string, message: string) {
    // Use nx-notification service
  }
}
```

## Custom Validators

```typescript
export class CustomValidators {
  static phoneNumber(control: AbstractControl): ValidationErrors | null {
    const phoneRegex = /^\+?[\d\s-()]+$/;
    if (control.value && !phoneRegex.test(control.value)) {
      return { phoneNumber: true };
    }
    return null;
  }

  static passwordMatch(passwordField: string, confirmField: string) {
    return (formGroup: AbstractControl): ValidationErrors | null => {
      const password = formGroup.get(passwordField);
      const confirmPassword = formGroup.get(confirmField);

      if (!password || !confirmPassword) {
        return null;
      }

      if (confirmPassword.errors && !confirmPassword.errors['passwordMatch']) {
        return null;
      }

      if (password.value !== confirmPassword.value) {
        confirmPassword.setErrors({ passwordMatch: true });
        return { passwordMatch: true };
      } else {
        confirmPassword.setErrors(null);
        return null;
      }
    };
  }
}
```

```html
<!-- Using custom validators -->
<nx-formfield nxLabel="Phone Number">
  <input nxInput formControlName="phone" />
  <nx-formfield-error *ngIf="myForm.get('phone')?.hasError('phoneNumber')">
    Invalid phone number format
  </nx-formfield-error>
</nx-formfield>
```

## Best Practices

1. **Show errors after interaction**: Use `touched` or `dirty` flags
2. **Specific error messages**: Provide clear, actionable messages
3. **Field-level errors**: Show errors next to the field
4. **Summary errors**: Show global errors at top of form
5. **Real-time validation**: Validate on blur for better UX
6. **Async validation**: Show loading state during async validation

## Accessibility

- Error messages must be associated with fields using `aria-describedby`
- Use `role="alert"` for critical errors
- Ensure error messages are announced by screen readers
- Provide clear, descriptive error text

---
*ng-aqua v20.6.0 Error Handling Guide*
