import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/events.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/base.dart';

class AppRouterDelegate extends RouterDelegate<PageConfig> with ChangeNotifier {
  RouterBloc bloc;

  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey();

  bool get canPop => bloc.state.pages.isNotEmpty;

  setBloc(RouterBloc bloc) {
    this.bloc = bloc;
    bloc.stream.listen((state) {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: _buildPages(),
    );
  }

  @override
  Future<bool> popRoute() {
    if (canPop) {
      bloc.add(RouterPopEvent());
      return Future.value(true);
    }

    return Future.value(false);
  }

  bool _onPopPage(Route route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop) {
      bloc.add(const RouterPopEvent());
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfig configuration) {
    final shouldSetPath = bloc.state.pages.isEmpty ||
        (bloc.state.pages.last.arguments as PageConfig) == configuration;

    if (shouldSetPath) {
      bloc.add(RouterSetPathEvent([configuration]));
    }

    return SynchronousFuture(null);
  }

  List<Page> _buildPages() {
    return List.unmodifiable(bloc.state.pages);
  }
}
