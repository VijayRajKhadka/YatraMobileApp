import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/services/authentication_services.dart';
import 'package:yatra/services/local_storage_service.dart';
import 'package:yatra/services/trek_services.dart';
import 'package:yatra/services/user_auth_services.dart';

import '../ui/views/home_view/home_view.dart';
import '../ui/views/login_view/login_view.dart';
import '../ui/views/on_boarding_view/on_boarding_view.dart';
import '../ui/views/register_view/register_view.dart';
import '../ui/views/splash_screen_view/splash_screen_view.dart';

@StackedApp(
    routes: [
        MaterialRoute(page: SplashScreenView,initial: true),
        MaterialRoute(page: OnBoardingView),
        MaterialRoute(page: RegisterView),
        MaterialRoute(page: LoginView),
        MaterialRoute(page: HomeView),

    ],
    dependencies: [
        Singleton(classType: NavigationService),
        Singleton(classType: LocalStorageService),
        Singleton(classType: AuthService),
        Singleton(classType: UserAuthServices),
        Singleton(classType: TrekServices)

    ]
)



class App{}