// ignore: file_names
import 'package:flutter/material.dart';
import 'package:tugas_3/tugas_11/navigator.dart';
import 'package:tugas_3/tugas_11/logout.dart';
import 'package:tugas_3/tugas_11/preference_handle.dart';
import 'package:tugas_3/tugas_11/login.dart';

class SplashScreenDay15 extends StatefulWidget {
  const SplashScreenDay15({super.key});

  @override
  State<SplashScreenDay15> createState() => _SplashScreenDay15State();
}

class _SplashScreenDay15State extends State<SplashScreenDay15> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return; // cegah error kalau widget sudah di-dispose

    final bool isLogin = PreferenceHandler.isLogin;

    // pushAndRemoveAll: splash dihapus dari stack, tombol back tidak balik ke sini
    context.pushAndRemoveAll(
      isLogin ? const HalamanTerimaKasih(email: '') : const LoginScreenDay15(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/barber.jpeg',
                width: 150,
                height: 150,
                fit: BoxFit.cover, // cover: penuhi area tanpa distorsi, memotong kelebihan
              ),
              const SizedBox(height: 24),
              const Text(
                'My App',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Belajar Flutter Day 15',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
