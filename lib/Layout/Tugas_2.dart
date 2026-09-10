import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tugas_2 extends StatefulWidget {
  const Tugas_2({super.key});

  @override
  State<Tugas_2> createState() => _Tugas_2State();
}

class _Tugas_2State extends State<Tugas_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 119, 60),
      appBar: AppBar(
        title: const Text('Detail Toko'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
                child: Container(
                  child: Text(
                    'Harmony Mystic Emporium',
                    style: GoogleFonts.pacifico(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  margin: const EdgeInsets.only(bottom: 20),
  decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Row(
    children: const [
      Icon(Icons.email, color: Colors.black),
      SizedBox(width: 10),
      Text(
        'harumony.id',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    ],
  ),
),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: const [
          Icon(Icons.phone, size: 18, color: Colors.black),
          SizedBox(width: 8),
          Text('083841111864'),
        ],
      ), // jarak antar kolom
      Row(
        children: const [
          Icon(Icons.location_on, size: 18, color: Colors.black),
          SizedBox(width: 8),
          Text('Jakarta, Indonesia'),
        ],
      ),
    ],
  ),
),
const SizedBox(height: 20),
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: const [
              Text('300+', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('books sold per month', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
      const SizedBox(width: 20), // jarak antar kotak
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: const [
              Text('4.8 / 5 ⭐', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('rating by user', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    ],
  ),
),const SizedBox(height: 20),
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    margin: const EdgeInsets.only(bottom: 20),
            child: Text("Harmony Mystic Emporium is a mystical bookstore that offers a wide range of books on spirituality, magic, and the occult. Our mission is to provide our customers with the knowledge and tools they need to explore their spiritual path and connect with the mystical world. We believe that books have the power to transform lives, and we are committed to helping our customers discover the magic within themselves through the books we offer.",
  
                ),
              ),
              
              Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 50),
  margin: const EdgeInsets.only(top: 20),
  decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
  child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFH6wVQiyNAj5KJYkcKXvocB-aILcknKTv1PAGz7PtmW1PCqvUbBBu3lZ9o-YcSW_5IIOx9lINscrp8JiCh84HV1onsFz6lP-FfOu_pg&s=10',height:80,),
),
              ),
              ),
        ],
      ),
    );
  }
}
