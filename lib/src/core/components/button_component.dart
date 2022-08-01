import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    Key? key,
    required this.color,
    required this.child,
    required this.func,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Utils.getLuminance(color),
      ),
      child: child,
    );
  }
}
