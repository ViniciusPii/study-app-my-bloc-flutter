import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/infra/bloc.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';

abstract class PageWidget<B extends Bloc> extends StatefulWidget {
  PageWidget({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context);

  void onInit() {}

  void dispose() {}

  final B _bloc = get<B>();

  B get bloc => _bloc;

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
