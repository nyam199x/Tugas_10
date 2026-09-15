import 'package:flutter/material.dart';
import 'package:tugas_3/constant/app_colors.dart';
import 'package:tugas_3/constant/app_text.dart';

class TentangAplikasi extends StatefulWidget {
  const TentangAplikasi({super.key});

  @override
  State<TentangAplikasi> createState() => _TentangAplikasiState();
}

class _TentangAplikasiState extends State<TentangAplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // JUDUL APLIKASI
            Text(
              AppText.NamaAplikasi,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: 16),

            // PENJELASAN SINGKAT
            Text(
              'penjelasan singkat',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Aplikasi ini digunakan untuk latihan navigasi, form input, dan komponen dasar Flutter.',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),

            SizedBox(height: 24),

            // NAMA PEMBUAT
            Text(
              'Dibuat oleh',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Ilham Ramadhan',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),

            SizedBox(height: 24),

            // VERSI
            Text(
              'Versi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1.0.0',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
