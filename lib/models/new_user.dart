import 'package:pedometer/screens/homescreen.dart';
import 'package:pedometer/screens/landing_page.dart';

class NewUser {
  final bool _isNew = true;

  firstPage() {
    return _isNew ? LandinPage() : HomeScreen();
  }
}
