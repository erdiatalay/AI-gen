# Right-to-Left (RTL) Support

## Overview

ng-aqua provides comprehensive support for right-to-left (RTL) languages such as Arabic, Hebrew, and Persian. RTL support is built into all components and can be enabled globally or per-component.

## Enabling RTL

### Global RTL

Enable RTL for the entire application:

```typescript
// app.component.ts
import { Directionality } from '@angular/cdk/bidi';

export class AppComponent {
  constructor(private dir: Directionality) {
    this.dir.value = 'rtl';
  }
}
```

Or in HTML:

```html
<html dir="rtl">
  <body>
    <!-- Your app -->
  </body>
</html>
```

### Module-Based RTL

```typescript
import { BidiModule } from '@angular/cdk/bidi';

@NgModule({
  imports: [BidiModule]
})
export class AppModule { }
```

```html
<div dir="rtl">
  <!-- RTL content -->
</div>

<div dir="ltr">
  <!-- LTR content -->
</div>
```

## Component Behavior

All ng-aqua components automatically adapt to RTL mode:

### Layout
- Grid columns flow right-to-left
- Margins and padding mirror automatically
- Flexbox direction reverses

### Navigation
- Menus open from right
- Breadcrumbs flow right-to-left
- Tabs start from right

### Forms
- Icons and affixes swap sides
- Validation icons appear on left
- Dropdown arrows mirror

## Examples

### RTL Form

```html
<div dir="rtl">
  <form [formGroup]="myForm">
    <nx-formfield nxLabel="الاسم">
      <input nxInput formControlName="name" />
    </nx-formfield>
    
    <nx-formfield nxLabel="البريد الإلكتروني">
      <input nxInput type="email" formControlName="email" />
    </nx-formfield>
    
    <button nxButton="primary">إرسال</button>
  </form>
</div>
```

### Bi-Directional Content

```html
<div dir="rtl">
  <p nxCopytext>هذا نص بالعربية</p>
  
  <div dir="ltr">
    <p nxCopytext>This is English text within RTL context</p>
  </div>
  
  <p nxCopytext>المزيد من النص بالعربية</p>
</div>
```

## CSS Considerations

### Logical Properties

Use CSS logical properties for RTL compatibility:

```scss
// Instead of margin-left/right
.element {
  margin-inline-start: 1rem;  // Adapts to direction
  margin-inline-end: 0.5rem;
}

// Instead of padding-left/right
.element {
  padding-inline: 1rem;  // Horizontal padding
}

// Instead of left/right positioning
.element {
  inset-inline-start: 0;  // Replaces 'left: 0'
}
```

### Border Radius

```scss
// Logical border radius
.element {
  border-start-start-radius: 0.5rem;  // Top-left in LTR, top-right in RTL
  border-start-end-radius: 0.5rem;    // Top-right in LTR, top-left in RTL
}
```

## Testing RTL

### Browser DevTools

```javascript
// Toggle RTL in browser console
document.dir = 'rtl';
```

### Angular Testing

```typescript
it('should support RTL', () => {
  const dir = TestBed.inject(Directionality);
  dir.value = 'rtl';
  fixture.detectChanges();
  
  expect(component.isRtl).toBe(true);
});
```

## Best Practices

1. **Test Both Directions**: Always test your application in both LTR and RTL
2. **Use Logical Properties**: Prefer logical CSS properties over directional ones
3. **Avoid Hardcoded Directions**: Don't assume left-to-right flow
4. **Icon Orientation**: Some icons (arrows) should mirror in RTL, others shouldn't
5. **Text Alignment**: Use `start` and `end` instead of `left` and `right`

## Common Gotchas

### Icons
```html
<!-- This arrow should mirror in RTL -->
<nx-icon name="arrow-right" class="mirror-rtl"></nx-icon>

<!-- This icon should NOT mirror -->
<nx-icon name="phone"></nx-icon>
```

### Flexbox
```scss
// Use logical flex properties
.container {
  justify-content: flex-start;  // Will adapt to direction
}
```

### Absolute Positioning
```scss
//Bad
.element {
  left: 10px;  // Won't mirror
}

// Good
.element {
  inset-inline-start: 10px;  // Will mirror
}
```

## Resources

- [MDN: CSS Logical Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Logical_Properties)
- [Angular CDK Bidirectionality](https://material.angular.io/cdk/bidi/overview)
- [RTL Styling Guidelines](https://rtlstyling.com/)

---
*ng-aqua v20.6.0 RTL Support Guide*
