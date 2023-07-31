import 'package:flutter/material.dart';
import 'package:tasks_app/src/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.transparent,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange.shade600,
          foregroundColor: Colors.white,
        ),
        navigationBarTheme: NavigationBarThemeData(
          elevation: 1,
          backgroundColor: Colors.teal,
          indicatorColor: Colors.white,
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: Colors.teal);
            }

            return const IconThemeData(color: Colors.white);
          }),
        ),
        useMaterial3: true,
      ),
      home: const TasksScreen(),
    );
  }
}
