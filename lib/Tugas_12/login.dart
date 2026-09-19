import 'package:flutter/material.dart';
import 'package:tugas_3/Tugas_12/db/database/db_helper.dart';
import 'package:tugas_3/Tugas_12/navigator.dart';
import 'package:tugas_3/Tugas_12/home.dart';

// import 'package:ppkdju_01/day_17/services/db_helper.dart';
// import 'package:ppkdju_01/day_17/views/home_screen.dart';
// import 'package:ppkdju_01/extension/navigator.dart';

/// ============================================================================
/// VIEW: Login12
/// ============================================================================
/// Halaman masuk (login) untuk memverifikasi akun pengguna terhadap data
/// yang tersimpan di database lokal SQLite.
class Login12 extends StatefulWidget {
  const Login12({super.key});
  @override
  State<Login12> createState() => _Login12State();
}

class _Login12State extends State<Login12> {
  // Variabel untuk mengontrol apakah password disamarkan (true) atau terlihat (false)
  bool obsecure = true;
  // Key unik untuk mengidentifikasi Form dan menjalankan validasi (_formKey.currentState!.validate())
  final _formKey = GlobalKey<FormState>();
  // Controller untuk membaca dan mengontrol teks input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// --------------------------------------------------------------------------
  /// Logika Login
  /// --------------------------------------------------------------------------
  void login() async {
    final user = emailController.text.trim();
    final pass = passwordController.text;
    // Pengecekan awal: pastikan field tidak kosong
    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }
    // 1. Mencari user di SQLite melalui DBHelper
    final pengguna = await DBHelper().loginUser(user, pass);
    
    // 2. Cegah error jika user sudah berpindah halaman sebelum proses async selesai
    if (!mounted) return;
    // 3. Evaluasi hasil query
    if (pengguna != null) {
      // Jika ditemukan, tampilkan pesan sukses dan pindah ke halaman Home
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login berhasil')));
      context.push(Home12());
    } else {
      // Jika hasil null, berarti email belum ada atau password salah
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email belum terdaftar / password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // =========================
                    // ICON
                    // =========================
                    const Icon(Icons.lock, size: 80, color: Colors.blue),
                    const SizedBox(height: 24),
                    // =========================
                    // TITLE
                    // =========================
                    const Text(
                      'login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // =========================
                    // SUBTITLE
                    // =========================
                    const Text(
                      'Silakan masuk ke akun Anda',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 32),
                    // =========================
                    // EMAIL
                    // =========================
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email wajib diisi';
                        } else if (!value.contains('@')) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // =========================
                    // PASSWORD
                    // =========================
                    TextFormField(
                      controller: passwordController,
                      obscureText: obsecure,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukkan password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                          icon: Icon(
                            obsecure ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // =========================
                    // BUTTON
                    // =========================
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          // textStyle: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          debugPrint('TOMBOL DITEKAN');
                          final valid = _formKey.currentState
                              ?.validate(); // 👈 baris baru
                          debugPrint('validate: $valid');
                          if (valid == true) {
                            // 👈 diganti
                            login();
                          }
                        },
                        child: const Text(
                          'login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
