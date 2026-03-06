import 'package:flutter/material.dart';
import 'beautiful_nav_bar.dart';

/// Example screen demonstrating the BeautifulNavBar widget.
class BeautifulNavBarExample extends StatefulWidget {
  /// Creates an example screen for the BeautifulNavBar.
  const BeautifulNavBarExample({super.key});

  @override
  State<BeautifulNavBarExample> createState() => _BeautifulNavBarExampleState();
}

class _BeautifulNavBarExampleState extends State<BeautifulNavBarExample> {
  int _currentIndex = 0;

  /// Example navigation items with different icons and labels.
  final List<BeautifulNavBarItem> _exampleItems = const [
    BeautifulNavBarItem(
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard,
      label: 'Dashboard',
      semanticLabel: 'Go to dashboard',
    ),
    BeautifulNavBarItem(
      icon: Icons.analytics_outlined,
      selectedIcon: Icons.analytics,
      label: 'Analytics',
      semanticLabel: 'View analytics',
    ),
    BeautifulNavBarItem(
      icon: Icons.shopping_cart_outlined,
      selectedIcon: Icons.shopping_cart,
      label: 'Cart',
      semanticLabel: 'View shopping cart',
    ),
    BeautifulNavBarItem(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      label: 'Settings',
      semanticLabel: 'Open settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beautiful Nav Bar Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFeatureCard(
              'Material 3 Design',
              'Follows Material 3 design principles with smooth animations and proper elevation.',
              Icons.design_services,
              Colors.blue,
            ),
            const SizedBox(height: 16.0),
            _buildFeatureCard(
              'Full Accessibility Support',
              'Includes proper Semantics widgets with descriptive labels for screen readers.',
              Icons.accessibility_new,
              Colors.green,
            ),
            const SizedBox(height: 16.0),
            _buildFeatureCard(
              'Smooth Animations',
              'Features smooth transitions between selected and unselected states.',
              Icons.animation,
              Colors.purple,
            ),
            const SizedBox(height: 16.0),
            _buildFeatureCard(
              'Customizable',
              'Easily customize colors, elevation, height, and navigation items.',
              Icons.tune,
              Colors.orange,
            ),
            const SizedBox(height: 32.0),
            _buildCurrentSelection(),
          ],
        ),
      ),
      bottomNavigationBar: BeautifulNavBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _exampleItems,
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 32.0),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentSelection() {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Selection',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Selected: ${_exampleItems[_currentIndex].label}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Index: $_currentIndex',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Try tapping different navigation items above to see the smooth transitions and selection changes.',
              style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}