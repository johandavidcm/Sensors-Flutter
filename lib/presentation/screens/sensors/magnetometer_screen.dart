import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final accelerometer$ = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Magnetometro',
        ),
      ),
      body: Center(
        child: accelerometer$.when(
          data: (data) => Text(data.toString()),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
