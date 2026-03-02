# QLTech Dashboard - CTA Design System

A Flutter web application demonstrating best practices for Call-to-Action (CTA) design and implementation.

## Features

### 1. Comprehensive CTA Design System
- **Primary CTAs**: Main actions with prominent styling
- **Secondary CTAs**: Alternative actions with outlined styling
- **Tertiary CTAs**: Text links for navigation
- **Specialized CTAs**: Success and warning states

### 2. Action-Oriented Language
All CTAs use clear, outcome-focused language:
- "Start Building" instead of "Submit"
- "Launch Project" instead of "Create"
- "Generate Performance Report" instead of "Generate Report"
- "Invite Team Member" instead of "Add Member"

### 3. Accessibility First
Every interactive widget includes proper semantic labels for screen readers:
- Descriptive action labels
- Proper semantic flags (button, link, textField)
- ExcludeSemantics to prevent duplicate announcements

### 4. Visual Hierarchy
- Clear size differentiation (52px primary, 48px secondary)
- Consistent spacing and padding
- Icon support for visual recognition
- Loading states with progress indicators

## App Structure

### Screens
1. **Home Screen**: Quick actions and project status
2. **Projects Screen**: Project creation and management
3. **Reports Screen**: Report generation and viewing
4. **Team Screen**: Team member management
5. **CTA Examples**: Before/after comparisons and guidelines

### Components
- `lib/cta_components.dart`: Reusable CTA widget library
- `lib/main.dart`: Main application with all screens
- `CTA_IMPROVEMENTS.md`: Detailed documentation of changes

## CTA Design Principles

### 1. Be Action-Oriented
- Use verbs that describe the action
- Focus on the outcome, not the process
- Avoid generic labels like "Submit", "Click Here", "Proceed"

### 2. Maintain Visual Hierarchy
- One primary CTA per section
- Use secondary CTAs for alternative actions
- Use tertiary CTAs for navigation and additional options

### 3. Ensure Accessibility
- Add semantic labels describing the action
- Include proper semantic flags
- Test with screen readers

### 4. Provide Feedback
- Show loading states for async actions
- Provide success/error messages
- Use hover and active states

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## CTA Improvements

See `CTA_IMPROVEMENTS.md` for detailed documentation of the CTA redesign process, including before/after comparisons and design system specifications.