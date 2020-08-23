import 'package:F2F/screens/home/workout/comprehension_page.dart';
import 'package:F2F/screens/login/login_page.dart';
import 'package:F2F/screens/navigation_page.dart';
import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (_) => const LoginPage(),
        // '/settings': (_) => const SettingsScreen(),
      },
      home: LoginPage(),
    );
  }
}
