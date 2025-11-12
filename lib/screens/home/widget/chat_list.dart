//
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:provider/provider.dart';
//
// import '../../../constant.dart';
// import '../../../provider/chat_provider.dart';
//
// import 'package:http/http.dart' as http;
//
// import '../../../models/users.dart';
// import '../../../themes/font_family.dart';
// import 'chat_item.dart';
//
// class ChatList extends StatefulWidget {
//   static final routeName = 'chatList';
//   final int id;
//
//   ChatList({Key? key, required this.id}) : super(key: key);
//
//   @override
//   _ChatListState createState() => _ChatListState();
// }
//
// class _ChatListState extends State<ChatList> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatProvider>(
//       builder: (context, chatProvider, child) {
//         return FutureBuilder<List<User>>(
//           future: chatProvider.getUserData(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final users = snapshot.data!;
//               // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//               // print(lectures);
//               // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//               return Scaffold(
//                 body: CustomScrollView(
//                   slivers: [
//                     SliverAppBar(
//                       backgroundColor: appBgColor,
//                       pinned: true,
//                       title: Center(
//                         child: Container(
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Danh sách bài thi",
//                                 style: TextStyle(
//                                   color: textColor,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SliverPadding(
//                       padding: EdgeInsets.only(left: 3, top: 1),
//                       sliver: SliverToBoxAdapter(
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: users.length,
//                           itemBuilder: (context, index) {
//                             final user = users[index];
//                             return Material(
//                                 child: InkWell(
//                                   onTap: () {
//                                     chatProvider.setSelectedUserId(user.id);
//                                     print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//                                     print(chatProvider.selectedUserId);
//                                     print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                         builder: (context) => ChatItem(id: chatProvider.selectedUserId, name: user.name, imageUrl: user.imageUrl,),
//                                       ),
//                                     );
//                                     // quizProvider.setSelectedLectureId(lecture.id);
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (BuildContext context) => QuizScreen(id: lecture.id,),
//                                     //   ),
//                                     // );
//                                   },
//                                   child: Card(
//                                     child:  Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           const SizedBox(height: 10,),
//                                           Row(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   ClipOval(
//                                                     child: Image.asset(
//                                                       "${user.imageUrl}", // Đường dẫn đến ảnh trong assets
//                                                       width: 30,
//                                                       height: 30,
//                                                       fit: BoxFit.cover, // Cắt ảnh để vừa với hình tròn
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   Text( "${user.name}",
//                                                     style: TextStyle(
//                                                         color: Colors.grey,
//                                                         fontSize: 15,
//                                                         fontFamily: FontFamily.lato
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//
//                                               const SizedBox(
//                                                 width: 15,
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.question_answer,
//                                                     size: 15,
//                                                     color: Colors.grey,),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   Text( "${user.email}",
//                                                     style: TextStyle(
//                                                         color: Colors.grey,
//                                                         fontSize: 15,
//                                                         fontFamily: FontFamily.lato
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                   ),
//                                 )
//                             );
//                           },
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//
//             } else if (snapshot.hasError) {
//               return Text('Error Hoài An: ${snapshot.error}');
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         );
//       },
//     );
//   }
// }
