import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_ui_app/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      home: HomePage(),
    );
  }
}
