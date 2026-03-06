# Beautiful Navigation Bar Widget

## Overview
The `BeautifulNavBar` is a modern, animated navigation bar component that provides an elegant user experience with smooth transitions and visual feedback.

## Features
- **Smooth Animations**: All state changes are animated with 300ms transitions
- **Visual Feedback**: Selected items have gradient backgrounds and indicator dots
- **Accessibility**: Full semantic support for screen readers
- **Responsive Design**: Adapts to different screen sizes
- **Material 3**: Follows Material Design 3 guidelines
- **Customizable**: Easy to configure with different icons and labels

## Usage

```dart
BeautifulNavBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: const [
    NavBarItem(
      icon: Icons.home,
      label: 'Home',
      semanticLabel: 'Navigate to home screen',
    ),
    NavBarItem(
      icon: Icons.explore,
      label: 'Explore',
      semanticLabel: 'Navigate to explore screen',
    ),
    // Add more items as needed
  ],
)
```

## Accessibility
The navigation bar includes proper semantic labels for screen readers:
- Each item has a descriptive semantic label
- Uses `ExcludeSemantics` to prevent duplicate announcements
- Sets `button: true` for proper screen reader interaction

## Styling
The navigation bar automatically adapts to the app's theme:
- Uses `Theme.of(context).colorScheme` for colors
- Supports light and dark themes
- Follows Material 3 design principles

## Animation Details
- **Container Animation**: 300ms ease-in-out for background changes
- **Text Animation**: Font weight and size changes for selected state
- **Indicator Dot**: Small dot appears on selected items
- **Icon Background**: Circular background fade-in animation