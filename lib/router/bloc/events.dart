import 'package:equatable/equatable.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/base.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();

  @override
  List<Object> get props => [];
}

class RouterPushEvent extends RouterEvent {
  final PageConfig config;

  const RouterPushEvent(this.config);

  List<Object> get props => [config];
}

class RouterSetPathEvent extends RouterEvent {
  final List<PageConfig> configs;

  const RouterSetPathEvent(this.configs);

  List<Object> get props => [configs];
}

class RouterPopEvent extends RouterEvent {
  const RouterPopEvent();
}
