import 'package:flutter/material.dart';
import '../widgets/beautiful_nav_bar.dart';

/// The main screen of the application with a beautiful navigation bar.
class MainScreen extends StatefulWidget {
  /// Creates the main screen.
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  /// Navigation items for the beautiful navigation bar.
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
    BeautifulNavBarItem(
      icon: Icons.add_circle_outline,
      selectedIcon: Icons.add_circle,
      label: 'Create',
      semanticLabel: 'Create new content',
    ),
    BeautifulNavBarItem(
      icon: Icons.notifications_outlined,
      selectedIcon: Icons.notifications,
      label: 'Notifications',
      semanticLabel: 'View notifications',
    ),
    BeautifulNavBarItem(
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: 'Profile',
      semanticLabel: 'Your profile',
    ),
  ];

  /// Content for each navigation tab.
  final List<Widget> _screens = [
    _buildScreen('Home', Icons.home, Colors.blue),
    _buildScreen('Explore', Icons.explore, Colors.green),
    _buildScreen('Create', Icons.add, Colors.orange),
    _buildScreen('Notifications', Icons.notifications, Colors.purple),
    _buildScreen('Profile', Icons.person, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QLTechin App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BeautifulNavBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navItems,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 2.0,
        height: 80.0,
      ),
    );
  }

  /// Builds a sample screen for demonstration.
  static Widget _buildScreen(String title, IconData icon, Color color) {
    return Container(
      color: color.withOpacity(0.05),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64.0,
              color: color,
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'This is the $title screen. Tap on different navigation items to switch between screens.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}