class EndPoints{
  static String textModelBaseUrl="http://127.0.0.1:5000/";
  static String baseUrl="https://fc6e-197-134-140-150.ngrok-free.app/api/";
  static String register="auth/register";
  static String loginEndPoint="auth/login";
  static String UserProfile="auth/user-profile";
  static String updatePasswordEndPoint="update/profilepass/";
  static String updateProfile="update/profile/";
  static String logOutEndPoint="auth/logout";
  static String storeNewPost="blog";


  static String getAllPosts(token)
  {
    return 'blog?token=$token';

  }
  static addLikeForPostEndPoint({required postId,required userId,required token})
  {
    return 'posts/like?post_id=$postId&user_id=$userId&token=$token';
  }
  static addCommentForPost({required num postId, required num userId, required String comment, required String token})
  {
    return 'posts/comments?post_id=$postId&user_id=$userId&comment=$comment&token=$token';
  }

  static getOnePostEndPoint({required String token,required num postId})
  {
    return 'blog/:?token=$token&post_id=$postId';
  }
  static searchForPostsEndpoint({required String token,required String searchContent})
  {
    return 'posts/search?search=$searchContent&token=%token';
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
  static String comment_count= "comment_count";
  static String like_count= "like_count";
  static String profile_photo_url= "profile_photo_url";








}