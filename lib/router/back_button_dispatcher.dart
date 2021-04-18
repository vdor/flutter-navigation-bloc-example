import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_bloc_example/router/router_delegate.dart';

class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  final AppRouterDelegate _routerDelegate;

  AppBackButtonDispatcher(this._routerDelegate);

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
