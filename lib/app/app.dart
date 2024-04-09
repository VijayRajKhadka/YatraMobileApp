import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/services/authentication_services.dart';
import 'package:yatra/services/local_storage_service.dart';
import 'package:yatra/services/restaurant_services.dart';
import 'package:yatra/services/trek_services.dart';
import 'package:yatra/services/user_auth_services.dart';

import '../services/place_services.dart';
import '../services/review_services.dart';
import '../ui/views/home_view/home_view.dart';
import '../ui/views/home_view/pages/place_detail_view/place_details_view.dart';
import '../ui/views/home_view/pages/place_screen/place_screen_view.dart';
import '../ui/views/home_view/pages/trek_detail_view/trek_details_view.dart';
import '../ui/views/home_view/pages/trek_screen/trek_screen_view.dart';
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
        MaterialRoute(page: TrekView),
        MaterialRoute(page: PlaceView),
        MaterialRoute(page: TrekDetailsView),
        MaterialRoute(page: PlaceDetailView)


    ],
    dependencies: [
        Singleton(classType: NavigationService),
        Singleton(classType: LocalStorageService),
        Singleton(classType: AuthService),
        Singleton(classType: UserAuthServices),
        Singleton(classType: TrekServices),
        Singleton(classType: RestaurantServices),
        Singleton(classType: PlaceServices),
        Singleton(classType: ReviewServices)

    ]
)



class App{}