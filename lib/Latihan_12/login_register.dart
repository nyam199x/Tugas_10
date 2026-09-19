import 'package:flutter/material.dart';
import 'package:tugas_3/db/database/db_helper.dart';
import 'package:tugas_3/db/models/user_login_model.dart';
import 'package:tugas_3/Latihan_12/logout_register.dart';

// import 'package:tugas_3/tugas_11/preference_handle.dart';
// import 'package:tugas_3/tugas_11/navigator.dart';

// ignore: camel_case_types
class loginday16 extends StatefulWidget {
  final bool showLogoutMessage; // ← tambahkan
  const loginday16({super.key, this.showLogoutMessage = false});

  @override
  State<loginday16> createState() => _loginday16State();
}

// ignore: camel_case_types
class _loginday16State extends State<loginday16> {
  final _formKey = GlobalKey<FormState>();
  // final emailController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();

  void register() async {
    final user = userController.text.trim();
    final pass = passController.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    try {
      final pengguna = UserModelSQL(email: user, password: pass);
      bool success = await DBHelper().registerUser(pengguna);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success ? 'Akun berhasil dibuat' : 'Email sudah terdaftar!',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  void login() async {
    final user = userController.text.trim();
    final pass = passController.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    try {
      final pengguna = await DBHelper().loginUser(user, pass);

      if (!mounted) return;

      if (pengguna != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Terimakasih(email: user)),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login gagal! email atau Password salah.'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

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
                      controller: userController,
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
                      controller: passController,
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

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      child: Text('LOGIN'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          register();
                        }
                      },
                      child: Text('Register'),
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

// =========================
// BUTTON
// =========================
// SizedBox(
//   width: double.infinity,
//   child: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.red,
//       // textStyle: TextStyle(color: Colors.white),
//     ),
//     onPressed: () {
//       if (_formKey.currentState!.validate()) {
//         showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             title: Text('Data '),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Email: ${userController.text}'),
//               ],
//             ), // Column
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   context.pop();
//                   PreferenceHandler.setLogin(true);
//                   context.push(
//                     HalamanTerimaKasih(
//                       email: userController.text,
//                     ),
//                   );
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) =>
//                   //         HalamanTerimaKasih(
//                   //           email: emailController.text,
//                   //         ),
//                   //   ), // MaterialPageRoute
//                   // );
//                 },
//                 child: Text('Lanjutkan'),
//               ), // TextButtontton
//             ],
//           ), // AlertDialog
//         );
//       }
//     },
//     child: const Text(
//       'Login',
//       style: TextStyle(color: Colors.white),
//     ),
//   ),
// ),
