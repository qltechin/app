import 'package:flutter/material.dart';
import 'cta_components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QLTech Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _isLoading = false;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProjectsScreen(),
    const ReportsScreen(),
    const TeamScreen(),
    const CTAExamplesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QLTech Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: 'CTA Examples',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to QLTech',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Manage your projects, generate reports, and collaborate with your team.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          
          // IMPROVED CTAs using reusable components
          CTACard(
            title: 'Quick Actions',
            description: 'Get started with these main actions',
            children: [
              PrimaryCTA(
                label: 'Start Building',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Starting new project...')),
                  );
                },
                icon: Icons.rocket_launch,
              ),
              const SizedBox(height: 12),
              SecondaryCTA(
                label: 'Explore Templates',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening template gallery...')),
                  );
                },
                icon: Icons.explore,
              ),
              const SizedBox(height: 12),
              TertiaryCTALink(
                label: 'View Documentation',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening documentation...')),
                  );
                },
                icon: Icons.menu_book,
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          CTACard(
            title: 'Project Status',
            description: 'Track your active projects',
            backgroundColor: Colors.grey[50],
            children: [
              const ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Project Alpha'),
                subtitle: Text('Completed • 2 days ago'),
              ),
              const ListTile(
                leading: Icon(Icons.access_time, color: Colors.orange),
                title: Text('Project Beta'),
                subtitle: Text('In Progress • Due tomorrow'),
              ),
              const ListTile(
                leading: Icon(Icons.circle_outlined, color: Colors.blue),
                title: Text('Project Gamma'),
                subtitle: Text('Not Started • Starts next week'),
              ),
              const SizedBox(height: 16),
              TertiaryCTALink(
                label: 'View All Projects',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigating to projects...')),
                  );
                },
                icon: Icons.arrow_forward,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projects',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Create and manage your projects',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          
          CTACard(
            title: 'Create New Project',
            description: 'Launch your next big idea',
            children: [
              Semantics(
                label: 'Project name input field',
                textField: true,
                child: ExcludeSemantics(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Project Name',
                      border: OutlineInputBorder(),
                      hintText: 'Enter a descriptive project name',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Semantics(
                label: 'Project description input field',
                textField: true,
                child: ExcludeSemantics(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      hintText: 'Describe your project goals and objectives',
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryCTA(
                label: 'Launch Project',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Project launched successfully!')),
                  );
                },
                icon: Icons.rocket_launch,
              ),
              const SizedBox(height: 12),
              SecondaryCTA(
                label: 'Save as Draft',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Project saved as draft')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Generate and view reports',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          
          CTACard(
            title: 'Available Reports',
            description: 'Generate insights from your data',
            children: [
              const ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text('Monthly Performance Report'),
                subtitle: Text('Last generated: Jan 15, 2024'),
              ),
              const ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text('Quarterly Analytics'),
                subtitle: Text('Last generated: Dec 30, 2023'),
              ),
              const SizedBox(height: 24),
              SuccessCTA(
                label: 'Generate Performance Report',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Generating performance report...')),
                  );
                },
                icon: Icons.analytics,
              ),
              const SizedBox(height: 12),
              SecondaryCTA(
                label: 'Quick Summary',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Creating quick summary...')),
                  );
                },
                icon: Icons.summarize,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Team',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Manage team members and permissions',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          
          CTACard(
            title: 'Team Members',
            description: 'Collaborate with your team',
            children: [
              const ListTile(
                leading: CircleAvatar(child: Text('JD')),
                title: Text('John Doe'),
                subtitle: Text('Admin • john@example.com'),
              ),
              const ListTile(
                leading: CircleAvatar(child: Text('JS')),
                title: Text('Jane Smith'),
                subtitle: Text('Editor • jane@example.com'),
              ),
              const SizedBox(height: 24),
              PrimaryCTA(
                label: 'Invite Team Member',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening invitation dialog...')),
                  );
                },
                icon: Icons.person_add,
              ),
              const SizedBox(height: 12),
              SecondaryCTA(
                label: 'Manage Permissions',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening permissions settings...')),
                  );
                },
                icon: Icons.settings,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CTAExamplesScreen extends StatelessWidget {
  const CTAExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CTA Design System',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Best practices for effective Call-to-Action buttons',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          
          const CTAExamples(),
          
          const SizedBox(height: 30),
          
          CTACard(
            title: 'CTA Hierarchy Guidelines',
            description: 'When to use each type of CTA',
            children: [
              const ListTile(
                leading: Icon(Icons.circle, color: Colors.blue),
                title: Text('Primary CTA'),
                subtitle: Text('Main action on the screen. Only one per section.'),
              ),
              const ListTile(
                leading: Icon(Icons.circle_outlined, color: Colors.blue),
                title: Text('Secondary CTA'),
                subtitle: Text('Alternative actions or less important actions.'),
              ),
              const ListTile(
                leading: Icon(Icons.text_fields, color: Colors.blue),
                title: Text('Tertiary CTA'),
                subtitle: Text('Text links for navigation or additional options.'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Key Principles:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('• Use action-oriented verbs (Start, Generate, Invite)'),
              const Text('• Be specific about the outcome'),
              const Text('• Maintain visual hierarchy'),
              const Text('• Include proper semantic labels for accessibility'),
              const Text('• Provide clear feedback on interaction'),
            ],
          ),
        ],
      ),
    );
  }
}