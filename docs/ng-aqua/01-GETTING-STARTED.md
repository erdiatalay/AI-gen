# Getting Started with ng-aqua

## Overview

ng-aqua (Aquila) is an Angular UI component library provided by Allianz Global Digital Factory (GDF). It offers a comprehensive set of 66+ stable components for building modern web applications with Allianz branding or as a white-label solution.

## Prerequisites

- **Node.js**: Install the latest LTS version
- **Angular CLI**: Required for project setup

## Installation

### Automatic Setup (Recommended)

The easiest way to add ng-aqua to a new Angular project:

```bash
# Install Angular CLI globally
npm install -g @angular/cli

# Create a new Angular project
ng new my-allianz-project

# Navigate to your project
cd my-allianz-project

# Add ng-aqua (automatically installs dependencies and configures your project)
ng add @allianz/ng-aqua
```

The `ng add` command will:
- Install `@allianz/ng-aqua` and required peer dependencies
- Configure your Angular project
- Set up necessary imports

### Manual Setup

If you prefer manual installation or are adding to an existing project:

```bash
# Install ng-aqua and Angular CDK
npm install @allianz/ng-aqua @angular/cdk
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
import { NxButtonModule } from '@allianz/ng-aqua/button';
import { NxCardModule } from '@allianz/ng-aqua/card';

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
import { NxButtonModule } from '@allianz/ng-aqua/button';
import { NxCardModule } from '@allianz/ng-aqua/card';

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
  <h3 nxHeadline="subsection-medium">Welcome to ng-aqua</h3>
  <p nxCopytext>Start building with Allianz components.</p>
  <button nxButton="primary">Get Started</button>
</nx-card>
```

## Import Patterns

ng-aqua follows a modular architecture. Each component has its own module:

```typescript
// Pattern: @allianz/ng-aqua/[component-name]
import { NxButtonModule } from '@allianz/ng-aqua/button';
import { NxInputModule } from '@allianz/ng-aqua/input';
import { NxCheckboxModule } from '@allianz/ng-aqua/checkbox';
import { NxTableModule } from '@allianz/ng-aqua/table';
// ... and so on
```

## Next Steps

- **Browse Components**: See [00-INDEX.md](00-INDEX.md) for a complete list
- **Explore by Category**: Check [categories](categories/) for grouped components
- **Theming**: Read the [Theming Guide](guides/theming.md)
- **Accessibility**: Learn about [Accessibility](guides/accessibility.md) features
- **Official Documentation**: Visit [allianz.github.io/ng-aqua](https://allianz.github.io/ng-aqua)

## Common First Components

Start with these commonly used components:

- **[Button](components/button.md)** - Primary action buttons
- **[Input](components/input.md)** - Text input fields
- **[Card](components/card.md)** - Container component
- **[Grid](components/grid.md)** - Layout grid system
- **[Formfield](components/formfield.md)** - Form field wrapper
- **[Table](components/table.md)** - Data tables

## Resources

- **Documentation**: [https://allianz.github.io/ng-aqua](https://allianz.github.io/ng-aqua)
- **GitHub**: [https://github.com/allianz/ng-aqua](https://github.com/allianz/ng-aqua)
- **Version**: 20.6.0
- **License**: MIT
