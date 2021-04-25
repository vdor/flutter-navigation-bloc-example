import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class PageConfig extends Equatable {
  const PageConfig({
    required this.key,
  });

  final String key;
  String get path;
  Widget buildContent();

  Page buildPage() {
    return MaterialPage(
      child: buildContent(),
      key: ValueKey(key),
      name: path,
      arguments: this,
    );
  }

  @override
  get props => [key, path];
}
