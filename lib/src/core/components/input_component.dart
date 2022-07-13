import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  const InputComponent({
    Key? key,
    this.controller,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    required this.label,
    required this.validator,
  }) : super(key: key);

  final String label;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        label: Text(label),
        border: const OutlineInputBorder(),
      ),
      autofocus: true,
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
