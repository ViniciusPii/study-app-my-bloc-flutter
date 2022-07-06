import 'package:flutter/material.dart';

import 'package:superapp_my_bloc/src/core/bloc/bloc.dart';
import 'package:superapp_my_bloc/src/injection.dart';

class AppModule<B extends Bloc> {
  AppModule({
    B? bloc,
    required Widget page,
    required String routeName,
  })  : _routeName = routeName,
        _page = page,
        _bloc = bloc;

  final B? _bloc;
  final Widget _page;
  final String _routeName;

  late final route = {
    _routeName: (contex) => _page,
  };

  void getDependence() {
    di.registerFactory(() => _bloc!);
  }
}
