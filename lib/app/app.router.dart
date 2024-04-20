// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i18;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i23;
import 'package:yatra/model/historical_place.dart' as _i22;
import 'package:yatra/model/place_model.dart' as _i21;
import 'package:yatra/model/restaurant_model.dart' as _i19;
import 'package:yatra/model/trek_model.dart' as _i20;
import 'package:yatra/ui/views/home_view/home_view.dart' as _i6;
import 'package:yatra/ui/views/home_view/pages/event_screen/event_screen_view.dart'
    as _i17;
import 'package:yatra/ui/views/home_view/pages/historical_detail_screen/historical_details_view.dart'
    as _i15;
import 'package:yatra/ui/views/home_view/pages/map_screen/map_screen_view.dart'
    as _i13;
import 'package:yatra/ui/views/home_view/pages/place_detail_view/place_details_view.dart'
    as _i12;
import 'package:yatra/ui/views/home_view/pages/place_screen/place_screen_view.dart'
    as _i8;
import 'package:yatra/ui/views/home_view/pages/recommendation_screen/recommendation_screen_view.dart'
    as _i14;
import 'package:yatra/ui/views/home_view/pages/restaurant_details_screen/restaurant_details_view.dart'
    as _i10;
import 'package:yatra/ui/views/home_view/pages/restaurant_screen/restaurant_screen_view.dart'
    as _i9;
import 'package:yatra/ui/views/home_view/pages/trek_detail_view/trek_details_view.dart'
    as _i11;
import 'package:yatra/ui/views/home_view/pages/trek_screen/trek_screen_view.dart'
    as _i7;
import 'package:yatra/ui/views/journey_view/journey_view.dart' as _i16;
import 'package:yatra/ui/views/login_view/login_view.dart' as _i5;
import 'package:yatra/ui/views/on_boarding_view/on_boarding_view.dart' as _i3;
import 'package:yatra/ui/views/register_view/register_view.dart' as _i4;
import 'package:yatra/ui/views/splash_screen_view/splash_screen_view.dart'
    as _i2;

class Routes {
  static const splashScreenView = '/';

  static const onBoardingView = '/on-boarding-view';

  static const registerView = '/register-view';

  static const loginView = '/login-view';

  static const homeView = '/home-view';

  static const trekView = '/trek-view';

  static const placeView = '/place-view';

  static const restaurantView = '/restaurant-view';

  static const restaurantDetailView = '/restaurant-detail-view';

  static const trekDetailsView = '/trek-details-view';

  static const placeDetailView = '/place-detail-view';

  static const mapView = '/map-view';

  static const recommendationView = '/recommendation-view';

  static const historicalDetailsView = '/historical-details-view';

  static const journeyView = '/journey-view';

  static const eventScreenView = '/event-screen-view';

  static const all = <String>{
    splashScreenView,
    onBoardingView,
    registerView,
    loginView,
    homeView,
    trekView,
    placeView,
    restaurantView,
    restaurantDetailView,
    trekDetailsView,
    placeDetailView,
    mapView,
    recommendationView,
    historicalDetailsView,
    journeyView,
    eventScreenView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.onBoardingView,
      page: _i3.OnBoardingView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i4.RegisterView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i6.HomeView,
    ),
    _i1.RouteDef(
      Routes.trekView,
      page: _i7.TrekView,
    ),
    _i1.RouteDef(
      Routes.placeView,
      page: _i8.PlaceView,
    ),
    _i1.RouteDef(
      Routes.restaurantView,
      page: _i9.RestaurantView,
    ),
    _i1.RouteDef(
      Routes.restaurantDetailView,
      page: _i10.RestaurantDetailView,
    ),
    _i1.RouteDef(
      Routes.trekDetailsView,
      page: _i11.TrekDetailsView,
    ),
    _i1.RouteDef(
      Routes.placeDetailView,
      page: _i12.PlaceDetailView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i13.MapView,
    ),
    _i1.RouteDef(
      Routes.recommendationView,
      page: _i14.RecommendationView,
    ),
    _i1.RouteDef(
      Routes.historicalDetailsView,
      page: _i15.HistoricalDetailsView,
    ),
    _i1.RouteDef(
      Routes.journeyView,
      page: _i16.JourneyView,
    ),
    _i1.RouteDef(
      Routes.eventScreenView,
      page: _i17.EventScreenView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.OnBoardingView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.OnBoardingView(),
        settings: data,
      );
    },
    _i4.RegisterView: (data) {
      final args = data.getArgs<RegisterViewArguments>(
        orElse: () => const RegisterViewArguments(),
      );
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.RegisterView(key: args.key, errorMessage: args.errorMessage),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.HomeView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.HomeView(),
        settings: data,
      );
    },
    _i7.TrekView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.TrekView(),
        settings: data,
      );
    },
    _i8.PlaceView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.PlaceView(),
        settings: data,
      );
    },
    _i9.RestaurantView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.RestaurantView(),
        settings: data,
      );
    },
    _i10.RestaurantDetailView: (data) {
      final args = data.getArgs<RestaurantDetailViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.RestaurantDetailView(args.restaurantModel, key: args.key),
        settings: data,
      );
    },
    _i11.TrekDetailsView: (data) {
      final args = data.getArgs<TrekDetailsViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.TrekDetailsView(trekModel: args.trekModel, key: args.key),
        settings: data,
      );
    },
    _i12.PlaceDetailView: (data) {
      final args = data.getArgs<PlaceDetailViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.PlaceDetailView(args.placeModel, key: args.key),
        settings: data,
      );
    },
    _i13.MapView: (data) {
      final args = data.getArgs<MapViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.MapView(
            latitude: args.latitude, longitude: args.longitude, key: args.key),
        settings: data,
      );
    },
    _i14.RecommendationView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.RecommendationView(),
        settings: data,
      );
    },
    _i15.HistoricalDetailsView: (data) {
      final args = data.getArgs<HistoricalDetailsViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.HistoricalDetailsView(
            historicalPlaceModel: args.historicalPlaceModel, key: args.key),
        settings: data,
      );
    },
    _i16.JourneyView: (data) {
      final args = data.getArgs<JourneyViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.JourneyView(
            historicalPlaceModel: args.historicalPlaceModel, key: args.key),
        settings: data,
      );
    },
    _i17.EventScreenView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.EventScreenView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class RegisterViewArguments {
  const RegisterViewArguments({
    this.key,
    this.errorMessage = '',
  });

  final _i18.Key? key;

  final String errorMessage;

  @override
  String toString() {
    return '{"key": "$key", "errorMessage": "$errorMessage"}';
  }

  @override
  bool operator ==(covariant RegisterViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    return key.hashCode ^ errorMessage.hashCode;
  }
}

class RestaurantDetailViewArguments {
  const RestaurantDetailViewArguments({
    required this.restaurantModel,
    this.key,
  });

  final _i19.RestaurantModel restaurantModel;

  final _i18.Key? key;

  @override
  String toString() {
    return '{"restaurantModel": "$restaurantModel", "key": "$key"}';
  }

  @override
  bool operator ==(covariant RestaurantDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.restaurantModel == restaurantModel && other.key == key;
  }

  @override
  int get hashCode {
    return restaurantModel.hashCode ^ key.hashCode;
  }
}

class TrekDetailsViewArguments {
  const TrekDetailsViewArguments({
    required this.trekModel,
    this.key,
  });

  final _i20.TrekModel trekModel;

  final _i18.Key? key;

  @override
  String toString() {
    return '{"trekModel": "$trekModel", "key": "$key"}';
  }

  @override
  bool operator ==(covariant TrekDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.trekModel == trekModel && other.key == key;
  }

  @override
  int get hashCode {
    return trekModel.hashCode ^ key.hashCode;
  }
}

class PlaceDetailViewArguments {
  const PlaceDetailViewArguments({
    required this.placeModel,
    this.key,
  });

  final _i21.PlaceModel placeModel;

  final _i18.Key? key;

  @override
  String toString() {
    return '{"placeModel": "$placeModel", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PlaceDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.placeModel == placeModel && other.key == key;
  }

  @override
  int get hashCode {
    return placeModel.hashCode ^ key.hashCode;
  }
}

class MapViewArguments {
  const MapViewArguments({
    required this.latitude,
    required this.longitude,
    this.key,
  });

  final double latitude;

  final double longitude;

  final _i18.Key? key;

  @override
  String toString() {
    return '{"latitude": "$latitude", "longitude": "$longitude", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MapViewArguments other) {
    if (identical(this, other)) return true;
    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.key == key;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^ longitude.hashCode ^ key.hashCode;
  }
}

class HistoricalDetailsViewArguments {
  const HistoricalDetailsViewArguments({
    required this.historicalPlaceModel,
    this.key,
  });

  final _i22.HistoricalPlaceModel historicalPlaceModel;

  final _i18.Key? key;

  @override
  String toString() {
    return '{"historicalPlaceModel": "$historicalPlaceModel", "key": "$key"}';
  }

  @override
  bool operator ==(covariant HistoricalDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.historicalPlaceModel == historicalPlaceModel &&
        other.key == key;
  }

  @override
  int get hashCode {
    return historicalPlaceModel.hashCode ^ key.hashCode;
  }
}

class JourneyViewArguments {
  const JourneyViewArguments({
    required this.historicalPlaceModel,
    this.key,
  });

  final _i22.HistoricalPlaceModel historicalPlaceModel;

  final _i18.Key? key;

  @override
  String toString() {
    return '{"historicalPlaceModel": "$historicalPlaceModel", "key": "$key"}';
  }

  @override
  bool operator ==(covariant JourneyViewArguments other) {
    if (identical(this, other)) return true;
    return other.historicalPlaceModel == historicalPlaceModel &&
        other.key == key;
  }

  @override
  int get hashCode {
    return historicalPlaceModel.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i23.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView({
    _i18.Key? key,
    String errorMessage = '',
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key, errorMessage: errorMessage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrekView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.trekView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlaceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.placeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRestaurantView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.restaurantView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRestaurantDetailView({
    required _i19.RestaurantModel restaurantModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.restaurantDetailView,
        arguments: RestaurantDetailViewArguments(
            restaurantModel: restaurantModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrekDetailsView({
    required _i20.TrekModel trekModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.trekDetailsView,
        arguments: TrekDetailsViewArguments(trekModel: trekModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlaceDetailView({
    required _i21.PlaceModel placeModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.placeDetailView,
        arguments: PlaceDetailViewArguments(placeModel: placeModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMapView({
    required double latitude,
    required double longitude,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mapView,
        arguments: MapViewArguments(
            latitude: latitude, longitude: longitude, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecommendationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.recommendationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistoricalDetailsView({
    required _i22.HistoricalPlaceModel historicalPlaceModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.historicalDetailsView,
        arguments: HistoricalDetailsViewArguments(
            historicalPlaceModel: historicalPlaceModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJourneyView({
    required _i22.HistoricalPlaceModel historicalPlaceModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.journeyView,
        arguments: JourneyViewArguments(
            historicalPlaceModel: historicalPlaceModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEventScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.eventScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView({
    _i18.Key? key,
    String errorMessage = '',
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key, errorMessage: errorMessage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrekView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.trekView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlaceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.placeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRestaurantView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.restaurantView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRestaurantDetailView({
    required _i19.RestaurantModel restaurantModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.restaurantDetailView,
        arguments: RestaurantDetailViewArguments(
            restaurantModel: restaurantModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrekDetailsView({
    required _i20.TrekModel trekModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.trekDetailsView,
        arguments: TrekDetailsViewArguments(trekModel: trekModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlaceDetailView({
    required _i21.PlaceModel placeModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.placeDetailView,
        arguments: PlaceDetailViewArguments(placeModel: placeModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMapView({
    required double latitude,
    required double longitude,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mapView,
        arguments: MapViewArguments(
            latitude: latitude, longitude: longitude, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecommendationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.recommendationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistoricalDetailsView({
    required _i22.HistoricalPlaceModel historicalPlaceModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.historicalDetailsView,
        arguments: HistoricalDetailsViewArguments(
            historicalPlaceModel: historicalPlaceModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJourneyView({
    required _i22.HistoricalPlaceModel historicalPlaceModel,
    _i18.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.journeyView,
        arguments: JourneyViewArguments(
            historicalPlaceModel: historicalPlaceModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEventScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.eventScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
