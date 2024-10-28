import 'package:sensors_plus/sensors_plus.dart';

class Accelerometer {
  double x = 0.0, y = 0.0, z = 0.0;

  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      x = event.x;
      y = event.y;
      z = event.z;
    });
  }
}
