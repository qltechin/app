import 'package:flutter/material.dart';

/// CTA Design System for QLTech Web App
/// 
/// This file contains reusable CTA components following best practices:
/// 1. Action-oriented language
/// 2. Clear visual hierarchy
/// 3. Proper semantic labels for accessibility
/// 4. Consistent styling across the app

/// Primary CTA Button - Used for main actions
class PrimaryCTA extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;
  final double? width;

  const PrimaryCTA({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      enabled: !isLoading,
      child: ExcludeSemantics(
        child: SizedBox(
          width: width ?? double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          Icon(icon, size: 22),
                          const SizedBox(width: 12),
                        ],
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

/// Secondary CTA Button - Used for alternative actions
class SecondaryCTA extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;
  final Color? color;

  const SecondaryCTA({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      enabled: !isLoading,
      child: ExcludeSemantics(
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            side: BorderSide(
              color: color ?? Theme.of(context).colorScheme.outline,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 20),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: color ?? Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Tertiary CTA Link - Used for text-based actions
class TertiaryCTALink extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? color;

  const TertiaryCTALink({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      link: true,
      child: ExcludeSemantics(
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 18,
                    color: color ?? Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: color ?? Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
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

/// Success CTA - Used for positive confirmation actions
class SuccessCTA extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;

  const SuccessCTA({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      enabled: !isLoading,
      child: ExcludeSemantics(
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 20),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Warning CTA - Used for destructive or important actions
class WarningCTA extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;

  const WarningCTA({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      enabled: !isLoading,
      child: ExcludeSemantics(
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 20),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// CTA Card - Container for grouping related CTAs
class CTACard extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> children;
  final Color? backgroundColor;

  const CTACard({
    super.key,
    required this.title,
    required this.description,
    required this.children,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// CTA Examples - Demonstration of improved CTAs
class CTAExamples extends StatelessWidget {
  const CTAExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CTA Examples - Before & After',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        
        // Example 1: Generic "Submit" → Action-oriented "Start Building"
        CTACard(
          title: 'Project Creation',
          description: 'From generic to action-oriented',
          children: [
            const Text(
              'Before:',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            const Text(
              'After:',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
            ),
            const SizedBox(height: 8),
            PrimaryCTA(
              label: 'Start Building',
              onPressed: () {},
              icon: Icons.rocket_launch,
            ),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Example 2: Passive "Proceed" → Outcome-focused "Generate Report"
        CTACard(
          title: 'Report Generation',
          description: 'From passive to outcome-focused',
          children: [
            const Text(
              'Before:',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Proceed'),
            ),
            const SizedBox(height: 16),
            const Text(
              'After:',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
            ),
            const SizedBox(height: 8),
            SuccessCTA(
              label: 'Generate Performance Report',
              onPressed: () {},
              icon: Icons.analytics,
            ),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Example 3: Unclear "Click Here" → Descriptive "View All Projects"
        CTACard(
          title: 'Navigation Links',
          description: 'From unclear to descriptive',
          children: [
            const Text(
              'Before:',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Click here',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'After:',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
            ),
            const SizedBox(height: 8),
            TertiaryCTALink(
              label: 'View All Projects',
              onPressed: () {},
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ],
    );
  }
}