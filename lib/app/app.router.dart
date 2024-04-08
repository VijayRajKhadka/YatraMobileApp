// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;
import 'package:yatra/model/trek_model.dart' as _i9;
import 'package:yatra/ui/views/home_view/home_view.dart' as _i6;
import 'package:yatra/ui/views/home_view/pages/trek_detail_view/trek_details_view.dart'
    as _i7;
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

  static const trekDetailsView = '/trek-details-view';

  static const all = <String>{
    splashScreenView,
    onBoardingView,
    registerView,
    loginView,
    homeView,
    trekDetailsView,
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
      Routes.trekDetailsView,
      page: _i7.TrekDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.OnBoardingView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.OnBoardingView(),
        settings: data,
      );
    },
    _i4.RegisterView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.RegisterView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.HomeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.HomeView(),
        settings: data,
      );
    },
    _i7.TrekDetailsView: (data) {
      final args = data.getArgs<TrekDetailsViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.TrekDetailsView(trekModel: args.trekModel, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class TrekDetailsViewArguments {
  const TrekDetailsViewArguments({
    required this.trekModel,
    this.key,
  });

  final _i9.TrekModel trekModel;

  final _i10.Key? key;

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

extension NavigatorStateExtension on _i11.NavigationService {
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

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
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

  Future<dynamic> navigateToTrekDetailsView({
    required _i9.TrekModel trekModel,
    _i10.Key? key,
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

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
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

  Future<dynamic> replaceWithTrekDetailsView({
    required _i9.TrekModel trekModel,
    _i10.Key? key,
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
}
