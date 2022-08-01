import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/components/three_bounce_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_builder.dart';
import 'package:superapp_my_bloc/src/core/infra/components/page_widget.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/app_masks.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/home/bloc/crud_auth_home_bloc.dart';

class CrudAuthHomePage extends PageWidget<CrudAuthHomeBloc> {
  CrudAuthHomePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Home'),
        foregroundColor: Utils.getLuminance(color),
        actions: [
          IconButton(
            onPressed: () => bloc.signOut(),
            iconSize: AppDimension.size_2,
            icon: const Icon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: AppExtension.textColor,
            ),
          )
        ],
      ),
      body: BlocBuilder<CrudAuthHomeBloc, CrudAuthHomeState>(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.user.displayName == null) {
            return Center(
              child: ThreeBounceComponent(
                color: color,
              ),
            );
          }

          return BaseViewComponent(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bloc.user.displayName!,
                style: AppFonts.titleLarge(),
              ),
              Text(
                bloc.user.email!,
                style: AppFonts.bodyLarge(),
              ),
              const SizedBox(
                height: AppDimension.size_3,
              ),
              ButtonComponent(
                color: color,
                func: () {
                  _buildBottomSheet(context, color);
                },
                child: const Text('Mudar Nome'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<Widget?> _buildBottomSheet(BuildContext context, color) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: AppDimension.size_2,
                  ),
                  Text(
                    'Altere seu nome',
                    style: AppFonts.titleLarge(),
                  ),
                  const SizedBox(
                    height: AppDimension.size_3,
                  ),
                  InputComponent(
                    label: 'Nome',
                    controller: _nameEC,
                    masks: [AppMasks.onlyLetters],
                    validator: AppValidator.required('Obrigatório'),
                  ),
                  const SizedBox(
                    height: AppDimension.size_3,
                  ),
                  BlocBuilder<CrudAuthHomeBloc, CrudAuthHomeState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return LoaderComponent(
                        color: color,
                        loading: state is CrudAuthHomeLoading,
                        child: ButtonComponent(
                          color: color,
                          child: const Text('Alterar'),
                          func: () {
                            if (_formKey.currentState!.validate()) {
                              bloc.changeName(_nameEC.text);
                            }
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
