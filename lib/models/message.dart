class Message {
  late final int id;
  late final String content;

  late final int sender_id;
  late final int receiver_id;
  late final String created_at;

  Message({required this.id, required this.content, required this.sender_id, required this.receiver_id, required this.created_at});
  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
      id:json['id'] as int,
      content:json['content'] as String,
      sender_id:json['sender_id'] as int,
      receiver_id:json['receiver_id']as int,
      created_at:json['created_at'] as String,
    );
  }
  @override
  String toString() {
    return 'Lecture{id: $id, name: $sender_id, duration: $sender_id, receiver_id : $receiver_id, created-at : $created_at }';
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['sender_id'] = this.sender_id;
    data['receiver_id'] = this.receiver_id;
    data['created_at'] = this.created_at;
    return data;
  }
}
