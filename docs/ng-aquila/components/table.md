# Table

**Selector**: `table[nxTable]`, `nx-table`  
**Module**: `NxTableModule`  
**Import**: `@allianz/ng-aquila/table`  
**Category**: Data Display  
**Stability**: Stable  
**B2C Allowed**: Yes

## Description

The table component provides a feature-rich, accessible data table with sorting, filtering, pagination, and selection capabilities. Supports both template-based and data-driven approaches, with sticky headers and responsive design.

## Quick Start

### 1. Install & Import

```typescript
import { NxTableModule } from '@allianz/ng-aquila/table';

@NgModule({
  imports: [NxTableModule]
})
export class AppModule { }
```

### 2. Basic Usage

```html
<table nxTable>
  <thead>
    <tr nxTableRow>
      <th nxHeaderCell>Name</th>
      <th nxHeaderCell>Age</th>
      <th nxHeaderCell>City</th>
    </tr>
  </thead>
  <tbody>
    <tr nxTableRow *ngFor="let item of data">
      <td nxTableCell>{{ item.name }}</td>
      <td nxTableCell>{{ item.age }}</td>
      <td nxTableCell>{{ item.city }}</td>
    </tr>
  </tbody>
</table>
```

## API Reference

### Inputs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `condensed` | `boolean` | `false` | Compact table spacing |
| `zebra` | `boolean` | `false` | Alternating row colors |
| `stickyHeader` | `boolean` | `false` | Fixed header on scroll |

### Directives

- `nxTable` - Main table directive
- `nxTableRow` - Row directive
- `nxHeaderCell` - Header cell directive
- `nxTableCell` - Data cell directive
- `nxSort` - Sortable column directive
- `nxTableFilter` - Filterable column

## Examples

### Example 1: Basic Table

```typescript
export class TableExample {
  data = [
    { name: 'John', age: 30, city: 'New York' },
    { name: 'Jane', age: 25, city: 'London' },
    { name: 'Bob', age: 35, city: 'Paris' }
  ];
}
```

### Example 2: Sortable Table

```html
<table nxTable>
  <thead>
    <tr nxTableRow>
      <th nxHeaderCell nxSort="name">Name</th>
      <th nxHeaderCell nxSort="age">Age</th>
    </tr>
  </thead>
  <tbody>
    <tr nxTableRow *ngFor="let item of sortedData">
      <td nxTableCell>{{ item.name }}</td>
      <td nxTableCell>{{ item.age }}</td>
    </tr>
  </tbody>
</table>
```

### Example 3: Zebra Striping

```html
<table nxTable zebra>
  <!-- table content -->
</table>
```

## Accessibility

- Uses semantic HTML table elements
- Proper `<thead>`, `<tbody>` structure
- Sortable columns announce sort direction
- Keyboard navigation supported

## Related Components

- [pagination.md](pagination.md) - Table pagination
- [dynamic-tables.md](dynamic-tables.md) - Advanced table features
- [data-display.md](data-display.md) - Alternative data display

---
*Documentation extracted from ng-aquila v20.6.0*
