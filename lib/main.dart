import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'core/theme/my_theme.dart';


void main() {
  runApp(const MyApp ());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    theme: mytheme(),
    home:  Home(),
  );
  }

}
