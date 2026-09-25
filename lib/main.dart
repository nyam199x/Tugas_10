import 'package:flutter/material.dart';
import 'package:tugas_3/tugas_14/views/anime_list_view.dart';
// // import 'package:tugas_3/Tugas_12/register.dart';

// // import 'package:tugas_3/Tugas_13/register.dart';
// import 'package:tugas_3/test/splash_test.dart';
// // import 'package:tugas_3/Tugas_5/Tugas_3.dart';
// // import 'package:tugas_3/Tugas_5/Tugas_4.dart';

// // import 'package:tugas_3/Layout/Tugas_2.dart';
// // import 'package:tugas_3/Loginscreen/Login.dart';
// // import 'package:tugas_3/tugas_11/login.dart';

// // import 'package:tugas_3/Navigation/Navigation.dart';
// // import 'package:tugas_3/tugas_8/bottomnavigationbar.dart';
// // import 'package:tugas_3/Tugas_9/listview.dart';
// // import 'package:tugas_3/Tugas_10/Pendaftaran.dart';

// // import 'package:tugas_3/Latihan_12/login_register.dart';
// // import 'package:tugas_3/tugas_11/preference_handle.dart';
// // import 'package:tugas_3/tugas_11/SplashScreen.dart';
// import 'package:tugas_3/tugas_11/preference_handle.dart';
// // import 'package:tugas_3/latihan_day_17/register.dart';


Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await PreferenceHandler.init();
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
      home: const AnimeListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

