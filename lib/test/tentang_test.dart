import 'package:flutter/material.dart';
import 'package:tugas_3/constant/app_colors.dart';
import 'package:tugas_3/constant/app_text.dart';
import 'package:tugas_3/test/login_test.dart';
import 'package:tugas_3/tugas_11/navigator.dart';
import 'package:tugas_3/tugas_11/preference_handle.dart';

class Tentangkami extends StatefulWidget {
  final String email;
  const Tentangkami({super.key, required this.email});

  @override
  State<Tentangkami> createState() => _TentangkamiState();
}

class _TentangkamiState extends State<Tentangkami> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // <-- hapus 'const' di sini
            Text(
              AppText.NamaAplikasi,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            // ... sisanya tetap sama, tidak perlu diubah satu-satu
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
