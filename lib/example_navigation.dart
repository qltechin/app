import 'package:flutter/material.dart';
import 'widgets/beautiful_nav_bar.dart';

/// Example showing how to use the BeautifulNavBar in a simple app
class ExampleNavigationApp extends StatelessWidget {
  const ExampleNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Nav Bar Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExampleNavigationScreen(),
    );
  }
}

class ExampleNavigationScreen extends StatefulWidget {
  const ExampleNavigationScreen({super.key});

  @override
  State<ExampleNavigationScreen> createState() => _ExampleNavigationScreenState();
}

class _ExampleNavigationScreenState extends State<ExampleNavigationScreen> {
  int _currentIndex = 0;

  final List<Color> _pageColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  final List<NavBarItem> _navItems = const [
    NavBarItem(
      icon: Icons.dashboard,
      label: 'Dashboard',
      semanticLabel: 'Navigate to dashboard',
    ),
    NavBarItem(
      icon: Icons.shopping_cart,
      label: 'Cart',
      semanticLabel: 'Navigate to shopping cart',
    ),
    NavBarItem(
      icon: Icons.notifications,
      label: 'Alerts',
      semanticLabel: 'Navigate to notifications',
    ),
    NavBarItem(
      icon: Icons.settings,
      label: 'Settings',
      semanticLabel: 'Navigate to settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beautiful Nav Bar Example'),
        backgroundColor: _pageColors[_currentIndex].withOpacity(0.1),
      ),
      body: Container(
        color: _pageColors[_currentIndex].withOpacity(0.05),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _navItems[_currentIndex].icon,
                size: 80,
                color: _pageColors[_currentIndex],
              ),
              const SizedBox(height: 20),
              Text(
                _navItems[_currentIndex].label,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: _pageColors[_currentIndex],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'This is the ${_navItems[_currentIndex].label.toLowerCase()} page. '
                  'Tap on different items in the navigation bar below to switch pages.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BeautifulNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navItems,
      ),
    );
  }
}