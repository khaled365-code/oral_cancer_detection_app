import 'Message.dart';

/// message : [{"id":2,"user_id":103,"post_id":1,"comment":"comment from khaled mohamed","created_at":"2024-05-09T05:05:42.000000Z","updated_at":"2024-05-09T05:05:42.000000Z"}]
/// status : 200

class GetCommentsModel {
  GetCommentsModel({
      this.message, 
      this.status,});

  GetCommentsModel.fromJson(dynamic json) {
    if (json['message'] != null) {
      message = [];
      json['message'].forEach((v) {
        message?.add(Message.fromJson(v));
      });
    }
    status = json['status'];
  }
  List<Message>? message;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map['message'] = message?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}