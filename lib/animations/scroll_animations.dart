import 'package:flutter/material.dart';

/// Scroll animation utilities for premium web experience
class ScrollAnimations {
  /// Creates a scroll-triggered fade animation
  static Widget fadeOnScroll({
    required Widget child,
    required ScrollController scrollController,
    double startOffset = 100,
    double endOffset = 300,
  }) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.offset;
        final opacity = _calculateOpacity(
          scrollOffset,
          startOffset,
          endOffset,
        );
        
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - opacity)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Creates a scroll-triggered slide animation
  static Widget slideOnScroll({
    required Widget child,
    required ScrollController scrollController,
    double startOffset = 100,
    double endOffset = 300,
    Offset slideOffset = const Offset(50, 0),
  }) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.offset;
        final progress = _calculateProgress(
          scrollOffset,
          startOffset,
          endOffset,
        );
        
        return Transform.translate(
          offset: slideOffset * (1 - progress),
          child: Opacity(
            opacity: progress,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Creates a scroll-triggered scale animation
  static Widget scaleOnScroll({
    required Widget child,
    required ScrollController scrollController,
    double startOffset = 100,
    double endOffset = 300,
    double minScale = 0.8,
  }) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.offset;
        final progress = _calculateProgress(
          scrollOffset,
          startOffset,
          endOffset,
        );
        
        final scale = minScale + (1 - minScale) * progress;
        
        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: progress,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Creates a staggered animation for lists
  static Widget staggeredAnimation({
    required Widget child,
    required int index,
    Duration baseDuration = const Duration(milliseconds: 300),
    Duration staggerDuration = const Duration(milliseconds: 100),
  }) {
    return TweenAnimationBuilder<double>(
      duration: baseDuration + (staggerDuration * index),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Creates a parallax effect
  static Widget parallaxEffect({
    required Widget child,
    required ScrollController scrollController,
    double parallaxFactor = 0.5,
  }) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.offset;
        final parallaxOffset = scrollOffset * parallaxFactor;
        
        return Transform.translate(
          offset: Offset(0, -parallaxOffset),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Helper method to calculate opacity based on scroll position
  static double _calculateOpacity(
    double scrollOffset,
    double startOffset,
    double endOffset,
  ) {
    if (scrollOffset < startOffset) return 0.0;
    if (scrollOffset > endOffset) return 1.0;
    
    return (scrollOffset - startOffset) / (endOffset - startOffset);
  }

  /// Helper method to calculate progress based on scroll position
  static double _calculateProgress(
    double scrollOffset,
    double startOffset,
    double endOffset,
  ) {
    return _calculateOpacity(scrollOffset, startOffset, endOffset);
  }
}