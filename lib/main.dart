import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/application/application.dart';
import 'src/config/bloc/app_bloc_observer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:  Colors.white,
    statusBarIconBrightness: Brightness.light,
  ));
   BlocOverrides.runZoned(
          () =>
          runApp(const Application()),
      blocObserver: AppBlocObserver());
}

