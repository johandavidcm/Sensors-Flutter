import 'package:flutter/material.dart';

class AccelerometerScreen extends StatelessWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acelerometro',
        ),
      ),
      body: const Center(
        child: Text('Hola'),
      ),
    );
  }
}