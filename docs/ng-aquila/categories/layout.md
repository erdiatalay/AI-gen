# Layout Components

## Overview

Layout components provide the structural foundation for ng-aquila applications. They help organize content, create responsive designs, and establish visual hierarchy.

## Components in this Category

### Grid
**File**: [grid.md](../components/grid.md)  
**Quick Description**: 12-column responsive flexbox grid system  
**Common Use**: Page layouts, responsive columns, content organization

### Card
**File**: [card.md](../components/card.md)  
**Quick Description**: Versatile content container with selectable variants  
**Common Use**: Grouping related content, selectable options, visual containers

### Accordion
**File**: [accordion.md](../components/accordion.md)  
**Quick Description**: Expandable/collapsible content panels  
**Common Use**: FAQs, progressive disclosure, content organization

### Divider
**File**: [divider.md](../components/divider.md)  
**Quick Description**: Visual separator between content sections  
**Common Use**: Separating content, visual breaks, section dividers

### Footer
**File**: [footer.md](../components/footer.md)  
**Quick Description**: Page footer component  
**Common Use**: Site footer, legal information, navigation links

### Header
**File**: [header.md](../components/header.md)  
**Quick Description**: Page header component  
**Common Use**: Site header, branding, navigation

### Small Stage
**File**: [small-stage.md](../components/small-stage.md)  
**Quick Description**: Hero/banner section component  
**Common Use**: Page headers, hero sections, feature highlights

### Tile
**File**: [tile.md](../components/tile.md)  
**Quick Description**: Tile-based layout component  
**Common Use**: Dashboard tiles, grid-based content

## Common Patterns

### Pattern 1: Responsive Grid Layout

```html
<div nxLayout="grid">
  <div nxRow>
    <div nxCol="12,12,8,8">
      <nx-card>
        <h2>Main Content</h2>
        <p>Responsive main area...</p>
      </nx-card>
    </div>
    <div nxCol="12,12,4,4">
      <nx-card>
        <h3>Sidebar</h3>
        <p>Responsive sidebar...</p>
      </nx-card>
    </div>
  </div>
</div>
```

### Pattern 2: Card Grid

```html
<div nxLayout="grid">
  <div nxRow>
    <div *ngFor="let item of items" nxCol="12,6,4,3">
      <nx-card>
        <h3>{{ item.title }}</h3>
        <p>{{ item.description }}</p>
      </nx-card>
    </div>
  </div>
</div>
```

### Pattern 3: Accordion FAQ

```html
<nx-accordion>
  <nx-expansion-panel *ngFor="let faq of faqs">
    <nx-expansion-panel-header>
      {{ faq.question }}
    </nx-expansion-panel-header>
    <p>{{ faq.answer }}</p>
  </nx-expansion-panel>
</nx-accordion>
```

## Category-Specific Guidelines

- Use Grid for responsive layouts across all breakpoints
- Wrap related content in Cards for visual grouping
- Use Dividers sparingly to avoid visual clutter
- Keep Accordion panels concise and scannable
- Ensure layouts work on mobile, tablet, and desktop

## Related Guides

- [Layout Patterns](../guides/layout-patterns.md) - Layout best practices
- [Accessibility](../guides/accessibility.md) - Accessible layouts
