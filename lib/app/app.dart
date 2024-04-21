import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/services/authentication_services.dart';
import 'package:yatra/services/historical_place_services.dart';
import 'package:yatra/services/local_storage_service.dart';
import 'package:yatra/services/restaurant_services.dart';
import 'package:yatra/services/trek_services.dart';
import 'package:yatra/services/user_auth_services.dart';
import 'package:yatra/ui/views/home_view/pages/map_screen/map_screen_view.dart';
import 'package:yatra/ui/views/home_view/pages/recommendation_screen/recommendation_screen_view.dart';
import 'package:yatra/ui/views/home_view/pages/travel_agency_screen/travel_agency_view.dart';

import '../services/event_services.dart';
import '../services/place_services.dart';
import '../services/recommendation_services.dart';
import '../services/register_services.dart';
import '../services/review_services.dart';
import '../services/travel_agency_services.dart';
import '../ui/views/home_view/home_view.dart';
import '../ui/views/home_view/pages/event_screen/event_screen_view.dart';
import '../ui/views/home_view/pages/historical_detail_screen/historical_details_view.dart';
import '../ui/views/home_view/pages/place_detail_view/place_details_view.dart';
import '../ui/views/home_view/pages/place_screen/place_screen_view.dart';
import '../ui/views/home_view/pages/restaurant_details_screen/restaurant_details_view.dart';
import '../ui/views/home_view/pages/restaurant_screen/restaurant_screen_view.dart';
import '../ui/views/home_view/pages/travel_agency_screen/travel_agency_detail_view.dart';
import '../ui/views/home_view/pages/trek_detail_view/trek_details_view.dart';
import '../ui/views/home_view/pages/trek_screen/trek_screen_view.dart';
import '../ui/views/journey_view/journey_view.dart';
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
        MaterialRoute(page: RestaurantView),
        MaterialRoute(page: RestaurantDetailView),
        MaterialRoute(page: TrekDetailsView),
        MaterialRoute(page: PlaceDetailView),
        MaterialRoute(page: MapView),
        MaterialRoute(page: RecommendationView),
        MaterialRoute(page: HistoricalDetailsView),
        MaterialRoute(page: JourneyView),
        MaterialRoute(page: EventScreenView),
        MaterialRoute(page: TravelAgencyView),
        MaterialRoute(page: TravelAgencyDetailView),




    ],
    dependencies: [
        Singleton(classType: NavigationService),
        Singleton(classType: LocalStorageService),
        Singleton(classType: AuthService),
        Singleton(classType: UserAuthServices),
        Singleton(classType: TrekServices),
        Singleton(classType: RestaurantServices),
        Singleton(classType: PlaceServices),
        Singleton(classType: ReviewServices),
        Singleton(classType: RecommendationServices),
        Singleton(classType: RegisterService ),
        Singleton(classType: HistoricalPlaceServices ),
        Singleton(classType: EventServices ),
        Singleton(classType: TravelAgencyServices ),

    ]
)



class App{}