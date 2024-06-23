import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/auth/data/auth_model/register_model.dart';
import 'package:graduation_project/features/auth/data/auth_model/sign_in_model/NewSignInModel.dart';
import 'package:graduation_project/features/auth/data/auth_model/update_password_model.dart';
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

   Future<Either<String,NewSignInModel>>signIn({required String email,required String password})async{
    try{
      final response=await api.post(EndPoints.loginEndPoint,
          data: {
            ApiKeys.email:email,
            ApiKeys.password:password
          },isFormData: true);
      final NewSignInModel user=NewSignInModel.fromJson(response);
      CacheHelper().removeData(key: ApiKeys.token);
      final decodedToken=JwtDecoder.decode(user.token!);
      CacheHelper().saveData(key: ApiKeys.token, value: user.token);
      CacheHelper().saveData(key: ApiKeys.id, value:decodedToken["sub"]);
      CacheHelper().saveData(key: ApiKeys.name, value: user.user!.name);
      CacheHelper().saveData(key: ApiKeys.email, value: user.user!.email);
      CacheHelper().saveData(key: ApiKeys.profile_photo_url, value: user.user!.profilePhotoPath!.replaceAll("'", ""));
      CacheHelper().saveData(key: ApiKeys.created_at, value: user.user!.createdAt);


      return right(user);
    }
    on ServerException catch(e){
      return left(e.errorModel.errorMessage);
    }

   }
   
   
   Future<Either<String,UpdatePasswordModel>>updatePassword({required String currentPass,required String newPass,required String confirmPass})async{
    try{
      final response=await api.post(
          EndPoints.updatePasswordEndPoint,
          queryParams: {
            ApiKeys.userId:CacheHelper().getData(key: ApiKeys.id)
          },

          data: {
            ApiKeys.current_password:currentPass,
            ApiKeys.password:newPass,
            ApiKeys.password_confirmation:confirmPass,
            ApiKeys.token:CacheHelper().getData(key: ApiKeys.token),

          },
          isFormData: true
      );
      print('${CacheHelper().getData(key: ApiKeys.token)}');
      return right(UpdatePasswordModel.fromJson(response));
    }
    on ServerException catch(e){
      return left(e.errorModel.errorMessage);
    }
   }




}