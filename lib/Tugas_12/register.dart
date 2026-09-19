import 'package:flutter/material.dart';
import 'package:tugas_3/Tugas_12/db/database/db_helper.dart';
import 'package:tugas_3/Tugas_12/db/models/user_login_model.dart';
import 'package:tugas_3/Tugas_12/login.dart';
import 'package:tugas_3/Tugas_12/navigator.dart';

/// ============================================================================
/// VIEW: RegisterScreenDay17
/// ============================================================================
/// Halaman pendaftaran (registrasi) akun pengguna baru.
/// Data yang diinputkan akan disimpan secara permanen ke dalam tabel 'users'
/// di database lokal SQLite.
class Register12 extends StatefulWidget {
  const Register12({super.key});
  @override
  State<Register12> createState() => _Register12State();
}

class _Register12State extends State<Register12> {
  // Kontrol visibilitas password (true = disamarkan dengan tanda titik)
  bool obsecure = true;
  // Key untuk validasi form
  final _formKey = GlobalKey<FormState>();
  // Controller untuk membaca inputan email dan password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final cityController = TextEditingController();

  /// --------------------------------------------------------------------------
  ///  1. Bungkus data dari semua controller ke dalam objek model UserModelSQL
  /// --------------------------------------------------------------------------
  void register() async {
    debugPrint('register() dipanggil');
    final pengguna = UserModelSQL(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      phone: phoneController.text.trim(),
      city: cityController.text.trim(),
    );

    // 2. Simpan ke database via DBHelper.
    // Catatan untuk dipelajari:
    // Pada tabel SQLite kita mendefinisikan "email TEXT UNIQUE".
    // Jika email sudah pernah didaftarkan, db.insert akan gagal dan
    // registerUser() akan mengembalikan false.
    final bool success = await DBHelper().registerUser(pengguna);
    debugPrint('hasil registerUser: $success');
    // 3. Pastikan context masih mounted sebelum menampilkan UI / berpindah halaman
    if (!mounted) return;
    // 4. Berikan respon sesuai hasil penyimpanan
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Akun berhasil dibuat! Silakan login.')),
      );
      // Pindah ke halaman Login jika pendaftaran berhasil
      context.push(Login12());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email sudah terdaftar! Gunakan email lain.'),
        ),
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
                      'Register',
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
                      'Buat akun Baru Anda',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 32),
                    // =========================
                    // nama
                    // =========================
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Wajid diisi';
                        } else if (value.trim().length < 3) {
                          return 'Nama minimal 3 karakter';
                        } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'Nama hanya boleh berisi huruf';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        hintText: 'Masukkan nama',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor HP wajib diisi';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Nomor hanya boleh berisi angka';
                        } else if (value.length < 10 || value.length > 13) {
                          return 'Nomor HP harus 10-13 digit';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Nomor HP',
                        hintText: 'masukan nomer',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType:
                          TextInputType.phone, // munculin keyboard angka
                    ),

                    const SizedBox(height: 16),

                    // =========================
                    // PASSWORD
                    // =========================
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password wajib diisi';
                        } else if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }
                        return null;
                      },
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

                    // =========================
                    // KOTA
                    // =========================
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: cityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Wajid diisi';
                        } else if (value.trim().length < 3) {
                          return 'Nama minimal 3 karakter';
                        } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'kota hanya boleh berisi huruf';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'kota',
                        hintText: 'Kota asal',
                        prefixIcon: const Icon(Icons.location_city),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
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
                          if (_formKey.currentState!.validate()) {
                            register();
                          }
                        },
                        child: const Text(
                          'Register',
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
