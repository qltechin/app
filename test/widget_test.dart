// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qltechin_app/main.dart';

void main() {
  testWidgets('App loads with navigation bar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app loads
    expect(find.byType(MainNavigationScreen), findsOneWidget);
    
    // Verify that the navigation bar is present
    expect(find.byType(BeautifulNavBar), findsOneWidget);
    
    // Verify that home screen is loaded initially
    expect(find.text('Welcome Home'), findsOneWidget);
    
    // Verify navigation items are present
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('Navigation between screens works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Initially on home screen
    expect(find.text('Welcome Home'), findsOneWidget);
    expect(find.text('Explore'), findsNWidgets(1)); // Only in nav bar
    
    // Tap on Explore in navigation bar
    await tester.tap(find.text('Explore').last);
    await tester.pumpAndSettle();
    
    // Should now be on explore screen
    expect(find.text('Explore'), findsNWidgets(2)); // In nav bar and screen title
    expect(find.text('Discover new features'), findsOneWidget);
    
    // Tap on Favorites
    await tester.tap(find.text('Favorites').last);
    await tester.pumpAndSettle();
    
    // Should now be on favorites screen
    expect(find.text('Favorites'), findsNWidgets(2));
    expect(find.text('All your favorite items'), findsOneWidget);
    
    // Tap on Profile
    await tester.tap(find.text('Profile').last);
    await tester.pumpAndSettle();
    
    // Should now be on profile screen
    expect(find.text('Profile'), findsNWidgets(2));
    expect(find.text('Manage your account'), findsOneWidget);
    
    // Tap on Home to return
    await tester.tap(find.text('Home').last);
    await tester.pumpAndSettle();
    
    // Should be back on home screen
    expect(find.text('Welcome Home'), findsOneWidget);
  });
}