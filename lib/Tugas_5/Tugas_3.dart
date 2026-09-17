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
      home: const Forminput(),
    );
  }
}

class Forminput extends StatefulWidget {
  const Forminput({super.key});

  @override
  State<Forminput> createState() => _ForminputState();
}

class _ForminputState extends State<Forminput> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final teleponController = TextEditingController();
  final passwordController = TextEditingController();
  final konfirmasiController = TextEditingController();

  bool showPassword = false;
  bool showKonfirmasi = false;

  // Data daerah dan URL gambar
  final List<Map<String, String>> daerah = [
    {
      'nama': 'Jakarta',
      'image':
          'https://images.unsplash.com/photo-1555899434-94d1368aa7af?w=500',
    },
    {
      'nama': 'Bandung',
      'image':
          'https://images.unsplash.com/photo-1596422846543-75c6fc197f07?w=500',
    },
    {
      'nama': 'Yogyakarta',
      'image':
          'https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=500',
    },
    {
      'nama': 'Semarang',
      'image':
          'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=500',
    },
    {
      'nama': 'Lampung',
      'image':
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=500',
    },
    {
      'nama': 'Padang',
      'image':
          'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?w=500',
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
  // CARD DAERAH
  // ==========================================
  Widget cardDaerah(Map<String, String> data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          // ==========================
          // GAMBAR DARI URL
          // ==========================
          Positioned.fill(
            child: Image.network(
              data['image']!,
              fit: BoxFit.cover,

              // Loading
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              },

              // Jika gambar gagal dimuat
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                );
              },
            ),
          ),

          // ==========================
          // NAMA DAERAH
          // ==========================
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7),
              color: Colors.blue.withValues(alpha: 0.75),
              child: Text(
                data['nama']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
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
          'Registrasi & Edukasi',
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
            // JUDUL FORM
            // ==========================================

            

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
                    'Form Registrasi',
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
                    hint: 'Nama Pengguna',
                    icon: Icons.person,
                    controller: namaController,
                  ),

                  // Email
                  inputField(
                    hint: 'Email Pengguna',
                    icon: Icons.email,
                    controller: emailController,
                  ),

                  // Telephone
                  inputField(
                    hint: 'Telephone Pengguna',
                    icon: Icons.phone,
                    controller: teleponController,
                  ),

                  // Password
                  inputField(
                    hint: 'Input Password',
                    icon: Icons.key,
                    controller: passwordController,
                    obscureText: !showPassword,
                    onVisibilityPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),

                  // Konfirmasi Password
                  inputField(
                    hint: 'Masukkan Konfirmasi Password',
                    icon: Icons.lock,
                    controller: konfirmasiController,
                    obscureText: !showKonfirmasi,
                    onVisibilityPressed: () {
                      setState(() {
                        showKonfirmasi = !showKonfirmasi;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==========================================
            // JUDUL WILAYAH
            // ==========================================
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Wilayah Pemantauan Kualitas Udara Terdekat',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ==========================================
            // GRIDVIEW DAERAH
            // ==========================================
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: daerah.length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.05,
              ),

              itemBuilder: (context, index) {
                return cardDaerah(daerah[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
