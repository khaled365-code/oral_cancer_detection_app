import 'prfile_data.dart';

/// data : {"id":103,"name":"khaled","email":"khaledmokhaled123@gmail.com","email_verified_at":null,"two_factor_confirmed_at":null,"current_team_id":null,"profile_photo_path":null,"created_at":"2024-05-03T21:24:14.000000Z","updated_at":"2024-05-03T21:24:14.000000Z","role":"USER","profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}
/// message : "ok "
/// status : 200

class GetProfileDataModel {
  GetProfileDataModel({
      this.data, 
      this.message, 
      this.status,});

  GetProfileDataModel.fromJson(dynamic json) {
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
  ProfileData? data;
  String? message;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}