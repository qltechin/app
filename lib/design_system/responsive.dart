import 'package:flutter/material.dart';

/// Responsive layout utilities for Flutter Web
class Responsive {
  final BuildContext context;
  
  Responsive(this.context);
  
  /// Get current screen width
  double get width => MediaQuery.of(context).size.width;
  
  /// Get current screen height
  double get height => MediaQuery.of(context).size.height;
  
  /// Check if screen is mobile
  bool get isMobile => width < DesignSystem.mobileBreakpoint;
  
  /// Check if screen is tablet
  bool get isTablet => 
      width >= DesignSystem.mobileBreakpoint && 
      width < DesignSystem.tabletBreakpoint;
  
  /// Check if screen is desktop
  bool get isDesktop => width >= DesignSystem.desktopBreakpoint;
  
  /// Get responsive padding based on screen size
  EdgeInsets get responsivePadding => EdgeInsets.symmetric(
    horizontal: isMobile 
        ? DesignSystem.spacingMd 
        : isTablet 
            ? DesignSystem.spacingXl 
            : DesignSystem.spacingXxxl,
    vertical: isMobile ? DesignSystem.spacingMd : DesignSystem.spacingLg,
  );
  
  /// Get responsive section padding
  EdgeInsets get sectionPadding => EdgeInsets.symmetric(
    vertical: isMobile ? DesignSystem.spacingXl : DesignSystem.spacingXxxl,
  );
  
  /// Get responsive gap between sections
  double get sectionGap => isMobile ? DesignSystem.spacingXl : DesignSystem.spacingXxxl;
  
  /// Get responsive text scale factor
  double get textScaleFactor => isMobile ? 0.9 : 1.0;
  
  /// Get responsive column count for grids
  int get gridColumnCount => isMobile ? 1 : isTablet ? 2 : 3;
  
  /// Get responsive max width for contained content
  double get maxContentWidth => isDesktop ? 1200 : 1000;
  
  /// Helper method to get responsive value
  T responsiveValue<T>({
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }
}

/// Extension for easy access to responsive utilities
extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);
}