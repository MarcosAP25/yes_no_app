import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child:  CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.fsti4-1.fna.fbcdn.net/v/t39.30808-1/341072888_1161740357847905_702338218090933684_n.jpg?stp=cp6_dst-jpg_p160x160&_nc_cat=110&ccb=1-7&_nc_sid=fe8171&_nc_eui2=AeHBAInFh7LYZ1PvbmTxm7a_pVP7Iqb58LelU_sipvnwt4inY6BmDVpHjs6G4vCUj-cX_kX0nGqkC2Jpcu43aLau&_nc_ohc=y-NYLGJeNpsAX8F3LgV&_nc_ht=scontent.fsti4-1.fna&oh=00_AfBl-IjI7Uiv9kkcAJnK3LmzQykiizmGZ3d8u6-Af7078g&oe=65121EA5'),
          )),
        title: const Text('Mi amor ❤️'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return(message.fromWho == FromWho.hers)
                  ? const HerMessageBubble()
                  : MyMessageBubble(message: message,);
            },)
          ),
           MessageFildBox( onValue: (value) => chatProvider.sendMessage(value),),
        ],),
      ),
    );
  }
}