/// name : "khaled"
/// email : "khaledmokhaled123@gmail.com"
/// profile_photo_path : null
/// profile_photo_url : "https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"

class Userdata {
  Userdata({
      this.name, 
      this.email, 
      this.profilePhotoPath, 
      this.profilePhotoUrl,});

  Userdata.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    profilePhotoPath = json['profile_photo_path'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  String? name;
  String? email;
  dynamic profilePhotoPath;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['profile_photo_path'] = profilePhotoPath;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }

}