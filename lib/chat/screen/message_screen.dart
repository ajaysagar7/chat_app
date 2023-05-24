import 'package:chat_ui_date/chat/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            Expanded(
                child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const IntrinsicHeight(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=170667a&w=0&k=20&c=MRMqc79PuLmQfxJ99fTfGqHL07EDHqHLWg0Tb4rPXQc="),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Nagesh Aadhri",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "tap here for contact info",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ))
                ],
              ),
            ))
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.shade100),
                child: const Icon(
                  Icons.videocam_outlined,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.shade100),
                child: const Icon(
                  Icons.videocam_outlined,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<MessageModel, DateTime>(
              reverse: true,
              order: GroupedListOrder.DESC,
              // useStickyGroupSeparators: true,
              floatingHeader: true,
              padding: const EdgeInsets.all(8),
              elements: messageLists,
              groupHeaderBuilder: (element) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Card(
                      color: Colors.white60,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            DateFormat.MMMEd().format(element.date!),
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w400),
                          ))),
                ),
              ),
              groupBy: (element) {
                return DateTime(
                    element.date!.year, element.date!.month, element.date!.day);
              },
              itemBuilder: (c, MessageModel model) {
                //! message-card-widget
                return FocusedMenuHolder(
                  blurBackgroundColor: Colors.white.withOpacity(0.8),
                  menuWidth: MediaQuery.of(context).size.width * 0.5,
                  animateMenuItems: true,
                  openWithTap: true,
                  menuItems: [
                    FocusedMenuItem(
                        title: const Text("Replay"),
                        onPressed: () {},
                        trailingIcon: const Icon(Icons.screen_share_sharp)),
                    FocusedMenuItem(
                        title: const Text("Forward"),
                        onPressed: () {},
                        trailingIcon:
                            const Icon(Icons.arrow_circle_right_rounded)),
                    FocusedMenuItem(
                        title: const Text("Copy"),
                        onPressed: () {},
                        trailingIcon: const Icon(Icons.copy)),
                  ],
                  onPressed: () {},
                  child: GestureDetector(
                    onTap: () {},
                    child: Align(
                        alignment: model.isSentByMe == true
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                            elevation: 8,
                            color: model.isSentByMe == true
                                ? Colors.blue.shade100
                                : Colors.grey,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(model.text.toString())))),
                  ),
                );
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 8,
                      child: Container(
                        color: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 9,
                                child: TextFormField(
                                  controller: _messageController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: "Enter Message",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                )),
                            InkWell(
                              onDoubleTap: () {
                                MessageModel messageModel = MessageModel(
                                  date: DateTime.now(),
                                  isSentByMe: false,
                                  messageType: MessageType.text,
                                  text: _messageController.text.trim(),
                                );
                                messageLists.add(messageModel);
                                _messageController.clear();
                                setState(() {});
                              },
                              child: IconButton(
                                  //! send-button
                                  onPressed: () {
                                    MessageModel messageModel = MessageModel(
                                      date: DateTime.now(),
                                      isSentByMe: true,
                                      messageType: MessageType.text,
                                      text: _messageController.text.trim(),
                                    );
                                    messageLists.add(messageModel);
                                    _messageController.clear();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.mic)),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.add,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
