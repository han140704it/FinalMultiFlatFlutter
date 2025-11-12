// import 'package:dacs_ha4/screens/home/controller/home_controller.dart';
import 'package:dacs_ha4/screens/crop_prediction/crop_predict.dart';
import 'package:dacs_ha4/screens/foods/my_course_list.dart';
import 'package:dacs_ha4/screens/home/widget/bottombar_item.dart';
import 'package:dacs_ha4/screens/home/widget/feature_food.dart';
import 'package:dacs_ha4/screens/home/widget/food_list.dart';
import 'package:dacs_ha4/screens/home/widget/header.dart';
import 'package:dacs_ha4/screens/home/widget/offer.dart';
import 'package:dacs_ha4/screens/home/widget/title.dart';
import 'package:dacs_ha4/screens/home/widget/type_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search/view/explore.dart';
import 'controller/home_controller.dart';

// import '../courses/my_course_list.dart';
// import '../profile/view/profile.dart';
// import '../profile/widget/profile_widget.dart';
// import '../search/view/explore.dart';


class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _BottomOptionState();
}

class _BottomOptionState extends ConsumerState<Home> {
  int activePageIndex = 0;

  void onPageIndexChange(int index) {
    setState(() {
      activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: Scaffold(
      body: buildBody(),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 55,
        padding: EdgeInsets.fromLTRB(20, 10, 25, 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomBarItem(
              isActive: activePageIndex == 0,
              icon: "assets/icons/home.svg",
              onTap: () {
                onPageIndexChange(0);
              },
            ),
            BottomBarItem(
              isActive: activePageIndex == 1,
              icon: "assets/icons/search.svg",
              onTap: () {
                onPageIndexChange(1);
              },
            ),
            BottomBarItem(
              isActive: activePageIndex == 2,
              icon: "assets/icons/play.svg",
              onTap: () {
                onPageIndexChange(2);
              },
            ),
            BottomBarItem(
              isActive: activePageIndex == 3,
              icon: "assets/icons/chat.svg",
              onTap: () {
                onPageIndexChange(3);
              },
            ),
            BottomBarItem(
              isActive: activePageIndex == 4,
              icon: "assets/icons/profile.svg",
              onTap: () {
                onPageIndexChange(4);
              },
            ),
          ],
        ),
      ),
    ), onRefresh: (){
      return ref.refresh(homeListProvider.notifier).fetchCourseList();
    });
  }

  Widget buildBody() {
    List<Map<String, dynamic>> tabItems = [
      {
        "icon": "assets/icons/home.svg",
        "page": SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: const Column(
                    children: [
                      Header(),
                      TitleItem(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Offers(),
                      // SubjectList(),
                      // FeatureFoods(ref: ref,),
                      const TypeList(),
                      FoodList(ref: ref,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      },
      {
        "icon": "assets/icons/search.svg",
        "page": const ExplorePage(),
      },
      {
        "icon": "assets/icons/play.svg",
        "page": MyFoodList(),
      },
      {
        "icon": "assets/icons/chat.svg",
        "page": PredictScreen(),
      },

      {
        "icon": "assets/icons/profile.svg",
        "page": MyFoodList(),
      },
    ];

    return IndexedStack(
      index: activePageIndex,
      children: List.generate(
        tabItems.length,
            (index) => tabItems[index]["page"],
      ),
    );
  }
}