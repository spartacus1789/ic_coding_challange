import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ic_coding_challange/common/FirebaseUtils.dart';
import 'package:ic_coding_challange/common/RouteHandler.dart';
import 'package:ic_coding_challange/controllers/LoginBloc.dart';
import 'package:ic_coding_challange/style/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //save firebaseUtil service global
  // getIt.registerSingleton<FirebaseUtils>(
  //   FirebaseUtils(),
  //   signalsReady: true,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp(
        title: '2F Challange',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteHandler.onGenerateRoute,
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
