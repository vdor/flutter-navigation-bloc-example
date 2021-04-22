import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/base.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/configs.dart';

class RouteParser extends RouteInformationParser<PageConfig> {
  @override
  Future<PageConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.isEmpty) {
      return SplashPageConfig();
    }

    final path = '/' + uri.pathSegments[0];

    switch (path) {
      case splashPath:
        return SplashPageConfig();
      case welcomePath:
        return WelcomePageConfig();
      case loginPath:
        return LoginPageConfig();
      case tasksPath:
        return TasksPageConfig();
      case taskDetailPath:
        return TaskDetailPageConfig(path: routeInformation.location);
      case settingsPath:
        return SettingsConfig();
      default:
        return SplashPageConfig();
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfig configuration) {
    return RouteInformation(location: configuration.path);
  }
}
