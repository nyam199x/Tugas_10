import 'package:flutter/material.dart';
import 'package:tugas_3/test/tentang_test.dart';

class Menuhome extends StatefulWidget {
  final String email;
  const Menuhome({super.key, required this.email});

  @override
  State<Menuhome> createState() => _MenuhomeState();
}

class _MenuhomeState extends State<Menuhome> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> get _pages => [
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SAYA MENYETUJUI SEMUA PERSYARATAN
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        'Saya menyetujui semua persyaratan yang berlaku',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
               
              ],
            ),
          ),
        ],
      ),
    ),
     const Tentangkami(email: 'widget.email'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('babi'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tentang test',
          ),
        ],
      ),
    );
  }
}
