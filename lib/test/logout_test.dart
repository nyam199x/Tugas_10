import 'package:flutter/material.dart';
import 'package:tugas_3/test/login_test.dart';
import 'package:tugas_3/tugas_11/navigator.dart';
import 'package:tugas_3/tugas_11/preference_handle.dart';


class Halamanlogout extends StatelessWidget {
  final String email;
  const Halamanlogout({super.key, required this.email});

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
                  const Logintestt(showLogoutMessage: true),
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
