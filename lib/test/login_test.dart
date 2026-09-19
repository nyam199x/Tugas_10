import 'package:flutter/material.dart';

// import 'package:tugas_3/test/logout_test.dart';
import 'package:tugas_3/test/menu_home.dart';
import 'package:tugas_3/tugas_11/preference_handle.dart';
import 'package:tugas_3/tugas_11/navigator.dart';

class Logintestt extends StatefulWidget {
  final bool showLogoutMessage; // ← tambahkan
  const Logintestt({super.key, this.showLogoutMessage = false});

  @override
  State<Logintestt> createState() => _LogintesttState();
}

class _LogintesttState extends State<Logintestt> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
      backgroundColor: const Color.fromARGB(255, 17, 35, 95),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 35, 95),
        title: Padding(
          padding: const EdgeInsets.all(150.0),
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              // GAMBAR / LOGO
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/barber.jpeg',
                  height: 150,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                      // bottomLeft & bottomRight sengaja tidak dibulatkan
                      // karena mentok ke bawah
                    ),
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade400),
                      left: BorderSide.none,
                      right: BorderSide.none,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Hello Welcome back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 17, 35, 95),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Welcome back please\nsign in again',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),

                        const SizedBox(height: 70),

                        // =========================
                        // EMAIL
                        // =========================
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.black),
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
                          style: const TextStyle(color: Colors.black),
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

                        const SizedBox(height: 30),

                        // =========================
                        // BUTTON
                        // =========================
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            Menuhome(
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
