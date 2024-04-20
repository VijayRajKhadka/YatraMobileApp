import 'package:stacked/stacked.dart';

class EventCardModel extends BaseViewModel{
  bool _showFullBody = false;

  bool get showFullBody => _showFullBody;

  void toggleShowFullBody() {
    _showFullBody = !_showFullBody;
    notifyListeners();
  }
}