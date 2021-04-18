import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class RouterState extends Equatable {
  final List<Page> pages;

  const RouterState({@required this.pages});

  @override
  List<Object> get props => [pages];
}
