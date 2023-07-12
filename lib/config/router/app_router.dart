import 'package:go_router/go_router.dart';
import 'package:micelaneos/presentation/presentation.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionScreen(),
    ),
    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => const GyroscopeScreen(),
    ),
    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => const AccelerometerScreen(),
    ),
    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen(),
    ),
    GoRoute(
      path: '/compas',
      builder: (context, state) => const CompasScreen(),
    ),
    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen(),
    ),
  ],
);
