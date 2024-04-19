import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/auth/data/auth_model/register_model.dart';

class AuthRepos {

 final ApiConsumer api;
  AuthRepos({required this.api});

  Future<Either<String,RegisterModel>> Register(
 {
  required String name,
  required String email,
 required String password,
 required String confPassword,}
  )
  async{
    try {
      final response= await api.post(
         EndPoints.register,
         queryParams:
         {
          ApiKeys.name:name,
          ApiKeys.email:email,
          ApiKeys.password:password,
          ApiKeys.password_confirmation:confPassword ,
         }
      );
      final registerModel= RegisterModel.fromJson(response);
      return(Right(registerModel));
    }
    on ServerException catch (e) {
      return(left(e.errorModel.errorMessage));
      }

   }




}