// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:dictionary_app/model/word_response.dart';
import 'package:dictionary_app/repo/word_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;

  DictionaryCubit(this._repository) : super(DictionaryInitial());

  final queryController = TextEditingController();

  Future getWordSearched() async {
    emit(WordSearchingState());

    try {
      final words =
          await _repository.getWordsFromDictionary(queryController.text);

      if (words == null) {
        emit(ErrorState("There is some issue"));
      } else {
        print(words.toString());
        emit(WordSearchedState(words));
        emit(DictionaryInitial());
      }
    } on Exception catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }
}
