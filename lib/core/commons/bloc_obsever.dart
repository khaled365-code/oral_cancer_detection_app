

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver implements BlocObserver {  @override
void onChange(BlocBase bloc, Change change) {
  log(bloc.toString());
  log(change.toString());
}

@override
void onClose(BlocBase bloc) {
  log(bloc.toString());

}

@override
void onCreate(BlocBase bloc) {
  log(bloc.toString());

}

@override
void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  log(bloc.toString());
  log(error.toString());

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
