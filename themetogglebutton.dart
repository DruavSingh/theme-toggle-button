import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Boolean variable to track the theme state (light or dark)
  bool _isDarkMode = false;

  // Toggle theme method
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the theme mode based on the _isDarkMode variable
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Light Theme Data
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),

      // Dark Theme Data
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),

      home: HomeScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  HomeScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Toggle Button'),
        actions: [
          // Toggle button (Switch)
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Current Theme: ${isDarkMode ? "Dark" : "Light"}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
