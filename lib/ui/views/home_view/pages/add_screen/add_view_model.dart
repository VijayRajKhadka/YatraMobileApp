import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yatra/core/helper/api_helper.dart';

class AddViewModel extends BaseViewModel {

  void launchTrek() async {
    final url = Uri.parse('${ApiHelper.reactUrl}addTrek');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void launchPlace() async {
    final url = Uri.parse('${ApiHelper.reactUrl}addPlace');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void launchRestaurant() async {
    final url = Uri.parse('${ApiHelper.reactUrl}addRestaurant');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
