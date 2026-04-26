import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'application_2',
      theme: ThemeData.dark(
         
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const _titles = <String>['Home', 'Profile', 'Settings'];
  static const _icons  = <IconData>[Icons.home, Icons.person, Icons.settings];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cs.inversePrimary,
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) {
          setState(() => _selectedIndex = i);
          Navigator.pop(context);
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text('Menu',
                style: Theme.of(context).textTheme.titleSmall),
          ),
          ...List.generate(
            _titles.length,
            (i) => NavigationDrawerDestination(
              icon: Icon(_icons[i]),
              label: Text(_titles[i]),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          _titles[_selectedIndex],
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
