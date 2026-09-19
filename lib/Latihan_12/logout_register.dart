import 'package:flutter/material.dart';
// import 'package:tugas_3/db/database/db_helper.dart';
// import 'package:tugas_3/db/models/user_login_model.dart';
import 'package:tugas_3/Latihan_12/login_register.dart'; // pastikan nama file ini sesuai

class Terimakasih extends StatelessWidget {
  final String email;
  const Terimakasih({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konfirmasi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terima kasih, $email',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () async {
                if (!context.mounted) return;
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const loginday16(showLogoutMessage: true),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ), // ← ini kurung tutup ElevatedButton.icon yang tadinya hilang
          ],
        ),
      ),
    );
  }
}
