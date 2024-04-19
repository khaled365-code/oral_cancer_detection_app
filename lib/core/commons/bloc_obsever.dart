

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver implements BlocObserver {  @override
void onChange(BlocBase bloc, Change change) {
  print(bloc.toString());
  print(change.toString());
}

@override
void onClose(BlocBase bloc) {
  print(bloc.toString());

}

@override
void onCreate(BlocBase bloc) {
  print(bloc.toString());

}

@override
void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  print(bloc.toString());
  print(error.toString());

}

@override
void onEvent(Bloc bloc, Object? event) {
  // TODO: implement onEvent
}

@override
void onTransition(Bloc bloc, Transition transition) {
  // TODO: implement onTransition
}
}
