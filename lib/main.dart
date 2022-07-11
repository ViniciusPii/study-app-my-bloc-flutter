import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/firebase_options.dart';
import 'package:superapp_my_bloc/src/app.dart';
import 'package:superapp_my_bloc/src/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  injection();
  runApp(const App());
}
