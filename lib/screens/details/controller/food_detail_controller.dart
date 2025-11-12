import 'package:dacs_ha4/common/entities/lesson.dart';
import 'package:dacs_ha4/screens/details/repo/food_detail_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/entities/food.dart';
part 'food_detail_controller.g.dart';

@riverpod
Future<FoodItem?> foodDetailController(
    FoodDetailControllerRef ref, {required int index}) async {
  FoodRequestEntity foodRequestEntity = FoodRequestEntity();
  foodRequestEntity.id = index;
  final response = await FoodDetailRepo.foodDetail(params: foodRequestEntity);
  if(response.code==200){
    return response.data;
  }else{
    print('request failed ${response.code}');
  }

  return null;
}

@riverpod
Future<List<LessonItem>?> foodLessonListController(
    FoodLessonListControllerRef ref, {required int index}) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity(id: index);
    var response = await FoodDetailRepo.foodLessonList(params: lessonRequestEntity);

    if (response.code == 200) {
      print('đã vào đến đây rồi');
      print(response.data);
      return response.data ?? [];
    } else {
      throw Exception('Failed to load lesson data');
    }
}