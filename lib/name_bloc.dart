// import 'package:flutter_bloc/flutter_bloc.dart';

// class NameBloc extends Bloc<NamesState, String> {
//   final List<String> names;
//   int currentIndex = 0;

//   NameBloc(this.names) : super(names.first);

//   Stream<String> mapEventToState(NamesState event) async* {
//     if (event is ForwardNamesEvent) {
//       currentIndex = (currentIndex + 1) % names.length;
//       yield names[currentIndex];
//     } else if (event is BackwardNamesEvent) {
//       currentIndex = (currentIndex - 1 + names.length) % names.length;
//       yield names[currentIndex];
//     }
//   }
// }

// sealed class NamesState {}

// class ForwardNamesEvent extends NamesState {}

// class BackwardNamesEvent extends NamesState {}

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NamesState {}

class NameLoadedState extends NamesState {
  final String name;

  NameLoadedState(this.name);
}

abstract class NamesEvent {}

class ForwardNamesEvent extends NamesEvent {}

class BackwardNamesEvent extends NamesEvent {}


// import 'package:bloc/bloc.dart';

class NameBloc extends Bloc<NamesEvent, NamesState> {
  final List<String> names;
  int currentIndex = 0;

  NameBloc(this.names) : super(NameLoadedState(names.first)) {
    on<ForwardNamesEvent>(_onForwardEvent);
    on<BackwardNamesEvent>(_onBackwardEvent);
  }

  void _onForwardEvent(ForwardNamesEvent event, Emitter<NamesState> emit) {
    currentIndex = (currentIndex + 1) % names.length;
    emit(NameLoadedState(names[currentIndex]));
  }

  void _onBackwardEvent(BackwardNamesEvent event, Emitter<NamesState> emit) {
    currentIndex = (currentIndex - 1 + names.length) % names.length;
    emit(NameLoadedState(names[currentIndex]));
  }
}
