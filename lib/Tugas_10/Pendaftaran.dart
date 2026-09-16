import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // =========================
                // NAMA LENGKAP
                // =========================
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nama Lengkap'),
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
                ), // TextFormField
                // =========================
                // EMAIL
                // =========================
                const SizedBox(height: 16),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email wajib diisi';
                    } else if (!value.contains('@')) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ), // TextFormField
                // =========================
                // Nomor HP
                // =========================
                const SizedBox(height: 16),

                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Nomor HP'),
                  keyboardType: TextInputType.phone, // munculin keyboard angka
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
                ), // TextFormField

                const SizedBox(height: 16),
                // =========================
                // Kota
                // =========================
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(labelText: 'Kota'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Wajid diisi';
                    } else if (value.trim().length < 3) {
                      return 'Nama minimal 3 karakter';
                    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return 'Kota wajid diisi';
                    }
                    return null;
                  },
                ), // TextFormField

                const SizedBox(height: 16),

                // =========================
                // PASSWORD
                // =========================
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Masukkan password',
                  ),
                ),

                const SizedBox(height: 30),

                // =========================
                // BUTTON
                // =========================
                ElevatedButton(
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
                              Text('Nama: ${nameController.text}'),
                              Text('Kota: ${cityController.text}'),
                            ],
                          ), // Column
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HalamanTerimaKasih(
                                      nama: nameController.text,
                                      kota: cityController.text,
                                    ),
                                  ), // MaterialPageRoute
                                );
                              },
                              child: Text('Submit'),
                            ), // TextButton// TextButton
                          ],
                        ), // AlertDialog
                      );
                    }
                  },
                  child: const Text('Pendaftaran'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HalamanTerimaKasih extends StatelessWidget {
  final String nama;
  final String kota;
  const HalamanTerimaKasih({super.key, required this.nama, required this.kota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konfirmasi')),
      body: Center(
        child: Text(
          '"Terima kasih, $nama dari $kota telah mendaftar."',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ), // Text
      ), // Center
    ); // Scaffold
  }
}
