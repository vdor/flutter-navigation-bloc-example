import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class RouterState extends Equatable {
  late final List<Page> pages;

  RouterState({required this.pages});

  @override
  List<Object> get props => [pages];
}
