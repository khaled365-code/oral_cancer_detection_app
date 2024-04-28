class EndPoints{
  static String baseUrl="https://a124-102-190-121-26.ngrok-free.app/api/";
  static String register="auth/register";
  static String loginEndPoint="auth/login";
  static String UserProfile="auth/user-profile";
  static String updatePasswordEndPoint="update/profilepass/";
  static String updateProfile="update/profile/";
  static String logOutEndPoint="auth/logout";
  static String storeNewPost="blog";


  static String getAllPosts(id)
  {
    return 'blog?token=$id';

  }

}

class ApiKeys{

  static String status= "status";
  static String message= "message";
  static String name= "name";
  static String email= "email";
  static String password= "password";
  static String password_confirmation= "password_confirmation";
  static String accessToken= "access_token";
  static String token= "token";
  static String id= "id";
  static String current_password= "current_password";
  static String userId= "user_id";
  static String photo= "photo";
  static String title= "title";
  static String body= "body";
  static String image= "image";
  static String user_id= "user_id";
  static String created_at= "created_at";




}