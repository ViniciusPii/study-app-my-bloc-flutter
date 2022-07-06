import 'package:flutter/material.dart';

class AppRoute {
  AppRoute({
    required this.name,
    required page,
  }) : _page = page;

  final String name;
  final WidgetBuilder _page;

  late final buildRoute = {
    name: _page,
  };
}
