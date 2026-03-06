import 'package:flutter/material.dart';

/// A beautiful, accessible navigation bar with Material 3 design.
/// 
/// This navigation bar provides a modern, accessible navigation experience
/// with proper semantic labels for screen readers.
class BeautifulNavigationBar extends StatefulWidget {
  /// Creates a beautiful navigation bar.
  /// 
  /// [currentIndex] is the currently selected navigation item index.
  /// [onDestinationSelected] is called when a navigation item is tapped.
  /// [destinations] are the navigation items to display.
  const BeautifulNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  /// The currently selected navigation item index.
  final int currentIndex;

  /// Called when a navigation item is tapped.
  final ValueChanged<int> onDestinationSelected;

  /// The navigation items to display.
  final List<NavigationDestination> destinations;

  @override
  State<BeautifulNavigationBar> createState() => _BeautifulNavigationBarState();
}

class _BeautifulNavigationBarState extends State<BeautifulNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.currentIndex,
      onDestinationSelected: widget.onDestinationSelected,
      destinations: widget.destinations.map((destination) {
        return Semantics(
          label: destination.label,
          button: true,
          child: ExcludeSemantics(
            child: NavigationDestination(
              icon: destination.icon,
              selectedIcon: destination.selectedIcon ?? destination.icon,
              label: destination.label,
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// A beautiful bottom navigation bar with Material 3 design.
/// 
/// This bottom navigation bar provides a modern, accessible navigation experience
/// with proper semantic labels for screen readers.
class BeautifulBottomNavigationBar extends StatefulWidget {
  /// Creates a beautiful bottom navigation bar.
  /// 
  /// [currentIndex] is the currently selected navigation item index.
  /// [onDestinationSelected] is called when a navigation item is tapped.
  /// [items] are the navigation items to display.
  const BeautifulBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.items,
  });

  /// The currently selected navigation item index.
  final int currentIndex;

  /// Called when a navigation item is tapped.
  final ValueChanged<int> onDestinationSelected;

  /// The navigation items to display.
  final List<BottomNavigationBarItem> items;

  @override
  State<BeautifulBottomNavigationBar> createState() => 
      _BeautifulBottomNavigationBarState();
}

class _BeautifulBottomNavigationBarState 
    extends State<BeautifulBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onDestinationSelected,
      items: widget.items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        
        return BottomNavigationBarItem(
          icon: Semantics(
            label: item.label,
            button: true,
            child: ExcludeSemantics(
              child: item.icon,
            ),
          ),
          activeIcon: item.activeIcon != null
              ? Semantics(
                  label: item.label,
                  button: true,
                  child: ExcludeSemantics(
                    child: item.activeIcon!,
                  ),
                )
              : null,
          label: item.label,
        );
      }).toList(),
    );
  }
}