import 'package:flutter/material.dart';
import 'package:tugas_3/tugas_11/navigator.dart';
import 'package:tugas_3/test/logout_test.dart';
import 'package:tugas_3/tugas_11/preference_handle.dart';
import 'package:tugas_3/test/login_test.dart';

class Splashtestt extends StatefulWidget {
  const Splashtestt({super.key});

  @override
  State<Splashtestt> createState() => _SplashtesttState();
}

class _SplashtesttState extends State<Splashtestt> {
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
      isLogin ? const Halamanlogout(email: '') : const Logintestt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 35, 95),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  'assets/barber.jpeg',
                  height: 150,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Ramskey Barber',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              const SizedBox(height: 40),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
