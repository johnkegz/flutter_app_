import 'package:flutter/material.dart';
// import 'screens/home_page.dart';
import 'screens/todo_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // home: HomePage(),
      home: TodoScreen(),
    );
  }
}