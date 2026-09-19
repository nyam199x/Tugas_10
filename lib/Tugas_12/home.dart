import 'package:flutter/material.dart';
import 'package:tugas_3/Tugas_12/db/database/db_helper.dart';
import 'package:tugas_3/Tugas_12/db/models/user_login_model.dart';

/// ============================================================================
/// VIEW: Home12
/// ============================================================================
/// Halaman utama untuk menampilkan seluruh daftar pengguna yang tersimpan
/// di database lokal SQLite.
///
/// Kita menggunakan [StatefulWidget] agar halaman ini dapat me-refresh (memuat
/// ulang) data pengguna secara otomatis ketika ada aksi Tambah.
class Home12 extends StatefulWidget {
  const Home12({super.key});
  @override
  State<Home12> createState() => _Home12State();
}

class _Home12State extends State<Home12> {
  // Variabel untuk menampung Future daftar pengguna.
  // Disimpan di state agar FutureBuilder tidak memanggil database berulang kali
  // saat build() dipanggil ulang oleh Flutter.
  late Future<List<UserModelSQL>> _usersFuture;

  @override
  void initState() {
    super.initState();
    // Memuat data pertama kali ketika halaman dibuat
    _refreshUsers();
  }
  /// --------------------------------------------------------------------------
  /// Fungsi Refresh Data
  /// --------------------------------------------------------------------------
  /// Memanggil ulang database dan memperbarui UI dengan setState.
  void _refreshUsers() {
    setState(() {
      _usersFuture = DBHelper().getAllUsers();
    });
  }

  //Tampilan
  // InputDecoration _dekorasi(String label, IconData icon, {Widget? suffix}) {
  //   return InputDecoration(
  //     labelText: label,
  //     prefixIcon: Icon(icon),
  //     suffixIcon: suffix,
  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  //   );
  // }
//menampilkan dialog konfirmasi.
//   void _showDeleteDialog(UserModelSQL user) {
//     showDialog(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         title: const Text('Hapus Pengguna'),
//         content: Text('Apakah Anda yakin ingin menghapus "${user.name}"?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(dialogContext),
//             child: const Text('Batal'),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//               foregroundColor: Colors.white,
//             ),
//             onPressed: () async {
//               Navigator.pop(dialogContext);
//               if (user.id != null) {
//                 await DBHelper().deleteUser(user.id!);
//                 if (!mounted) return;
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('${user.name} berhasil dihapus')),
//                 );
//                 _refreshUsers();
//               }
//             },
//             child: const Text('Hapus'),
//           ),
//         ],
//       ),
//     );
//   }
// //menampilkan dialog edit
//   void _showEditBottomSheet(UserModelSQL user) {
//     final nameController = TextEditingController(text: user.name);
//     final emailController = TextEditingController(text: user.email);
//     final phoneController = TextEditingController(text: user.phone);
//     final cityController = TextEditingController(text: user.city);
//     final passwordController = TextEditingController(text: user.password);
//     final formKey = GlobalKey<FormState>();
//     bool obscurePassword = true;

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (sheetContext) {
//         return StatefulBuilder(
//           builder: (modalContext, setModalState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//                 top: 20,
//                 bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text(
//                         'Edit Pengguna',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: nameController,
//                         decoration: _dekorasi('Nama Lengkap', Icons.person),
//                         validator: (v) => (v == null || v.trim().length < 3)
//                             ? 'Nama minimal 3 karakter'
//                             : null,
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: _dekorasi('Email', Icons.email),
//                         validator: (v) {
//                           if (v == null || v.trim().isEmpty)
//                             return 'Email wajib diisi';
//                           if (!v.contains('@'))
//                             return 'Format email tidak valid';
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: _dekorasi('Nomor HP', Icons.phone),
//                         validator: (v) {
//                           if (v == null || v.isEmpty)
//                             return 'Nomor HP wajib diisi';
//                           if (!RegExp(r'^[0-9]{10,13}$').hasMatch(v)) {
//                             return 'Nomor HP harus 10-13 digit';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: cityController,
//                         decoration: _dekorasi('Kota', Icons.location_city),
//                         validator: (v) => (v == null || v.trim().length < 3)
//                             ? 'Kota minimal 3 karakter'
//                             : null,
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: passwordController,
//                         obscureText: obscurePassword,
//                         decoration: _dekorasi(
//                           'Password',
//                           Icons.lock,
//                           suffix: IconButton(
//                             icon: Icon(
//                               obscurePassword
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () => setModalState(
//                               () => obscurePassword = !obscurePassword,
//                             ),
//                           ),
//                         ),
//                         validator: (v) => (v == null || v.length < 6)
//                             ? 'Password minimal 6 karakter'
//                             : null,
//                       ),
//                       const SizedBox(height: 24),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             if (!formKey.currentState!.validate()) return;

//                             final updatedUser = UserModelSQL(
//                               id: user.id,
//                               name: nameController.text.trim(),
//                               email: emailController.text.trim(),
//                               password: passwordController.text,
//                               phone: phoneController.text.trim(),
//                               city: cityController.text.trim(),
//                             );

//                             Navigator.pop(sheetContext);
//                             final success = await DBHelper().updateUser(
//                               updatedUser,
//                             );
//                             if (!mounted) return;

//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   success
//                                       ? 'Data berhasil diperbarui'
//                                       : 'Gagal memperbarui data',
//                                 ),
//                               ),
//                             );
//                             if (success) _refreshUsers();
//                           },
//                           child: const Text('Simpan Perubahan'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tugas 12")),
      body: Column(
        children: [
          Expanded(
            // FutureBuilder menangani operasi asinkron secara otomatis
            child: FutureBuilder<List<UserModelSQL>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                // Kondisi 1: Menunggu data selesai dimuat
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                // Kondisi 2: Terjadi error saat membaca database
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  );
                }
                // Kondisi 3: Data berhasil diambil tapi masih kosong
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada data pengguna.'));
                }
                // Kondisi 4: Data tersedia dan siap ditampilkan ke ListView
                final daftarPengguna = snapshot.data!;
                return ListView.builder(
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      child: ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          child: Text(
                            user.name.isNotEmpty
                                ? user.name[0].toUpperCase()
                                : '?',
                          ),
                        ),
                        title: Text(
                          user.name.isNotEmpty ? user.name : '(tanpa nama)',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email: ${user.email}'),
                            Text('No. HP: ${user.phone}'),
                            Text('Kota: ${user.city}'),
                            Text('Password: ${'•' * user.password.length}'),
                          ],
                        ),
                        // trailing: Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () => _showEditBottomSheet(user),
                        //       icon: const Icon(Icons.edit, color: Colors.blue),
                        //     ),
                        //     IconButton(
                        //       onPressed: () => _showDeleteDialog(user),
                        //       icon: const Icon(Icons.delete, color: Colors.red),
                        //     ),
                        //   ],
                        // ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
