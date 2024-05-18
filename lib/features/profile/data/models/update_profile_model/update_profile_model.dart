import 'update_profile_user.dart';

/// message : "User updated successfully"
/// user : {"id":103,"name":"khaled","email":"khaledmokhaled123@gmail.com","email_verified_at":null,"two_factor_confirmed_at":null,"current_team_id":null,"profile_photo_path":null,"created_at":"2024-05-03T21:24:14.000000Z","updated_at":"2024-05-18T11:24:54.000000Z","role":"USER","profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}

class UpdateProfileModel {
  UpdateProfileModel({
      this.message, 
      this.user,});

  UpdateProfileModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UpdateProfileUser.fromJson(json['user']) : null;
  }
  String? message;
  UpdateProfileUser? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}