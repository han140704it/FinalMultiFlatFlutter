
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodRequestEntity {
  int? id;

  FoodRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class SearchRequestEntity {
  String? search;

  SearchRequestEntity({
    this.search,
  });

  Map<String, dynamic> toJson() => {
    "search": search,
  };
}

class FoodListResponseEntity {
  int? code;
  String? msg;
  List<FoodItem>? data;

  FoodListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory FoodListResponseEntity.fromJson(Map<String, dynamic> json) =>
      FoodListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<FoodItem>.from(json["data"].map((x) => FoodItem.fromJson(x))),
      );
}

//api post response msg
class FoodDetailResponseEntity {
  int? code;
  String? msg;
  FoodItem? data;

  FoodDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory FoodDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      FoodDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: FoodItem.fromJson(json["data"]),
      );
}



class AuthorRequestEntity {
  String? token;

  AuthorRequestEntity({
    this.token,
  });

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
//api post response msg
class AuthorResponseEntity {
  int? code;
  String? msg;
  AuthorItem? data;

  AuthorResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory AuthorResponseEntity.fromJson(Map<String, dynamic> json) =>
      AuthorResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: AuthorItem.fromJson(json["data"]),
      );
}



// login result
class AuthorItem {
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  int? download;
  int? online;

  AuthorItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  factory AuthorItem.fromJson(Map<String, dynamic> json) =>
      AuthorItem(
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        job: json["job"],
        follow: json["follow"],
        score: json["score"],
        download: json["download"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
    "description": description,
    "avatar": avatar,
    "job": job,
    "follow": follow,
    "score": score,
    "download": download,
    "online": online,
  };

}


// login result
class FoodItem {
  String? user_token;
  String? name;
  String? teacher;
  String? description;
  String? thumbnail;
  String? video;
  String? amount_total;
  int? lesson_num;
  String? video_len;
  int? down_num;
  String? follow;
  double? score;
  int? id;

  FoodItem({
    this.user_token,
    this.name,
    this.teacher,
    this.description,
    this.thumbnail,
    this.video,
    this.amount_total,
    this.lesson_num,
    this.video_len,
    this.down_num,
    this.follow,
    this.score,
    this.id,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      FoodItem(
        user_token: json["user_token"],
        name: json["name"],
        teacher: json["teacher"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        video: json["video"],
        amount_total: json["amount_total"],
        lesson_num: json["lesson_num"],
        video_len: json["video_length"].toString(),
        down_num: json["down_num"],
        follow: json["follow"].toString(),
        score: json["score"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "user_token": user_token,
    "name": name,
    "teacher": teacher,
    "description": description,
    "thumbnail": thumbnail,
    "video": video,
    "amount_total": amount_total,
    "lesson_num": lesson_num,
    "video_len": video_len,
    "down_num": down_num,
    "follow": follow,
    "score": score,
    "id": id,
  };

}

