import '../models/food.dart';
import '../models/food_type.dart';
import '../models/section.dart';

class FoodDataProvider {
  //Here I have already created foods & section list which we will we using hence forth

  //Section List
  static List<Section> sectionList = [
    Section("Giới Thiệu", "10 phút"),
    Section("Kĩ thuật xét tính đơn điệu của hàm số", "20 phút"),
    Section("Cực trị hàm số", "30 phút"),
    Section("Giá trị lớn nhất, giá trị nhỏ nhất", "24 phút"),
    Section("Tiệm cận đồ thị hàm số", "23 phút"),
    Section("Đồ thị hàm trùng phương", "32 phút"),
  ];

  //Food List
  static List<Food> foodList = [
    Food(
      "1", // ID
      "Live C - Toán 2k6 Thi THPT", // Title
      "assets/images/offer/banner1", // Thumbnail
      "Khóa học luyện thi THPT Quốc gia của thầy Hồ Thức Thuận là một chương trình học tập chuyên sâu được thiết kế dành cho học sinh lớp 12, chuẩn bị cho kỳ thi THPT Quốc gia. Khóa học bao gồm các bài giảng chi tiết, tài liệu học tập phong phú, và các bài kiểm tra đánh giá năng lực thường xuyên.", // Description
      "Hồ Thức Thuận", // Created By
      "01-Jan-2022", // Created Date
      4.2, // Rating
      false, // isFavorite
      FoodType.programming, // FoodType (Enum)
      "4 giờ", // Duration (Duration in hours)
      20, // Lesson Number
      sectionList, // Sections (empty list as an example)
      0, // Progress (initial progress)
    ),
    Food(
      "1", // ID
      "Live C - Toán 2k6 Thi THPT", // Title
      "assets/images/offer/banner1", // Thumbnail
      "Khóa học luyện thi THPT Quốc gia của thầy Hồ Thức Thuận là một chương trình học tập chuyên sâu được thiết kế dành cho học sinh lớp 12, chuẩn bị cho kỳ thi THPT Quốc gia. Khóa học bao gồm các bài giảng chi tiết, tài liệu học tập phong phú, và các bài kiểm tra đánh giá năng lực thường xuyên.", // Description
      "Hồ Thức Thuận", // Created By
      "01-Jan-2022", // Created Date
      4.2, // Rating
      false, // isFavorite
      FoodType.programming, // FoodType (Enum)
      "4 giờ", // Duration (Duration in hours)
      20, // Lesson Number
      sectionList, // Sections (empty list as an example)
      0, // Progress (initial progress)
    ),
    Food(
      "1", // ID
      "Live C - Toán 2k6 Thi THPT", // Title
      "assets/images/offer/banner1", // Thumbnail
      "Khóa học luyện thi THPT Quốc gia của thầy Hồ Thức Thuận là một chương trình học tập chuyên sâu được thiết kế dành cho học sinh lớp 12, chuẩn bị cho kỳ thi THPT Quốc gia. Khóa học bao gồm các bài giảng chi tiết, tài liệu học tập phong phú, và các bài kiểm tra đánh giá năng lực thường xuyên.", // Description
      "Hồ Thức Thuận", // Created By
      "01-Jan-2022", // Created Date
      4.2, // Rating
      false, // isFavorite
      FoodType.programming, // FoodType (Enum)
      "4 giờ", // Duration (Duration in hours)
      20, // Lesson Number
      sectionList, // Sections (empty list as an example)
      0, // Progress (initial progress)
    ),
    Food(
      "1", // ID
      "Live C - Toán 2k6 Thi THPT", // Title
      "assets/images/offer/banner1", // Thumbnail
      "Khóa học luyện thi THPT Quốc gia của thầy Hồ Thức Thuận là một chương trình học tập chuyên sâu được thiết kế dành cho học sinh lớp 12, chuẩn bị cho kỳ thi THPT Quốc gia. Khóa học bao gồm các bài giảng chi tiết, tài liệu học tập phong phú, và các bài kiểm tra đánh giá năng lực thường xuyên.", // Description
      "Hồ Thức Thuận", // Created By
      "01-Jan-2022", // Created Date
      4.2, // Rating
      false, // isFavorite
      FoodType.programming, // FoodType (Enum)
      "4 giờ", // Duration (Duration in hours)
      20, // Lesson Number
      sectionList, // Sections (empty list as an example)
      0, // Progress (initial progress)
    ),
    Food(
      "1", // ID
      "Live C - Toán 2k6 Thi THPT", // Title
      "assets/images/offer/banner1", // Thumbnail
      "Khóa học luyện thi THPT Quốc gia của thầy Hồ Thức Thuận là một chương trình học tập chuyên sâu được thiết kế dành cho học sinh lớp 12, chuẩn bị cho kỳ thi THPT Quốc gia. Khóa học bao gồm các bài giảng chi tiết, tài liệu học tập phong phú, và các bài kiểm tra đánh giá năng lực thường xuyên.", // Description
      "Hồ Thức Thuận", // Created By
      "01-Jan-2022", // Created Date
      4.2, // Rating
      false, // isFavorite
      FoodType.programming, // FoodType (Enum)
      "4 giờ", // Duration (Duration in hours)
      20, // Lesson Number
      sectionList, // Sections (empty list as an example)
      0, // Progress (initial progress)
    ),
    Food(
      "1", // ID
      "Live C - Toán 2k6 Thi THPT", // Title
      "assets/images/offer/banner1", // Thumbnail
      "Khóa học luyện thi THPT Quốc gia của thầy Hồ Thức Thuận là một chương trình học tập chuyên sâu được thiết kế dành cho học sinh lớp 12, chuẩn bị cho kỳ thi THPT Quốc gia. Khóa học bao gồm các bài giảng chi tiết, tài liệu học tập phong phú, và các bài kiểm tra đánh giá năng lực thường xuyên.", // Description
      "Hồ Thức Thuận", // Created By
      "01-Jan-2022", // Created Date
      4.2, // Rating
      false, // isFavorite
      FoodType.programming, // FoodType (Enum)
      "4 giờ", // Duration (Duration in hours)
      20, // Lesson Number
      sectionList, // Sections (empty list as an example)
      0, // Progress (initial progress)
    ),
    Food(
      "1", // ID
      "Live C - Toán 2k6 Thi THPT", // Title
      "assets/images/offer/banner1", // Thumbnail
      "Khóa học luyện thi THPT Quốc gia của thầy Hồ Thức Thuận là một chương trình học tập chuyên sâu được thiết kế dành cho học sinh lớp 12, chuẩn bị cho kỳ thi THPT Quốc gia. Khóa học bao gồm các bài giảng chi tiết, tài liệu học tập phong phú, và các bài kiểm tra đánh giá năng lực thường xuyên.", // Description
      "Hồ Thức Thuận", // Created By
      "01-Jan-2022", // Created Date
      4.2, // Rating
      false, // isFavorite
      FoodType.programming, // FoodType (Enum)
      "4 giờ", // Duration (Duration in hours)
      20, // Lesson Number
      sectionList, // Sections (empty list as an example)
      0, // Progress (initial progress)
    ),
  ];
}
