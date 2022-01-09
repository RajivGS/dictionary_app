import 'package:dictionary_app/cubit/dictionary_cubit.dart';
import 'package:dictionary_app/screens/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListScreen(state.words),
            ),
          );
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: cubit.state is WordSearchingState
              ? getLoadingWidget()
              : cubit.state is ErrorState
                  ? getErrorWidget("Some Error")
                  : cubit.state is DictionaryInitial
                      ? getDictionaryFormWidget(context)
                      : Container()),
    );
  }
}

getDictionaryFormWidget(BuildContext context) {
  final cubit = context.watch<DictionaryCubit>();

  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const Spacer(),
        const Text(
          "Dictonary App",
          style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold),
        ),
        const Text(
          "Search any word you want quickly",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        TextField(
          controller: cubit.queryController,
          decoration: InputDecoration(
              hintText: "Search a word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(color: Colors.white)),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text("SEARCH"),
            onPressed: () {
              cubit.getWordSearched();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                padding: const EdgeInsets.all(16)),
          ),
        ),
      ],
    ),
  );
}

getLoadingWidget() {
  return const Center(child: CircularProgressIndicator());
}

getErrorWidget(message) {
  return Center(child: Text(message));
}
