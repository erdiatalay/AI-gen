# Layout Patterns

## Overview

Common layout patterns and best practices for building ng-aqua applications.

## Page Layouts

### Standard Page Layout

```html
<div nxLayout="grid" maxwidth>
  <!-- Header -->
  <nx-header>
    <h1 nxHeadline="page">Page Title</h1>
  </nx-header>

  <!-- Main Content -->
  <div nxRow>
    <main nxCol="12" role="main">
      <nx-card>
        <!-- Page content -->
      </nx-card>
    </main>
  </div>

  <!-- Footer -->
  <nx-footer>
    <p nxCopytext="small">© 2024 Company Name</p>
  </nx-footer>
</div>
```

### Sidebar Layout

```html
<div nxLayout="grid">
  <div nxRow>
    <aside nxCol="12,12,3,3">
      <nx-sidebar>
        <!-- Navigation -->
      </nx-sidebar>
    </aside>

    <main nxCol="12,12,9,9">
      <nx-card>
        <!-- Main content -->
      </nx-card>
    </main>
  </div>
</div>
```

### Two-Column Form

```html
<form [formGroup]="myForm">
  <div nxLayout="grid">
    <div nxRow>
      <div nxCol="12,12,6,6">
        <nx-formfield nxLabel="First Name">
          <input nxInput formControlName="firstName" />
        </nx-formfield>
      </div>

      <div nxCol="12,12,6,6">
        <nx-formfield nxLabel="Last Name">
          <input nxInput formControlName="lastName" />
        </nx-formfield>
      </div>
    </div>

    <dive nxRow>
      <div nxCol="12">
        <nx-formfield nxLabel="Email">
          <input nxInput type="email" formControlName="email" />
        </nx-formfield>
      </div>
    </div>
  </div>
</form>
```

## Dashboard Layouts

### Card Grid Dashboard

```html
<div nxLayout="grid">
  <div nxRow>
    <!-- Stat cards -->
    <div *ngFor="let stat of stats" nxCol="12,6,4,3">
      <nx-card>
        <h3 nxHeadline="subsection-small">{{ stat.title }}</h3>
        <p nxHeadline="section">{{ stat.value }}</p>
        <p nxCopytext="small">{{ stat.change }}</p>
      </nx-card>
    </div>
  </div>

  <div nxRow>
    <!-- Main content area -->
    <div nxCol="12,12,8,8">
      <nx-card>
        <h2 nxHeadline="subsection-medium">Recent Activity</h2>
        <table nxTable>
          <!-- Activity table -->
        </table>
      </nx-card>
    </div>

    <!-- Sidebar widget -->
    <div nxCol="12,12,4,4">
      <nx-card>
        <h3 nxHeadline="subsection-small">Quick Actions</h3>
        <!-- Actions -->
      </nx-card>
    </div>
  </div>
</div>
```

## Best Practices

1. **Mobile-First**: Always start with mobile breakpoints (12 columns)
2. **Consistent Spacing**: Use standard grid gutters
3. **Max Width**: Use `maxwidth` for content containers
4. **Semantic HTML**: Use `<main>`, `<aside>`, `<section>`, `<article>`
5. **Responsive**: Test at all breakpoints

---
*ng-aqua v20.6.0 Layout Patterns Guide*
