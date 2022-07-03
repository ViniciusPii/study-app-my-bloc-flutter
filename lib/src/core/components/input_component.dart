import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  const InputComponent({
    Key? key,
    required this.label,
    required this.validator,
    this.controller,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

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
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
