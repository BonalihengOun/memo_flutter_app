import 'package:flutter/material.dart';
import 'package:memo_flutter_projects/UI/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Memo App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
