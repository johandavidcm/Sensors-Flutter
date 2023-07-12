import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:micelaneos/presentation/providers/providers.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giroscópio',
        ),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (data) => MovingBall(
            x: data.x,
            y: data.y,
          ),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  const MovingBall({
    super.key,
    required this.x,
    required this.y,
  });

  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;
    final screenHeight = size.height;
    double currentYPosition = (y * 500);
    double currentXPosition = (x * 500);
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: (currentYPosition - 25) + (screenWidth / 2),
          top: (currentXPosition - 25) + (screenHeight / 2),
          duration: const Duration(
            milliseconds: 1000,
          ),
          curve: Curves.easeInOut,
          child: const Ball(),
        ),
        Text(
          '''
      X: $x,
      Y: $y,
''',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }
}
