/// id : 103
/// name : "khaled"
/// email : "khaledmokhaled123@gmail.com"
/// email_verified_at : null
/// two_factor_confirmed_at : null
/// current_team_id : null
/// profile_photo_path : null
/// created_at : "2024-05-03T21:24:14.000000Z"
/// updated_at : "2024-05-18T11:24:54.000000Z"
/// role : "USER"
/// profile_photo_url : "https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"

class UpdateProfileUser {
  UpdateProfileUser({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.twoFactorConfirmedAt, 
      this.currentTeamId, 
      this.profilePhotoPath, 
      this.createdAt, 
      this.updatedAt, 
      this.role, 
      this.profilePhotoUrl,});

  UpdateProfileUser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic twoFactorConfirmedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['two_factor_confirmed_at'] = twoFactorConfirmedAt;
    map['current_team_id'] = currentTeamId;
    map['profile_photo_path'] = profilePhotoPath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['role'] = role;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }

}