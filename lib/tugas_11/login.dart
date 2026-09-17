import 'package:flutter/material.dart';
import 'package:tugas_3/tugas_11/logout.dart';
import 'package:tugas_3/tugas_11/preference_handle.dart';
import 'package:tugas_3/tugas_11/navigator.dart';

class LoginScreenDay15 extends StatefulWidget {
  final bool showLogoutMessage; // ← tambahkan
  const LoginScreenDay15({super.key, this.showLogoutMessage = false});

  @override
  State<LoginScreenDay15> createState() => _LoginScreenDay15State();
}

class _LoginScreenDay15State extends State<LoginScreenDay15> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  //menu visual fedback
  @override
  void initState() {
    super.initState();
    if (widget.showLogoutMessage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil Logout'),
            duration: Duration(seconds: 2),
          ),
        );
      });
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
                      'Login',
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
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukkan password',
                        prefixIcon: const Icon(Icons.lock),
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
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('Data '),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email: ${emailController.text}'),
                                  ],
                                ), // Column
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                      PreferenceHandler.setLogin(true);
                                      context.push(
                                        HalamanTerimaKasih(
                                          email: emailController.text,
                                        ),
                                      );
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         HalamanTerimaKasih(
                                      //           email: emailController.text,
                                      //         ),
                                      //   ), // MaterialPageRoute
                                      // );
                                    },
                                    child: Text('Lanjutkan'),
                                  ), // TextButtontton
                                ],
                              ), // AlertDialog
                            );
                          }
                        },
                        child: const Text(
                          'Login',
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
