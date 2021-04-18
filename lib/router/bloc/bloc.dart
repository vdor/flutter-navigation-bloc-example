import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/events.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/state.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/base.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc(PageConfig initialConf)
      : super(RouterState(pages: [initialConf.buildPage()]));

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    if (event is RouterPushEvent) {
      yield RouterState(pages: [
        ...state.pages,
        event.config.buildPage(),
      ]);
    }

    if (event is RouterSetPathEvent) {
      final List<Page> pages = event.configs.map((c) => c.buildPage()).toList();
      yield RouterState(pages: pages);
    }

    if (event is RouterPopEvent) {
      final List<Page> pages = [...state.pages]..removeLast();
      yield RouterState(pages: pages);
    }

    yield state;
  }
}
