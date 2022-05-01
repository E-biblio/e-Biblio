import 'dart:ffi';

class UserInfos {
  String? uid;
  String? ville;
  List? type;
  Bool? upgraded;

  UserInfos({this.uid, this.ville, this.type, this.upgraded});

  //receiving data from server
  factory UserInfos.fromMap(map) {
    return UserInfos(
      uid: map['uid'],
      ville: map['ville'],
      type: map['type'],
      upgraded: map['upgraded'],

    );
  }

  //envoyer la data a notre server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'ville': ville,
      'type': type,
      'upgraded': upgraded,

    };
  }

  //on a besoin de créer cette map
  UserInfos.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    ville = json['ville'];
    type = json['type'];
    upgraded = json['upgraded'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['ville'] = this.ville;
    data['type'] = this.type;
    data['upgraded'] = this.upgraded;

    return data;
  }
}