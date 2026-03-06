import 'package:flutter/material.dart';

/// A beautiful navigation bar with Material 3 design and full accessibility support.
class BeautifulNavBar extends StatefulWidget {
  /// Creates a beautiful navigation bar.
  ///
  /// [currentIndex] is the currently selected navigation item index.
  /// [onItemSelected] is called when a navigation item is tapped.
  /// [items] are the navigation items to display.
  const BeautifulNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.items,
    this.backgroundColor,
    this.elevation = 1.0,
    this.height = 70.0,
  });

  /// The currently selected navigation item index.
  final int currentIndex;

  /// Called when a navigation item is tapped.
  final ValueChanged<int> onItemSelected;

  /// The navigation items to display.
  final List<BeautifulNavBarItem> items;

  /// The background color of the navigation bar.
  final Color? backgroundColor;

  /// The elevation of the navigation bar.
  final double elevation;

  /// The height of the navigation bar.
  final double height;

  @override
  State<BeautifulNavBar> createState() => _BeautifulNavBarState();
}

class _BeautifulNavBarState extends State<BeautifulNavBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: widget.elevation * 4,
            offset: Offset(0, -widget.elevation),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: widget.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              widget.items.length,
              (index) => _NavBarItem(
                item: widget.items[index],
                isSelected: index == widget.currentIndex,
                onTap: () => widget.onItemSelected(index),
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A single item in the beautiful navigation bar.
class BeautifulNavBarItem {
  /// Creates a navigation bar item.
  ///
  /// [icon] is the icon to display when the item is not selected.
  /// [selectedIcon] is the icon to display when the item is selected.
  /// [label] is the text label for the item.
  /// [semanticLabel] is the accessibility label for the item.
  const BeautifulNavBarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.semanticLabel,
  });

  /// The icon to display when the item is not selected.
  final IconData icon;

  /// The icon to display when the item is selected.
  final IconData selectedIcon;

  /// The text label for the item.
  final String label;

  /// The accessibility label for the item.
  /// If null, [label] will be used.
  final String? semanticLabel;
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.index,
  });

  final BeautifulNavBarItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Semantics(
      label: item.semanticLabel ?? '${item.label} navigation item',
      button: true,
      selected: isSelected,
      child: ExcludeSemantics(
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isSelected
                  ? colorScheme.primary.withOpacity(0.1)
                  : Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon with smooth transition
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: Icon(
                    isSelected ? item.selectedIcon : item.icon,
                    key: ValueKey(isSelected ? 'selected_$index' : 'unselected_$index'),
                    size: 24.0,
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 4.0),
                // Label with smooth transition
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    item.label,
                    key: ValueKey(isSelected ? 'label_selected_$index' : 'label_unselected_$index'),
                    style: textTheme.labelSmall?.copyWith(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}