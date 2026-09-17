import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registrasi & Edukasi',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const listview(),
    );
  }
}

class listview extends StatefulWidget {
  const listview({super.key});

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final teleponController = TextEditingController();
  final passwordController = TextEditingController();
  final konfirmasiController = TextEditingController();

  bool showPassword = false;
  bool showKonfirmasi = false;

  // ==========================================
  // DATA RIWAYAT LAPORAN
  // ==========================================
  final List<Map<String, dynamic>> riwayatLaporan = [
    {
      'lokasi': 'Jakarta Pusat',
      'aqi': 156,
      'status': 'Tidak Sehat',
      'waktu': 'Dilaporkan 5 menit lalu.',
      'warna': Colors.red,
      'icon': Icons.warning_rounded,
    },
    {
      'lokasi': 'Bandung Kota',
      'aqi': 95,
      'status': 'Sedang',
      'waktu': 'Dilaporkan 30 menit lalu.',
      'warna': Colors.orange,
      'icon': Icons.cloud,
    },
    {
      'lokasi': 'Yogyakarta',
      'aqi': 42,
      'status': 'Baik',
      'waktu': 'Dilaporkan 1 hari lalu.',
      'warna': Colors.green,
      'icon': Icons.check_circle,
    },
    {
      'lokasi': 'Semarang',
      'aqi': 120,
      'status': 'Sensitif',
      'waktu': 'Dilaporkan 1 hari lalu.',
      'warna': Colors.red,
      'icon': Icons.masks,
    },
  ];

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    teleponController.dispose();
    passwordController.dispose();
    konfirmasiController.dispose();
    super.dispose();
  }

  // ==========================================
  // TEXT FIELD
  // ==========================================
  Widget inputField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool obscureText = false,
    VoidCallback? onVisibilityPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,

          prefixIcon: Icon(icon, color: Colors.grey[700]),

          suffixIcon: onVisibilityPressed != null
              ? IconButton(
                  onPressed: onVisibilityPressed,
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[700],
                  ),
                )
              : null,

          contentPadding: const EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 15,
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // CARD RIWAYAT LAPORAN
  // ==========================================
  Widget cardRiwayat(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Ikon bulat berwarna
          CircleAvatar(
            radius: 22,
            backgroundColor: (data['warna'] as Color).withValues(alpha: 0.15),
            child: Icon(
              data['icon'] as IconData,
              color: data['warna'] as Color,
            ),
          ),

          const SizedBox(width: 12),

          // Nama lokasi + status AQI + waktu
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['lokasi'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'AQI: ${data['aqi']} - ${data['status']}. ${data['waktu']}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          // Panah kanan
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  // ==========================================
  // BUILD
  // ==========================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==========================================
      // APP BAR
      // ==========================================
      appBar: AppBar(
        title: const Text(
          'Laporan & Riwayat Udara',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      // ==========================================
      // BODY
      // ==========================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ==========================================
            // CONTAINER FORM REGISTRASI
            // ==========================================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Column(
                children: [
                  const Text(
                    'Laporan Kondisi Udara',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Nama
                  inputField(
                    hint: 'Titik Lokasi (Nama Jalan/gedung)',
                    icon: Icons.map,
                    controller: namaController,
                  ),

                  // Email
                  inputField(
                    hint: 'Skor AQI Teramati',
                    icon: Icons.air,
                    controller: emailController,
                  ),

                  // Telephone
                  inputField(
                    hint: 'Nama Pelapor',
                    icon: Icons.person,
                    controller: teleponController,
                  ),

                  // Password
                  inputField(
                    hint: 'Catatan Tambahan (misal:berkabut)',
                    icon: Icons.notes,
                    controller: passwordController,
                  ),

                  // Konfirmasi Password
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==========================================
            // JUDUL RIWAYAT
            // ==========================================
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Riwayat Laporan Terakhir',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ==========================================
            // LIST RIWAYAT LAPORAN
            // ==========================================
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: riwayatLaporan.length,
              itemBuilder: (context, index) {
                return cardRiwayat(riwayatLaporan[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
