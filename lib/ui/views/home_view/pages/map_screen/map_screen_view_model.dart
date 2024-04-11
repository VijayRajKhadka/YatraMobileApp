import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreenViewMode extends BaseViewModel{

  void launchGoogleMaps(double latitude, double longitude) async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  double _currentZoom = 14;
  final double _maxZoom = 18;
  final double _zoomIncrement = 1.0;

  void zoomIn(double latitude, double longitude) {
    if (_currentZoom < _maxZoom) {
      _currentZoom += _zoomIncrement;
      rebuildUi();
      print(_currentZoom);
    }
  }

  // Getter method to retrieve the current zoom level
  double get currentZoom => _currentZoom;
}