import 'package:dacs_ha4/screens/details/controller/food_detail_controller.dart';
import 'package:dacs_ha4/screens/details/widget/favorite_option.dart';
import 'package:dacs_ha4/screens/lesson_details/controller/lesson_controller.dart';
import 'package:dacs_ha4/screens/lesson_details/view/lesson_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

import '../../common/entities/lesson.dart';
import '../../common/utils/constants.dart';
import '../../constant.dart';
import '../../models/food.dart';
import '../lesson_details/view/lesson_detail_widgets.dart';


class FoodDetails extends ConsumerStatefulWidget {
  const FoodDetails({super.key});



  @override
  ConsumerState<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends ConsumerState<FoodDetails> {
  late Map<String, dynamic> args;
  late int foodId;

  @override
  void didChangeDependencies(){
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    foodId = int.parse(args['id']);
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    var stateData = ref.watch(foodDetailControllerProvider(index: foodId));
    var lessonData = ref.watch(foodLessonListControllerProvider(index: foodId));
    return Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                stateData.when(
                    data: (data) {
                      if(data==null){
                        return Center(child: Text('No food details available'));
                      }
                      return buildBody(
                        // "${AppConstants.IMAGE_UPLOADS_PATH}${data.thumbnail}",
                        "${data.thumbnail}",
                        "${data.name}",
                        "${data.lesson_num.toString()}",
                        "${data.video_len}",
                        "${data.teacher}",
                        "${data.description}",
                      );
                    },
                    error: (error, traceStack) => Text("ghet bn qua troi"),
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    )),
          lessonData.when(
            data: (data) {
              if (data == null) {
                return Center(child: Text('No food details available'));
              }
              if (data is Map<String, dynamic>) {
                return LessonDetailWidget(lessonData: data, ref: ref);
              }
              else if (data is List) {
                return LessonDetailWidget(lessonData: data, ref: ref);
              }
              else {
                return Center(child: Text('Invalid data format'));
              }
            },
            error: (error, traceStack) {
              print("Error occurred: $error");
              print("Stack trace: $traceStack");
              return Text("Lỗi khi tải dữ liệu");
            },
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          )

          ],
            ),
          ),
        )
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      title: Text(
        "Chi tiết",
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }

  Widget buildBody(String imagePath, String name, String lesson_num, String video_len, String teacher, String description){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(imagePath),
          ),
          SizedBox(height: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
                  ),
                  // FavoriteOption(food: widget.food),
                ],
              ),
              Row(
                children: [
                  getAttribute(Icons.play_circle_outline, '$lesson_num video', Colors.grey),
                  const SizedBox(
                    width: 10,
                  ),
                  getAttribute(Icons.access_time, '${video_len} giờ', Colors.grey),
                  const SizedBox(
                    width: 15,
                  ),
                  getAttribute(Icons.person, '$teacher', kBlueColor),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mô tả",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ReadMoreText(
                    description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Show less",
                    moreStyle: const TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.bold
                    ),
                    lessStyle: const TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.bold
                    ),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                    ),
                  ),
                  // Text(
                  //   "Danh sách bài giảng",
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.w500,
                  //     color: textColor,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }


  Widget getAttribute(IconData icon, String info, Color color){
    var greyTextStyle = const TextStyle(fontSize: 10, color: Colors.grey);
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: color,),
        SizedBox(
          width: 5,
        ),
        Text(info,
          style: greyTextStyle,
        )
      ],
    );
  }

  Widget getAttribute1(IconData icon, String info, Color color){
    var greyTextStyle = const TextStyle(fontSize: 10, color: kBlueColor);
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: color,),
        SizedBox(
          width: 5,
        ),
        Text(info,
          style: greyTextStyle,
        )
      ],
    );
  }
}





