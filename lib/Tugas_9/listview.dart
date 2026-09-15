import 'package:flutter/material.dart';

class ListKategoriText extends StatelessWidget {
  const ListKategoriText({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kategori = [
      {'nama': 'Elektronik', 'icon': Icons.tv},
      {'nama': 'Fashion Pria', 'icon': Icons.person},
      {'nama': 'Fashion Wanita', 'icon': Icons.person_outline},
      {'nama': 'Kesehatan & Kecantikan', 'icon': Icons.spa},
      {'nama': 'Makanan & Minuman', 'icon': Icons.fastfood},
      {'nama': 'Perlengkapan Bayi', 'icon': Icons.child_care},
      {'nama': 'Perlengkapan Rumah Tangga', 'icon': Icons.house},
      {'nama': 'Alat Tulis Kantor', 'icon': Icons.edit},
      {'nama': 'Otomotif', 'icon': Icons.directions_car},
      {'nama': 'Hobi & Koleksi', 'icon': Icons.sports_esports},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 35, 95),
        title: Padding(
          padding: const EdgeInsets.all(140.0),
          child: const Text(
            'Kategori',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          final item = kategori[index];

          return ListTile(
            leading: Icon(item['icon']),
            title: Text(item['nama']),
          );
        },
      ),
    );
  }
}
