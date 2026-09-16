import 'package:flutter/material.dart';
// import 'package:tugas_3/Layout/Tugas_2.dart';
// import 'package:tugas_3/Loginscreen/Login.dart';
// import 'package:tugas_3/Navigation/Navigation.dart';
// import 'package:tugas_3/tugas_8/bottomnavigationbar.dart';
import 'package:tugas_3/Tugas_9/listview.dart';
import 'package:tugas_3/tugas_8/bottomnavigationbar.dart';
import 'package:tugas_3/Tugas_10/Pendaftaran.dart';

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
      home: const SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
