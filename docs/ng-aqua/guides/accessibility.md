# Accessibility

## Overview

ng-aqua components are built with accessibility as a core principle. All components follow WAI-ARIA best practices and provide keyboard navigation, screen reader support, and semantic HTML.

## General Principles

### 1. Semantic HTML
All components use appropriate semantic HTML elements:
- Use `<button>` for actions, not divs
- Use `<a>` for navigation
- Use proper heading hierarchy (`<h1>` through `<h6>`)
- Use `<table>` for tabular data

### 2. Keyboard Navigation
All interactive components are keyboard accessible:
- **Tab**: Move focus between interactive elements
- **Shift+Tab**: Move focus backwards
- **Enter/Space**: Activate buttons and links
- **Arrow keys**: Navigate within components (dropdowns, menus, tabs)
- **Escape**: Close overlays and modals

### 3. ARIA Attributes
Components automatically include appropriate ARIA attributes:
- `aria-label`: Labels for icon-only buttons
- `aria-labelledby`: Associate labels with inputs
- `aria-describedby`: Link help text to inputs
- `aria-expanded`: State of collapsible elements
- `aria-selected`: State of selectable items
- `aria-hidden`: Hide decorative elements from screen readers

### 4. Focus Management
- Visible focus indicators on all interactive elements
- Focus trapped in modals
- Focus returned to trigger element when modals close
- Skip links for keyboard users

## Component-Specific Guidelines

### Forms

```html
<!-- Always provide labels -->
<nx-formfield nxLabel="Email Address">
  <input nxInput type="email" formControlName="email" required />
  <nx-formfield-hint>We'll never share your email</nx-formfield-hint>
  <nx-formfield-error *ngIf="errors.email">
    Please enter a valid email address
  </nx-formfield-error>
</nx-formfield>

<!-- Icon buttons need aria-label -->
<button nxIconButton="primary" aria-label="Delete item">
  <nx-icon name="trash"></nx-icon>
</button>

<!-- Required fields -->
<nx-checkbox required [(checked)]="agreed">
  I agree to the terms (required)
</nx-checkbox>
```

### Modals

```html
<!-- Modal automatically manages focus and ARIA -->
<nx-modal [open]="isOpen" (close)="onClose()" ariaLabel="Confirm deletion">
  <h2 nxHeadline="subsection-medium">Confirm Delete</h2>
  <p>Are you sure you want to delete this item?</p>
  <button nxButton="danger" (click)="confirmDelete()">Delete</button>
  <button nxButton="secondary" (click)="onClose()">Cancel</button>
</nx-modal>
```

### DataTables

```html
<!-- Use semantic table elements -->
<table nxTable>
  <caption>Customer List</caption>
  <thead>
    <tr nxTableRow>
      <th nxHeaderCell scope="col">Name</th>
      <th nxHeaderCell scope="col">Email</th>
    </tr>
  </thead>
  <tbody>
    <tr nxTableRow *ngFor="let customer of customers">
      <td nxTableCell>{{ customer.name }}</td>
      <td nxTableCell>{{ customer.email }}</td>
    </tr>
  </tbody>
</table>
```

### Navigation

```html
<!-- Provide skip links -->
<a href="#main-content" class="skip-link">Skip to main content</a>

<!-- Use proper landmarks -->
<header nx-header role="banner">
  <!-- Header content -->
</header>

<nav role="navigation" aria-label="Main navigation">
  <nx-menu><!-- Menu items --></nx-menu>
</nav>

<main id="main-content" role="main">
  <!-- Main content -->
</main>
```

## Testing for Accessibility

### Keyboard Testing
1. Unplug your mouse
2. Navigate through your application using only the keyboard
3. Ensure all interactive elements are reachable
4. Verify focus is visible
5. Test all keyboard shortcuts

### Screen Reader Testing
- **Windows**: NVDA (free), JAWS
- **macOS**: VoiceOver (built-in)
- **Linux**: Orca

### Automated Testing
```bash
# Install axe-core for automated accessibility testing
npm install --save-dev @axe-core/angular

# Run accessibility audits in your tests
```

### Browser Tools
- Chrome DevTools Lighthouse (Accessibility audit)
- axe DevTools extension
- WAVE browser extension

## Common Issues and Solutions

### Issue: Focus not visible
**Solution**: Ensure custom styles don't remove focus outlines
```scss
// Don't do this
* {
  outline: none;
}

// Instead, provide custom visible focus styles
button:focus-visible {
  outline: 2px solid blue;
  outline-offset: 2px;
}
```

### Issue: Icon buttons without labels
**Solution**: Always provide `aria-label` for icon-only buttons
```html
<button nxIconButton="primary" aria-label="Edit profile">
  <nx-icon name="edit"></nx-icon>
</button>
```

### Issue: Dynamic content changes not announced
**Solution**: Use ARIA live regions
```html
<div role="status" aria-live="polite" aria-atomic="true">
  {{ statusMessage }}
</div>
```

### Issue: Color-only information
**Solution**: Don't rely on color alone; use text, icons, or patterns
```html
<!-- Bad -->
<span style="color: red;">Error</span>

<!-- Good -->
<span class="error">
  <nx-icon name="error"></nx-icon>
  Error: Invalid input
</span>
```

## Resources

- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
- [WebAIM](https://webaim.org/)
- [Angular Accessibility](https://angular.io/guide/accessibility)
- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)

---
*ng-aqua v20.6.0 Accessibility Guide*
