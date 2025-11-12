
import 'package:dacs_ha4/models/food.dart';
import 'package:flutter/material.dart';


class FavoriteOption extends StatefulWidget {
  const FavoriteOption({super.key, required this.food});

  final Food food;
  @override
  State<FavoriteOption> createState() => _FavoriteOptionState();
}

class _FavoriteOptionState extends State<FavoriteOption> {

  bool isFavorite = false;

  void initState(){
    super.initState();

    isFavorite = widget.food.isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      setState(() {
        isFavorite = !isFavorite;
        widget.food.isFavorite = isFavorite;
      });

    }, icon: Icon(
      isFavorite? Icons.favorite : Icons.favorite_border,
      color: Colors.pink,
    ));
  }
}
