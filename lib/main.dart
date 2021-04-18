import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc_example/router/back_button_dispatcher.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/bloc.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/configs.dart';
import 'package:flutter_navigation_bloc_example/router/router_delegate.dart';
import 'package:flutter_navigation_bloc_example/router/router_parser.dart';

void main() {
  runApp(App());
}

final routerBloc = RouterBloc(SplashPageConfig());

class App extends StatelessWidget {
  final routerDelegate = AppRouterDelegate();
  final routeInformationParser = RouteParser();

  App() {
    routerDelegate.setBloc(routerBloc);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => routerBloc,
      child: MaterialApp.router(
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        backButtonDispatcher: AppBackButtonDispatcher(routerDelegate),
      ),
    );
  }
}
