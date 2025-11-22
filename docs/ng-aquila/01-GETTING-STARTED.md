# Getting Started with ng-aquila

## Overview

ng-aquila (Aquila) is an Angular UI component library provided by Allianz Global Digital Factory (GDF). It offers a comprehensive set of 66+ stable components for building modern web applications with Allianz branding or as a white-label solution.

## Prerequisites

- **Node.js**: Install the latest LTS version
- **Angular CLI**: Required for project setup

## Installation

### Automatic Setup (Recommended)

The easiest way to add ng-aquila to a new Angular project:

```bash
# Install Angular CLI globally
npm install -g @angular/cli

# Create a new Angular project
ng new my-allianz-project

# Navigate to your project
cd my-allianz-project

# Add ng-aquila (automatically installs dependencies and configures your project)
ng add @allianz/ng-aquila
```

The `ng add` command will:
- Install `@allianz/ng-aquila` and required peer dependencies
- Configure your Angular project
- Set up necessary imports

### Manual Setup

If you prefer manual installation or are adding to an existing project:

```bash
# Install ng-aquila and Angular CDK
npm install @allianz/ng-aquila @angular/cdk
```

## Basic Configuration

### 1. Add Global Styles

Add the following to your global `styles.css` or `styles.scss`:

```css
/* Set the default background color for Allianz branding */
body {
  background: #0f2a3d;
}
```

### 2. Import Component Modules

Import the specific component modules you need in your Angular module or standalone component:

```typescript
// app.module.ts (for NgModule-based apps)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { NxButtonModule } from '@allianz/ng-aquila/button';
import { NxCardModule } from '@allianz/ng-aquila/card';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    NxButtonModule,
    NxCardModule
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
```

For standalone components (Angular 14+):

```typescript
// app.component.ts
import { Component } from '@angular/core';
import { NxButtonModule } from '@allianz/ng-aquila/button';
import { NxCardModule } from '@allianz/ng-aquila/card';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [NxButtonModule, NxCardModule],
  template: `
    <nx-card>
      <button nxButton="primary">Click me</button>
    </nx-card>
  `
})
export class AppComponent { }
```

### 3. Use Components

```html
<!-- app.component.html -->
<nx-card>
  <h3 nxHeadline="subsection-medium">Welcome to ng-aquila</h3>
  <p nxCopytext>Start building with Allianz components.</p>
  <button nxButton="primary">Get Started</button>
</nx-card>
```

## Import Patterns

ng-aquila follows a modular architecture. Each component has its own module:

```typescript
// Pattern: @allianz/ng-aquila/[component-name]
import { NxButtonModule } from '@allianz/ng-aquila/button';
import { NxInputModule } from '@allianz/ng-aquila/input';
import { NxCheckboxModule } from '@allianz/ng-aquila/checkbox';
import { NxTableModule } from '@allianz/ng-aquila/table';
// ... and so on
```

## Next Steps

- **Browse Components**: See [00-INDEX.md](00-INDEX.md) for a complete list
- **Explore by Category**: Check [categories](categories/) for grouped components
- **Theming**: Read the [Theming Guide](guides/theming.md)
- **Accessibility**: Learn about [Accessibility](guides/accessibility.md) features
- **Official Documentation**: Visit [allianz.github.io/ng-aquila](https://allianz.github.io/ng-aquila)

## Common First Components

Start with these commonly used components:

- **[Button](components/button.md)** - Primary action buttons
- **[Input](components/input.md)** - Text input fields
- **[Card](components/card.md)** - Container component
- **[Grid](components/grid.md)** - Layout grid system
- **[Formfield](components/formfield.md)** - Form field wrapper
- **[Table](components/table.md)** - Data tables

## Resources

- **Documentation**: [https://allianz.github.io/ng-aquila](https://allianz.github.io/ng-aquila)
- **GitHub**: [https://github.com/allianz/ng-aquila](https://github.com/allianz/ng-aquila)
- **Version**: 20.6.0
- **License**: MIT
