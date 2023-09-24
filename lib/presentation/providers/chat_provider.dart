import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya saliste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {

    if(text.isEmpty) return;
    final newmessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newmessage);

    notifyListeners();
    MoveScrollToBottom();
  }

  void MoveScrollToBottom(){
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}