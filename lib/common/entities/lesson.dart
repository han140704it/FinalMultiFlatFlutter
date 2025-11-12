class LessonRequestEntity {
  int? id;

  LessonRequestEntity({this.id});

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;

  LessonListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LessonItem>.from(
            json["data"].map((x) => LessonItem.fromJson(x))),
      );
}

class LessonDetailResponseEntity {
  int? code;
  String? msg;
  List<LessonVideoItem>? data;

  LessonDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LessonVideoItem>.from(
            json["data"].map((x) => LessonVideoItem.fromJson(x))),
      );
}

class LessonItem {
  String? name;
  String? description;
  String? thumbnail;
  int? id;
  List<LessonVideoItem>? videos;

  LessonItem({
    this.name,
    this.description,
    this.thumbnail,
    this.id,
    this.videos,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) {
    // Kiểm tra trường 'video' trong JSON
    var videoData = json["video"];
    List<LessonVideoItem>? videos;

    if (videoData is List) {
      // Nếu 'video' là một List, chuyển đổi thành danh sách LessonVideoItem
      videos = List<LessonVideoItem>.from(
          videoData.map((x) => LessonVideoItem.fromJson(x)));
    } else if (videoData is String) {
      // Nếu 'video' là một chuỗi (URL), tạo danh sách với một phần tử
      videos = [
        LessonVideoItem(name: "Video", url: videoData, thumbnail: "")
      ];
    }

    return LessonItem(
      name: json["name"],
      description: json["description"],
      thumbnail: json["thumbnail"],
      id: json["id"],
      videos: videos ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "id": id,
    "video": videos == null
        ? []
        : List<dynamic>.from(videos!.map((x) => x.toJson())),
  };
}

class LessonVideoItem {
  String? name;
  String? url;
  String? thumbnail;

  LessonVideoItem({
    this.name,
    this.url,
    this.thumbnail,
  });

  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        name: json["name"],
        url: json["url"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "thumbnail": thumbnail,
  };
}

class LessonVideo {
  final List<LessonItem> lessonItem;
  final Future<void>? initializeVideoPlayer;
  final bool isPlay;
  final String? url;

  LessonVideo({
    this.lessonItem = const <LessonItem>[],
    this.initializeVideoPlayer,
    this.isPlay = false,
    this.url = "",
  });

  LessonVideo copyWith({
    List<LessonItem>? lessonItem,
    Future<void>? initializeVideoPlayer,
    bool? isPlay,
    String? url,
  }) {
    return LessonVideo(
      lessonItem: lessonItem ?? this.lessonItem,
      initializeVideoPlayer: initializeVideoPlayer ?? this.initializeVideoPlayer,
      isPlay: isPlay ?? this.isPlay,
      url: url ?? this.url,
    );
  }

  List<LessonItem> get data => lessonItem;
}
