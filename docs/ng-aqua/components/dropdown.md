# Dropdown

**Selector**: `nx-dropdown`  
**Module**: `NxDropdownModule`  
**Import**: `@allianz/ng-aqua/dropdown`  
**Category**: Forms  
**Stability**: Stable  
**B2C Allowed**: Yes

## Description

A dropdown select component with support for single and multi-select, filtering, custom rendering, and keyboard navigation. Works with Angular forms and provides a rich, accessible selection experience.

## Quick Start

### 1. Install & Import

```typescript
import { NxDropdownModule } from '@allianz/ng-aqua/dropdown';

@NgModule({
  imports: [NxDropdownModule]
})
export class AppModule { }
```

### 2. Basic Usage

```html
<nx-formfield nxLabel="Select Country">
  <nx-dropdown [(ngModel)]="selectedCountry">
    <nx-dropdown-item *ngFor="let country of countries" [value]="country.code">
      {{ country.name }}
    </nx-dropdown-item>
  </nx-dropdown>
</nx-formfield>
```

## API Reference

### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `disabled` | `boolean` | `false` | Disables the dropdown |
| `required` | `boolean` | `false` | Marks as required |
| `filter` | `boolean` | `false` | Enables filtering/search |
| `multi` | `boolean` | `false` | Multi-select mode |
| `placeholder` | `string` | `''` | Placeholder text |
| `panelMaxHeight` | `string` | `'256px'` | Max height of dropdown panel |

### Outputs

| Event | Payload | Description |
|-------|---------|-------------|
| `selectionChange` | Selection | Emits on selection change |
| `openedChange` | `boolean` | Emits when dropdown opens/closes |

## Examples

### Example 1: Basic Dropdown

```typescript
export class DropdownExample {
  selectedCountry = 'de';
  
  countries = [
    { code: 'us', name: 'United States' },
    { code: 'de', name: 'Germany' },
    { code: 'uk', name: 'United Kingdom' }
  ];
}
```

### Example 2: Filterable Dropdown

```html
<nx-dropdown [(ngModel)]="selected" filter placeholder="Search...">
  <nx-dropdown-item *ngFor="let item of items" [value]="item.id">
    {{ item.name }}
  </nx-dropdown-item>
</nx-dropdown>
```

### Example 3: Multi-Select

```html
<nx-dropdown [(ngModel)]="selectedIds" multi>
  <nx-dropdown-item *ngFor="let item of items" [value]="item.id">
    {{ item.name }}
  </nx-dropdown-item>
</nx-dropdown>
```

## Accessibility

- Full keyboard navigation (Arrow keys, Enter, Escape)
- ARIA attributes for screen readers
- Focus management
- Searchable with filter enabled

## Related Components

- [autocomplete.md](autocomplete.md) - Autocomplete input
- [formfield.md](formfield.md) - Form field wrapper
- [select (native)] - Native HTML select

---
*Documentation extracted from ng-aqua v20.6.0*
