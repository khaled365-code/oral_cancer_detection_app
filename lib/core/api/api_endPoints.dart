

class EndPoints{
  static String photoModelBaseUrl="http://10.0.2.2:80/";
  static String textModelBaseUrl="http://10.0.2.2:5000/";
  static String baseUrl="https://e82b-197-134-59-99.ngrok-free.app/api/";
  static String register="auth/register";
  static String loginEndPoint="auth/login";
  static String updatePasswordEndPoint="update/profilepass/";
  static String storeNewPost="blog";
  static String predict="predict";
  static String classify="classify";



  static String logoutEndPoint({required String token})
  {
    return 'auth/logout?token=$token';
  }

  static String updateProfileEndPoint({required String userId})
  {
    return 'update/profile/?user_id=$userId';
  }
  static String getUserProfile({required String userId,required String token})
  {
    return 'user/$userId?token=$token';
  }


  static String getAllPosts(token)
  {
    return 'blog?token=$token';

  }
  static addLikeForPostEndPoint({required postId,required userId,required token})
  {
    return 'posts/like?post_id=$postId&user_id=$userId&token=$token';
  }
  static addCommentForPost({required num postId, required String userId, required String comment, required String token})
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
  static getAllComments({required num postId,required String userId,required String token})
  {
    return 'posts/comments?post_id=$postId&token=$token&user_id=$userId';
  }

}

