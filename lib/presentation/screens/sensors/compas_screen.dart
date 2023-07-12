import 'package:flutter/material.dart';

class CompasScreen extends StatelessWidget {
  const CompasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brújula',
        ),
      ),
      body: const Center(
        child: Text('Hola'),
      ),
    );
  }
}
