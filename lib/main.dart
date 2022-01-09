import 'package:dictionary_app/cubit/dictionary_cubit.dart';
import 'package:dictionary_app/repo/word_repo.dart';
import 'package:dictionary_app/screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => DictionaryCubit(WordRepository()),
        child: const HomeScreen(),
      ),
    );
  }
}
