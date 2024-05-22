import 'User.dart';

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vOWM1OC0xOTctMTM0LTU5LTk5Lm5ncm9rLWZyZWUuYXBwL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzE2MDI2NzQyLCJleHAiOjE3MTYwODQzNDIsIm5iZiI6MTcxNjAyNjc0MiwianRpIjoiVEtJWHFCamVWMm1Bb2I4eSIsInN1YiI6IjEwMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.03dsOwqpxU1N09NN4_rFjf66ncM3UA4qz8nWZalESHo"
/// token_type : "bearer"
/// user : {"id":103,"name":"khaled","email":"khaledmokhaled123@gmail.com","email_verified_at":null,"two_factor_confirmed_at":null,"current_team_id":null,"profile_photo_path":null,"created_at":"2024-05-03T21:24:14.000000Z","updated_at":"2024-05-03T21:24:14.000000Z","role":"USER","profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}

class NewSignInModel {
  NewSignInModel({
      this.token, 
      this.tokenType, 
      this.user,});

  NewSignInModel.fromJson(dynamic json) {
    token = json['token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? token;
  String? tokenType;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['token_type'] = tokenType;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}