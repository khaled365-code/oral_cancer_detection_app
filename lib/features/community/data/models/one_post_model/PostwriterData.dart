/// name : "Reymundo Hauck"
/// email : "arnold.boyle@example.net"
/// profile_photo_path : null
/// profile_photo_url : "https://ui-avatars.com/api/?name=R+H&color=7F9CF5&background=EBF4FF"

class PostwriterData {
  PostwriterData({
      this.name, 
      this.email, 
      this.profilePhotoPath, 
      this.profilePhotoUrl,});

  PostwriterData.fromJson(dynamic json) {
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