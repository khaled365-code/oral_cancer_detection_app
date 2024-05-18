import 'data_serach.dart';

/// data : [{"post":{"id":103,"user_id":103,"image":"public/images/IUMRs2SPA8UTSeiLwaxtJ3IZMK5kOWNRLVM8VG1g.png","title":"oralcan","slug":"oralcan","body":"hello it is me khaled i am Software Engineer","published_at":"2024-05-09T08:06:10.000000Z","featured":0,"deleted_at":null,"created_at":"2024-05-09T08:06:10.000000Z","updated_at":"2024-05-09T08:06:10.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"},"comment_count":0,"like_count":0},{"post":{"id":104,"user_id":103,"image":null,"title":"f","slug":"f","body":"hello  is me khaled i am Software Engineer","published_at":"2024-05-09T08:07:23.000000Z","featured":0,"deleted_at":null,"created_at":"2024-05-09T08:07:23.000000Z","updated_at":"2024-05-09T08:07:23.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"},"comment_count":0,"like_count":0},{"post":{"id":109,"user_id":103,"image":"public/images/iIvKPaAeGRZE2703LsGF31Prn4P7Q5tVJkGmUgav.png","title":"f","slug":"f","body":"hello it  is me khaled i am Software Engineer","published_at":"2024-05-09T23:53:29.000000Z","featured":0,"deleted_at":null,"created_at":"2024-05-09T23:53:29.000000Z","updated_at":"2024-05-09T23:53:29.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"},"comment_count":0,"like_count":0}]
/// message : "ok"
/// status : 200

class SearchPostModel {
  SearchPostModel({
      this.data, 
      this.message, 
      this.status,});

  SearchPostModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataSearch.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<DataSearch>? data;
  String? message;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}