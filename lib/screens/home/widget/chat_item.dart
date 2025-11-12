import 'package:dacs_ha4/constant.dart';
import 'package:dacs_ha4/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../themes/font_family.dart';

class ChatItem extends StatefulWidget{
  final int id;
  final String name;
  final String imageUrl;
  static final routeName = 'chat_item';
  ChatItem({Key? key, required this.id, required this.name, required this.imageUrl}) : super(key: key);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatProvider>(
      create: (_) => ChatProvider(),
      child: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          return FutureBuilder(
              future: chatProvider.getMessageData(widget.id),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  final messages = snapshot.data!;
                  return Scaffold(
                    body: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: appBgColor,
                          pinned: true,
                          title: Center(
                            child: Container(
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "${widget.imageUrl}", // Đường dẫn đến ảnh trong assets
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover, // Cắt ảnh để vừa với hình tròn
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text( "${widget.name}",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 20,
                                        fontFamily: FontFamily.lato
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                            padding: EdgeInsets.only(left: 3, top: 1),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: messages.length,
                                    itemBuilder: (context, index){
                                      final message= messages[index];
                                      return Material(
                                        child: IntrinsicHeight(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipOval(
                                                child: Image.asset(
                                                  "${widget.imageUrl}",
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(width: 8), // Khoảng cách giữa ảnh và tên
                                              IntrinsicWidth(
                                                child: Text(
                                                  message.content,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );

                                    }),

                              ],
                            )
                          ),
                        )
                      ],
                    ),

                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Handling error case
                } else {
                  return CircularProgressIndicator(); // Showing a progress indicator while loading
                }

              }
              );
        },
      ),
    );
    throw UnimplementedError();
  }

}