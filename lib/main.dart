import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/bloc_app/home_bloc/bloc.dart';
import 'package:image_app/bloc_app/home_bloc/event.dart';
import 'package:image_app/shared/bloc_observer/bloc_observer.dart';

import 'shared/route/app_route.dart';

void main() {
  Bloc.observer = BlocObserverToApp();

  runApp(BlocProvider(
    create: (context) => HomeBloc()..add(GetAllImages()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  AppRoute appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}