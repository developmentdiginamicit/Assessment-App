import 'package:get/get.dart';

import '../model/chat_model.dart';

class ChatController extends GetxController {
  final List<Message> messageList = [
    Message(
        content: "Hi, Bill! This is the simplest example ever.",
        isSender: true,
        ownerName: "Higor Lapa"),
    Message(
        content:
            "Let's make it better , Higor. Custom font size and text color",
        isSender: false,
        ownerName: "Bill Gates"),
    Message(
        content: "Bill, we have to talk about business",
        isSender: true,
        ownerName: "Higor"),
    Message(
        content: "Wow, I like it. Tell me what I can do for you, pal.",
        isSender: false,
        ownerName: "Bill Gates"),
    Message(content: "I'm just a copy", isSender: false, ownerName: "Higor"),
    Message(content: "Nice", isSender: false, ownerName: "Bill Gates"),
    Message(content: "I'm just a copy", isSender: false, ownerName: "Higor"),
    Message(content: "Nice", isSender: false, ownerName: "Bill Gates"),
    Message(
        content: "I'm just a copy", isSender: false, ownerName: "Bill Gates"),
    Message(content: "Nice", isSender: false, ownerName: "Bill Gates"),
    Message(content: "I'm just a copy", isSender: true, ownerName: "Higor"),
    Message(content: "Nice", isSender: true, ownerName: "Higor"),
    Message(content: "I'm just a copy", isSender: true, ownerName: "Higor"),
  ];
}
