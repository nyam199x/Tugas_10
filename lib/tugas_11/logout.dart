import 'package:flutter/material.dart';
import 'package:tugas_3/tugas_11/navigator.dart';
import 'package:tugas_3/tugas_11/preference_handle.dart';
import 'package:tugas_3/tugas_11/login.dart';

class HalamanTerimaKasih extends StatelessWidget {
  final String email;
  const HalamanTerimaKasih({super.key, required this.email});

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
                await PreferenceHandler.logOut();
                if (!context.mounted) return;
                context.pushAndRemoveAll(
                  const LoginScreenDay15(showLogoutMessage: true),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
