import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/auth/data/auth_model/login_model.dart';
import 'package:graduation_project/features/auth/data/auth_model/register_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

   Future<Either<String,SignInModel>>signIn({required String email,required String password})async{
    try{
      final response=await api.post(EndPoints.loginEndPoint,
          data: {
            ApiKeys.email:email,ApiKeys.password:password
          },isFormData: true);
      final user=SignInModel.fromJson(response);
      final decodedToken=JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKeys.token, value: user.token);
      CacheHelper().saveData(key: ApiKeys.id, value:decodedToken["prv"]);


      return right(user);
    }
    on ServerException catch(e){
      return left(e.errorModel.errorMessage);
    }

   }




}