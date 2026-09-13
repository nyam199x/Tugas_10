import 'package:flutter/material.dart';
import 'package:tugas_3/Layout/Tugas_2.dart';
import 'package:tugas_3/Loginscreen/Login.dart';
import 'package:tugas_3/Navigation/Navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Navigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
