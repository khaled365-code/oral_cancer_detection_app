abstract class SignUpState{}

class SignUpInitial  extends SignUpState{}

class SignUploading  extends SignUpState{}

class SignUpSuccess  extends SignUpState{
  final String message;
  SignUpSuccess({required this.message});
}

class SignUpFailure  extends SignUpState{

  final String errorMessage;
  SignUpFailure({required this.errorMessage});

}