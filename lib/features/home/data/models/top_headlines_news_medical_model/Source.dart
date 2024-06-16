/// id : null
/// name : "[Removed]"

class TopHeadLinesSources {
  TopHeadLinesSources({
      this.id, 
      this.name,});

  TopHeadLinesSources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  dynamic id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}