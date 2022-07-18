import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';

class DetailsResultPage extends StatelessWidget {
  const DetailsResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: args.color,
        title: const Text('Resultado'),
      ),
      body: Center(
        child: _buildResult(args),
      ),
    );
  }

  Widget _buildResult(args) {
    return Text(
      'O resultado é ${args.result}',
      style: AppFonts.titleLarge(),
    );
  }
}
