import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/local_storage_service.dart';


class SplashScreenViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();
  final LocalStorageService _localStorageService = locator<LocalStorageService>();

  void onStartApp() async {
    await Future.delayed(const Duration(milliseconds: 4000));

    _navigationService.navigateToOnBoardingView();
    if(await _localStorageService.getInitialAppRun()==null || await _localStorageService.getInitialAppRun()==true){
      _navigationService.navigateToOnBoardingView();
      await _localStorageService.setInitialAppRun();
    }
    else{
      if( await _localStorageService.getToken()!=null) {
        _navigationService.replaceWithHomeView();
      }else{
        _navigationService.replaceWithLoginView();
      }
    }
  }
}