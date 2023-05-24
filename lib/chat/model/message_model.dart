// ignore_for_file: public_member_api_docs, sort_constructors_first

enum MessageType { text, image, sound, video }

class MessageModel {
  final String? text;
  final DateTime? date;
  final bool? isSentByMe;
  final MessageType? messageType;
  MessageModel({
    this.text,
    this.date,
    this.isSentByMe,
    this.messageType,
  });
}

List<MessageModel> messageLists = [
  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 4)),
      isSentByMe: false,
      messageType: MessageType.text,
      text: "Hello"),

  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 4)),
      isSentByMe: true,
      messageType: MessageType.text,
      text: "Hello bro"),
  //3 days before
  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 3)),
      isSentByMe: false,
      messageType: MessageType.text,
      text: "How are you bro..."),

  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 3)),
      isSentByMe: true,
      messageType: MessageType.text,
      text: "fine bro"),
  //2 days before
  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 2)),
      isSentByMe: false,
      messageType: MessageType.text,
      text: "Are u free tommorow"),

  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 2)),
      isSentByMe: true,
      messageType: MessageType.text,
      text: "yes,bro"),
  //1 day before
  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 2)),
      isSentByMe: false,
      messageType: MessageType.text,
      text: "can u do me a favour, i need you car.."),

  MessageModel(
      date: DateTime.now().subtract(const Duration(days: 2)),
      isSentByMe: true,
      messageType: MessageType.text,
      text: "ok bro,come tommorwo and take it..."),

  //tody
  MessageModel(
      date: DateTime.now().subtract(const Duration(hours: 2)),
      isSentByMe: false,
      messageType: MessageType.text,
      text: "Thank you bro, appericated it"),

  MessageModel(
      date: DateTime.now().subtract(const Duration(
        hours: 1,
      )),
      isSentByMe: true,
      messageType: MessageType.text,
      text: "np bro , always welcome"),
];
