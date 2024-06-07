import 'package:flutter/material.dart';
import 'package:practical_app/pages/home/bloc/category_bloc.dart';
import 'package:practical_app/pages/home/bloc/category_event.dart';
import 'package:practical_app/pages/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      BlocProvider(
        create: (context) => CategoryBloc()..add(FetchCategories()),
        child: const HomeScreen(),
      ),

    );
  }
}


