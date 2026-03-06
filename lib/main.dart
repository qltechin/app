import 'package:flutter/material.dart';
import 'package:qltechin_app/screens/home_screen.dart';
import 'package:qltechin_app/screens/explore_screen.dart';
import 'package:qltechin_app/screens/favorites_screen.dart';
import 'package:qltechin_app/screens/profile_screen.dart';
import 'package:qltechin_app/widgets/beautiful_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qltechin App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  final List<NavBarItem> _navItems = const [
    NavBarItem(
      icon: Icons.home_filled,
      label: 'Home',
      semanticLabel: 'Navigate to home screen',
    ),
    NavBarItem(
      icon: Icons.explore,
      label: 'Explore',
      semanticLabel: 'Navigate to explore screen',
    ),
    NavBarItem(
      icon: Icons.favorite,
      label: 'Favorites',
      semanticLabel: 'Navigate to favorites screen',
    ),
    NavBarItem(
      icon: Icons.person,
      label: 'Profile',
      semanticLabel: 'Navigate to profile screen',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
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