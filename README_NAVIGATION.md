# Beautiful Navigation Bar Implementation

## Overview

This implementation provides two beautiful, accessible navigation bar components for the QLTechin Flutter app:

1. **BeautifulNavigationBar** - A Material 3 style navigation bar for the top of the screen
2. **BeautifulBottomNavigationBar** - A traditional bottom navigation bar with Material 3 styling

## Features

### 1. Material 3 Design
- Modern Material 3 design language
- Proper elevation and shadows
- Adaptive to light/dark themes
- Smooth animations and transitions

### 2. Full Accessibility Support
- Semantic labels for screen readers
- Proper button semantics
- ExcludeSemantics to prevent duplicate announcements
- Keyboard navigation support

### 3. Customizable
- Custom icons and labels
- Active/inactive icon states
- Theming through ThemeData
- Flexible layout options

## Usage

### Basic Navigation Bar (Top)

```dart
import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: _buildScreenContent(),
      navigationBar: BeautifulNavigationBar(
        currentIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
```

### Bottom Navigation Bar

```dart
bottomNavigationBar: BeautifulBottomNavigationBar(
  currentIndex: _currentIndex,
  onDestinationSelected: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
    ),
  ],
),
```

## Files Created

1. **lib/navigation_bar.dart** - Contains both navigation bar widgets
2. **lib/main.dart** - Updated with complete example app
3. **test/navigation_bar_test.dart** - Unit tests for navigation bars
4. **test/widget_test.dart** - Updated widget tests

## Testing

Run the tests with:

```bash
flutter test
```

Tests cover:
- Widget rendering
- Navigation functionality
- Accessibility features
- Basic interaction

## Best Practices

1. **Use Descriptive Labels**: Labels should clearly describe the destination
2. **Provide Both Icons**: Always provide both regular and selected icons
3. **Test Accessibility**: Test with screen readers enabled
4. **Limit Items**: Keep to 3-5 navigation items for optimal usability
5. **Follow Material Guidelines**: Adhere to Material Design 3 specifications

## Integration with PageView

The example in `main.dart` shows how to integrate with `PageController` for smooth screen transitions:

```dart
final PageController _pageController = PageController();

// In build method:
body: PageView(
  controller: _pageController,
  onPageChanged: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  children: _screens,
),

// In onDestinationSelected:
onDestinationSelected: (index) {
  setState(() {
    _currentIndex = index;
    _pageController.jumpToPage(index);
  });
},
```

## Theming

The navigation bars automatically adapt to your app's theme. Customize through:

```dart
ThemeData(
  navigationBarTheme: NavigationBarThemeData(
    elevation: 4,
    height: 70,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 8,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
)
```