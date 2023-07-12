import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider =
    StateNotifierProvider<PermissionNotifier, PermissionState>((ref) {
  return PermissionNotifier();
});

class PermissionNotifier extends StateNotifier<PermissionState> {
  PermissionNotifier() : super(const PermissionState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsArray[0],
      photoLibrary: permissionsArray[1],
      sensor: permissionsArray[2],
      location: permissionsArray[3],
      locationAlways: permissionsArray[4],
      locationWhenInUse: permissionsArray[5],
    );
  }

  void openSettingsScreen() {
    openAppSettings();
  }

  void _checkPermissionState(PermissionStatus status) {
    if (status == PermissionStatus.permanentlyDenied) {
      openSettingsScreen();
    }
  }

  Future<void> requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copyWith(
      camera: status,
    );
    _checkPermissionState(status);
  }

  Future<void> requestPhotoLibrary() async {
    final status = await Permission.photos.request();
    state = state.copyWith(
      photoLibrary: status,
    );
    _checkPermissionState(status);
  }

  Future<void> requestLocation() async {
    final status = await Permission.location.request();
    state = state.copyWith(
      location: status,
    );
    if (status == PermissionStatus.permanentlyDenied) {
      openSettingsScreen();
    }
  }

  Future<void> requestSensors() async {
    final status = await Permission.sensors.request();
    state = state.copyWith(
      sensor: status,
    );
    _checkPermissionState(status);
  }
}

class PermissionState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensor;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  const PermissionState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensor = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
  });

  bool get cameraGranted => camera == PermissionStatus.granted;

  bool get photoLibraryGranted => photoLibrary == PermissionStatus.granted;

  bool get sensorGranted => sensor == PermissionStatus.granted;

  bool get locationGranted => location == PermissionStatus.granted;

  bool get locationAlwaysGranted => locationAlways == PermissionStatus.granted;

  bool get locationWhenInUseGranted =>
      locationWhenInUse == PermissionStatus.granted;

  PermissionState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensor,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionState(
        camera: camera ?? this.camera,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        sensor: sensor ?? this.sensor,
        location: location ?? this.location,
        locationAlways: locationAlways ?? this.locationAlways,
        locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
      );
}
