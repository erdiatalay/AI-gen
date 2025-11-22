# Expert Mode

## Overview

ng-aqua provides an "Expert Mode" theme variant designed for power users and professional applications. Expert mode offers a different visual style while maintaining all functionality.

## Enabling Expert Mode

### Global Expert Mode

Enable expert mode for the entire application:

```typescript
// app.module.ts
import { NxExpertModule } from '@allianz/ng-aqua/config';

@NgModule({
  imports: [
    NxExpertModule,
    // ... other modules
  ]
})
export class AppModule { }
```

### Component-Level Expert Mode

Apply expert mode to specific components:

```html
<!-- Expert mode card -->
<nx-card appearance="expert">
  <h3>Expert Mode Card</h3>
  <p>This card uses the expert theme.</p>
</nx-card>
```

## Expert Mode Features

### Visual Differences

- More compact spacing
- Different color scheme
- Adapted typography
- Simplified visual styling
- Optimized for data-dense interfaces

### Component Support

Most components support expert mode:
- Cards: `appearance="expert"`
- Tables: Automatically adapt
- Forms: Compact spacing
- Buttons: Expert styling available

## Examples

### Expert Mode Form

```html
<!-- With NxExpertModule imported -->
<form [formGroup]="myForm">
  <nx-formfield labelSize="expert" nxLabel="Email">
    <input nxInput formControlName="email" />
  </nx-formfield>

  <nx-formfield labelSize="expert" nxLabel="Password">
    <input nxInput type="password" formControlName="password" />
  </nx-formfield>

  <button nxButton="primary">Submit</button>
</form>
```

### Expert Mode Data Table

```html
<table nxTable condensed>
  <thead>
    <tr nxTableRow>
      <th nxHeaderCell>ID</th>
      <th nxHeaderCell>Name</th>
      <th nxHeaderCell>Email</th>
      <th nxHeaderCell>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr nxTableRow *ngFor="let user of users">
      <td nxTableCell>{{ user.id }}</td>
      <td nxTableCell>{{ user.name }}</td>
      <td nxTableCell>{{ user.email }}</td>
      <td nxTableCell>{{ user.status }}</td>
    </tr>
  </tbody>
</table>
```

## When to Use Expert Mode

### Good Use Cases
- Internal tools and dashboards
- Data management interfaces
- Professional/power user applications
- High-density information displays
- B2B applications

### Not Recommended For
- Consumer-facing websites
- Marketing pages
- Onboarding flows
- General public applications

## Theming with Expert Mode

```scss
// Customize expert mode colors
[data-nx-expert] {
  --nx-color-primary: #0066cc;
  --nx-card-padding: 1rem;  // More compact
  --nx-spacing-m: 0.75rem;
}
```

## Best Practices

1. **Consistent Application**: Use expert mode globally or not at all
2. **User Preference**: Consider making it a user setting
3. **Test Thoroughly**: Ensure all components work in expert mode
4. **Documentation**: Document which mode is used in your app

---
*ng-aqua v20.6.0 Expert Mode Guide*
