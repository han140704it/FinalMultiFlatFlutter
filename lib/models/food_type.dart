enum FoodType { all, programming, finance, marketing, other }

extension CourseCategoryExtension on FoodType {
  String get title {
    // This title is used to show categories on home screen
    switch (this) {
      case FoodType.all:
        return "Tất cả";
      case FoodType.programming:
        return "Món nước";
      case FoodType.finance:
        return "Bánh";
      case FoodType.marketing:
        return "Món mặn";
      case FoodType.other:
        return "Ăn vặt";
    }
  }
}
