import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:micelaneos/presentation/providers/providers.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _PermissionView(),
    );
  }
}

class _PermissionView extends ConsumerWidget {
  const _PermissionView();

  @override
  Widget build(BuildContext context, ref) {
    final permissions = ref.watch(permissionsProvider);
    return ListView(
      children: [
        CheckboxListTile(
          title: const Text('Cámara'),
          subtitle: Text(permissions.camera.toString()),
          value: permissions.cameraGranted,
          onChanged: (_) =>
              ref.read(permissionsProvider.notifier).requestCameraAccess(),
        ),
        CheckboxListTile(
          title: const Text('Galeria de fotos'),
          subtitle: Text(permissions.photoLibrary.toString()),
          value: permissions.photoLibraryGranted,
          onChanged: (_) =>
              ref.read(permissionsProvider.notifier).requestPhotoLibrary(),
        ),
        CheckboxListTile(
          title: const Text('Localización'),
          subtitle: Text(permissions.location.toString()),
          value: permissions.locationGranted,
          onChanged: (_) =>
              ref.read(permissionsProvider.notifier).requestLocation(),
        ),
        CheckboxListTile(
          title: const Text('Sensores'),
          subtitle: Text(permissions.sensor.toString()),
          value: permissions.sensorGranted,
          onChanged: (_) =>
              ref.read(permissionsProvider.notifier).requestSensors(),
        ),
      ],
    );
  }
}
