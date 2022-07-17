import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';

class CrudAuthHomePage extends StatefulWidget {
  const CrudAuthHomePage({Key? key}) : super(key: key);

  @override
  State<CrudAuthHomePage> createState() => _CrudAuthHomePageState();
}

class _CrudAuthHomePageState extends State<CrudAuthHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));
      get<AuthRepository>().signOut();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(),
    );
  }
}
