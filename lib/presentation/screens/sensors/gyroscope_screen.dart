import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:micelaneos/presentation/providers/providers.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giroscopio',
        ),
      ),
      body: Center(
        child: gyroscope$.when(
          data: (data) => Text(
            data.toString(),
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          error: (error, stacktrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
