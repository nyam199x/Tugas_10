import 'package:flutter/material.dart';

class LatihanIconAvatar extends StatelessWidget {
  const LatihanIconAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Icon Avatar'),
      ),
      body: const Center(
        child: CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person,
            size: 50,
          ),
        ),
      ),
    );
  }
}