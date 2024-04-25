abstract class LogOutState{}

class LogOutInitial  extends LogOutState{}

class LogOutLoading  extends LogOutState{}

class LogOutSuccess  extends LogOutState{
  final String message;
  LogOutSuccess({required this.message});
}

class LogOutFailure  extends LogOutState{

  final String errorMessage;
  LogOutFailure({required this.errorMessage});

}