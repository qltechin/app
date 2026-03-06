# Beautiful Navigation Bar

A modern, accessible navigation bar widget for Flutter applications with Material 3 design.

## Features

- ✅ **Material 3 Design** - Follows the latest Material Design guidelines
- ✅ **Full Accessibility Support** - Proper Semantics widgets for screen readers
- ✅ **Smooth Animations** - Animated transitions between states
- ✅ **Customizable** - Adjust colors, elevation, height, and items
- ✅ **Dark Mode Support** - Automatically adapts to theme
- ✅ **Responsive** - Works on all screen sizes

## Usage

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'widgets/beautiful_nav_bar.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _currentIndex = 0;

  final List<BeautifulNavBarItem> _navItems = const [
    BeautifulNavBarItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: 'Home',
      semanticLabel: 'Home screen',
    ),
    BeautifulNavBarItem(
      icon: Icons.search_outlined,
      selectedIcon: Icons.search,
      label: 'Explore',
      semanticLabel: 'Explore content',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentScreen(),
      bottomNavigationBar: BeautifulNavBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navItems,
      ),
    );
  }
}
```

### Customization Options

```dart
BeautifulNavBar(
  currentIndex: _currentIndex,
  onItemSelected: (index) => setState(() => _currentIndex = index),
  items: _navItems,
  backgroundColor: Theme.of(context).colorScheme.surface, // Custom background
  elevation: 2.0, // Shadow elevation
  height: 80.0, // Custom height
)
```

### Navigation Item Structure

```dart
BeautifulNavBarItem(
  icon: Icons.icon_outlined, // Icon for unselected state
  selectedIcon: Icons.icon_filled, // Icon for selected state
  label: 'Label', // Text label
  semanticLabel: 'Accessibility label', // Optional: for screen readers
)
```

## Accessibility

The navigation bar includes full accessibility support:

1. **Semantic Labels**: Each item has a descriptive label for screen readers
2. **Selection State**: Screen readers announce when an item is selected
3. **Button Role**: Items are marked as buttons for proper navigation
4. **Excluded Semantics**: Prevents duplicate announcements

## Examples

Two examples are provided:

1. **Main Application** (`MainScreen`) - A complete app with navigation
2. **Nav Bar Example** (`BeautifulNavBarExample`) - Feature demonstration

Run the app and choose an example to see the navigation bar in action.

## Best Practices

1. **Use Descriptive Labels**: Provide clear semantic labels for accessibility
2. **Consistent Icons**: Use outlined icons for unselected, filled for selected
3. **Limit Items**: 3-5 items work best for mobile navigation
4. **Test Accessibility**: Verify with screen readers on both platforms