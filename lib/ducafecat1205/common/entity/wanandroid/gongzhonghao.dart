/// id : "413"
/// name : "Android群英传"

class Gongzhonghao {
  Gz({
    String? id,
    String? name,}){
    _id = id;
    _name = name;
  }

  Gongzhonghao.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}