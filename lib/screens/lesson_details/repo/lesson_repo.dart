import 'package:dacs_ha4/common/entities/food.dart';
import 'package:dacs_ha4/common/entities/lesson.dart';
import 'package:dacs_ha4/common/services/http_util.dart';

class LessonRepo{

  static Future<LessonListResponseEntity> courseLessonDetail({LessonRequestEntity? params}) async {

    var response = await HttpUtil().post("lesson/detail",
        queryParameters: params?.toJson()
    );
    return LessonListResponseEntity.fromJson(response);
  }
}