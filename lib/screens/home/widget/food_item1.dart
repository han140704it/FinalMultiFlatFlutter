import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../arguments/food_arguments.dart';
import '../../../common/utils/route_names.dart';
import '../../../constant.dart';
import '../../../models/food.dart';

class FoodItem1 extends StatelessWidget {
  const FoodItem1({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(
                  context,
                  RouteNames.foodDetails,
                  arguments: FoodArgument(food)
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(food.thumbnailUrl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.title,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person,
                            color: kBlueColor, size: 15,),
                          const SizedBox(width: 3),
                          Text(
                            food.createdBy,
                            style: const TextStyle(fontSize: 8, color: kBlueColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: kRatingColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${food.rate}',
                                style: const TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          // Text(
                          //   "${food.price} VND",
                          //   style: TextStyle(
                          //       fontSize: 10,
                          //       color: Colors.grey.shade800,
                          //       fontWeight: FontWeight.bold
                          //   ),
                          // )
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
