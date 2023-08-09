import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_book/screens/auth_page.dart';
import 'package:receipe_book/screens/homepage.dart';

import 'bloc/food_bloc.dart';

void main() {
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<FoodBloc>(
              create: (context) => FoodBloc(),
            ),
            // Other BlocProviders if needed
          ],

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}

