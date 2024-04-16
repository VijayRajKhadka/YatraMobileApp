// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/authentication_services.dart';
import '../services/local_storage_service.dart';
import '../services/place_services.dart';
import '../services/recommendation_services.dart';
import '../services/register_services.dart';
import '../services/restaurant_services.dart';
import '../services/review_services.dart';
import '../services/trek_services.dart';
import '../services/user_auth_services.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerSingleton(NavigationService());
  locator.registerSingleton(LocalStorageService());
  locator.registerSingleton(AuthService());
  locator.registerSingleton(UserAuthServices());
  locator.registerSingleton(TrekServices());
  locator.registerSingleton(RestaurantServices());
  locator.registerSingleton(PlaceServices());
  locator.registerSingleton(ReviewServices());
  locator.registerSingleton(RecommendationServices());
  locator.registerSingleton(RegisterService());
}
