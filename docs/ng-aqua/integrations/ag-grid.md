# Ag-Grid Integration

## Overview

ng-aqua provides integration with AG-Grid, a powerful data grid library for enterprise applications. This integration ensures AG-Grid uses ng-aqua styling.

## Installation

```bash
npm install @allianz/ng-aqua/ag-grid
npm install ag-grid-angular ag-grid-community
```

## Setup

### Import Module

```typescript
import { NxAgGridModule } from '@allianz/ng-aqua/ag-grid';
import { AgGridModule } from 'ag-grid-angular';

@NgModule({
  imports: [
    NxAgGridModule,
    AgGridModule
  ]
})
export class AppModule { }
```

### Add CSS

```scss
// styles.scss
@import 'ag-grid-community/styles/ag-grid.css';
@import 'ag-grid-community/styles/ag-theme-alpine.css';
```

## Basic Usage

```html
<ag-grid-angular
  class="ag-theme-alpine nx-ag-grid"
  [rowData]="rowData"
  [columnDefs]="columnDefs"
  [defaultColDef]="defaultColDef"
  (gridReady)="onGridReady($event)">
</ag-grid-angular>
```

```typescript
export class MyGridComponent {
  columnDefs = [
    { field: 'name', sortable: true, filter: true },
    { field: 'age', sortable: true, filter: true },
    { field: 'email', sortable: true, filter: true }
  ];

  rowData = [
    { name: 'John Doe', age: 30, email: 'john@example.com' },
    { name: 'Jane Smith', age: 25, email: 'jane@example.com' }
  ];

  defaultColDef = {
    flex: 1,
    minWidth: 100,
    resizable: true
  };

  onGridReady(params: any) {
    params.api.sizeColumnsToFit();
  }
}
```

## Features

- ng-aqua theme styling
- Responsive grid
- Sorting and filtering
- Column resizing
- Pagination
- Row selection
- Custom cell renderers

## Resources

- [AG-Grid Documentation](https://www.ag-grid.com/angular-data-grid/)
- [ng-aqua AG-Grid Examples](https://allianz.github.io/ng-aqua/documentation/ag-grid)

---
*ng-aqua v20.6.0 AG-Grid Integration*
