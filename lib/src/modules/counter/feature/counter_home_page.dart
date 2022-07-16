import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_builder.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/bloc/counter_bloc.dart';

class CounterHomePage extends StatefulWidget {
  const CounterHomePage({Key? key}) : super(key: key);

  @override
  State<CounterHomePage> createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  late CounterBloc bloc;

  @override
  void initState() {
    bloc = get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () => bloc.resetCounter(),
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitlte(),
            const SizedBox(
              height: AppDimension.size_1,
            ),
            _buildButtons(color),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(Color color) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: bloc,
      builder: (context, state) {
        return LoaderComponent(
          color: color,
          loading: state is CounterLoading,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => bloc.increment(),
                child: Text(
                  '+',
                  style: AppFonts.titleLarge(),
                ),
              ),
              TextButton(
                onPressed: () => bloc.decrement(),
                child: Text(
                  '-',
                  style: AppFonts.titleLarge(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitlte() {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: bloc,
      builder: (context, state) {
        return Text(
          'Contador ${state.counter}',
          style: AppFonts.titleLarge(),
        );
      },
    );
  }
}
