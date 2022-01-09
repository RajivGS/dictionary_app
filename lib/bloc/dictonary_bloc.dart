import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dictonary_event.dart';
part 'dictonary_state.dart';

class DictonaryBloc extends Bloc<DictonaryEvent, DictonaryState> {
  DictonaryBloc() : super(DictonaryInitial()) {
    on<DictonaryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
