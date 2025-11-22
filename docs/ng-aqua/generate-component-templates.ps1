# PowerShell script to generate component documentation templates
$componentsData = @(
    @{Name="accordion"; Category="Layout"; Selector="nx-accordion, nx-expansion-panel"; Module="NxAccordionModule"},
    @{Name="action"; Category="Buttons & Actions"; Selector="button[nxAction]"; Module="NxActionModule"},
    @{Name="autocomplete"; Category="Forms"; Selector="[nxAutocomplete]"; Module="NxAutocompleteModule"},
    @{Name="avatar"; Category="Specialized"; Selector="nx-avatar"; Module="NxAvatarModule"},
    @{Name="badge"; Category="Specialized"; Selector="nx-badge"; Module="NxBadgeModule"},
    @{Name="breadcrumb"; Category="Navigation"; Selector="nx-breadcrumb"; Module="NxBreadcrumbModule"},
    @{Name="circle-toggle"; Category="Forms"; Selector="nx-circle-toggle"; Module="NxCircleToggleModule"},
    @{Name="code-input"; Category="Forms"; Selector="nx-code-input"; Module="NxCodeInputModule"},
    @{Name="comparison-table"; Category="Data Display"; Selector="nx-comparison-table"; Module="NxComparisonTableModule"},
    @{Name="context-menu"; Category="Navigation"; Selector="[nxContextMenu]"; Module="NxContextMenuModule"},
    @{Name="copytext"; Category="Specialized"; Selector="[nxCopytext]"; Module="NxCopytextModule"},
    @{Name="data-display"; Category="Data Display"; Selector="nx-data-display"; Module="NxDataDisplayModule"},
    @{Name="date-field"; Category="Forms"; Selector="nx-date-field"; Module="NxDatefieldModule"},
    @{Name="divider"; Category="Layout"; Selector="nx-divider"; Module="NxDividerModule"},
    @{Name="dynamic-tables"; Category="Data Display"; Selector="nx-dynamic-table"; Module="NxDynamicTableModule"},
    @{Name="file-uploader"; Category="Forms"; Selector="nx-file-uploader"; Module="NxFileUploaderModule"},
    @{Name="footer"; Category="Layout"; Selector="nx-footer"; Module="NxFooterModule"},
    @{Name="formfield"; Category="Forms"; Selector="nx-formfield"; Module="NxFormfieldModule"},
    @{Name="header"; Category="Layout"; Selector="nx-header"; Module="NxHeaderModule"},
    @{Name="headline"; Category="Specialized"; Selector="[nxHeadline]"; Module="NxHeadlineModule"},
    @{Name="icon"; Category="Specialized"; Selector="nx-icon"; Module="NxIconModule"},
    @{Name="image"; Category="Specialized"; Selector="nx-image"; Module="NxImageModule"},
    @{Name="indicator"; Category="Specialized"; Selector="nx-indicator"; Module="NxIndicatorModule"},
    @{Name="link"; Category="Buttons & Actions"; Selector="a[nxLink]"; Module="NxLinkModule"},
    @{Name="list"; Category="Data Display"; Selector="ul[nxList]"; Module="NxListModule"},
    @{Name="menu"; Category="Navigation"; Selector="nx-menu"; Module="NxMenuModule"},
    @{Name="message"; Category="Feedback & Overlays"; Selector="nx-message"; Module="NxMessageModule"},
    @{Name="modal"; Category="Feedback & Overlays"; Selector="nx-modal"; Module="NxModalModule"},
    @{Name="natural-language-form"; Category="Forms"; Selector="nx-natural-language-form"; Module="NxNaturalLanguageFormModule"},
    @{Name="notification"; Category="Feedback & Overlays"; Selector="nx-notification"; Module="NxNotificationModule"},
    @{Name="number-stepper"; Category="Forms"; Selector="nx-number-stepper"; Module="NxNumberStepperModule"},
    @{Name="overlay"; Category="Feedback & Overlays"; Selector="nx-overlay"; Module="NxOverlayModule"},
    @{Name="pagination"; Category="Data Display"; Selector="nx-pagination"; Module="NxPaginationModule"},
    @{Name="phone-input"; Category="Forms"; Selector="nx-phone-input"; Module="NxPhoneInputModule"},
    @{Name="popover"; Category="Feedback & Overlays"; Selector="[nxPopover]"; Module="NxPopoverModule"},
    @{Name="progress-bar"; Category="Feedback & Overlays"; Selector="nx-progress-bar"; Module="NxProgressBarModule"},
    @{Name="progress-stepper"; Category="Data Display"; Selector="nx-progress-stepper"; Module="NxProgressStepperModule"},
    @{Name="radio-button"; Category="Forms"; Selector="nx-radio-button"; Module="NxRadioModule"},
    @{Name="rating"; Category="Buttons & Actions"; Selector="nx-rating"; Module="NxRatingModule"},
    @{Name="sidepanel"; Category="Navigation"; Selector="nx-sidepanel"; Module="NxSidepanelModule"},
    @{Name="sidebar"; Category="Navigation"; Selector="nx-sidebar"; Module="NxSidebarModule"},
    @{Name="slider"; Category="Forms"; Selector="nx-slider"; Module="NxSliderModule"},
    @{Name="small-stage"; Category="Layout"; Selector="nx-small-stage"; Module="NxSmallStageModule"},
    @{Name="spinner"; Category="Feedback & Overlays"; Selector="nx-spinner"; Module="NxSpinnerModule"},
    @{Name="swipebar"; Category="Navigation"; Selector="nx-swipebar"; Module="NxSwipebarModule"},
    @{Name="switcher"; Category="Forms"; Selector="nx-switcher"; Module="NxSwitcherModule"},
    @{Name="tabs"; Category="Navigation"; Selector="nx-tab-group"; Module="NxTabsModule"},
    @{Name="tag"; Category="Specialized"; Selector="nx-tag"; Module="NxTagModule"},
    @{Name="text"; Category="Specialized"; Selector="[nxText]"; Module="NxTextModule"},
    @{Name="tile"; Category="Layout"; Selector="nx-tile"; Module="NxTileModule"},
    @{Name="timefield"; Category="Forms"; Selector="nx-timefield"; Module="NxTimefieldModule"},
    @{Name="toggle-button"; Category="Forms"; Selector="nx-toggle-button-group"; Module="NxToggleButtonModule"},
    @{Name="toolbar"; Category="Specialized"; Selector="nx-toolbar"; Module="NxToolbarModule"},
    @{Name="tooltip"; Category="Feedback & Overlays"; Selector="[nxTooltip]"; Module="NxTooltipModule"},
    @{Name="tree"; Category="Data Display"; Selector="nx-tree"; Module="NxTreeModule"},
    @{Name="video"; Category="Specialized"; Selector="nx-video"; Module="NxVideoModule"}
)

$targetDir = "d:\Projects\AI\Antigravity\docs\ng-aqua\components"
$count = 0

foreach ($comp in $componentsData) {
    $name = $comp.Name
    $title = (Get-Culture).TextInfo.ToTitleCase($name.Replace('-', ' '))
    $filePath = Join-Path $targetDir "$name.md"
    
    if (-not (Test-Path $filePath)) {
        $content = "# $title`n`n"
        $content += "**Selector**: ``$($comp.Selector)```n"
        $content += "**Module**: ``$($comp.Module)```n"
        $content += "**Import**: ``@allianz/ng-aqua/$name```n"
        $content += "**Category**: $($comp.Category)`n"
        $content += "**Stability**: Stable`n"
        $content += "**B2C Allowed**: Yes`n`n"
        $content += "## Description`n`n"
        $content += "The ``$name`` component provides functionality for $title. Part of the ng-aqua component library.`n`n"
        $content += "## Quick Start`n`n"
        $content += "### 1. Install & Import`n`n"
        $content += '```typescript'
        $content += "`nimport { $($comp.Module) } from '@allianz/ng-aqua/$name';`n`n"
        $content += "@NgModule({`n  imports: [$($comp.Module)]`n})`n"
        $content += "export class AppModule { }`n"
        $content += '```'
        $content += "`n`n### 2. Basic Usage`n`n"
        $content += '```html'
        $content += "`n<!-- Basic example -->`n<!-- See official documentation for usage -->`n"
        $content += '```'
        $content += "`n`n## API Reference`n`n"
        $content += "See [ng-aqua documentation](https://allianz.github.io/ng-aqua/documentation/$name) for complete API details.`n`n"
        $content += "## Related Components`n`n- See [00-INDEX.md](../00-INDEX.md) for related components`n`n---`n"
        $content += "*Documentation template for ng-aqua v20.6.0*`n"
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $count++
        Write-Host "Created: $name.md"
    } else {
        Write-Host "Skipped (exists): $name.md"
    }
}

Write-Host "`nGeneration complete! Created $count new files."
