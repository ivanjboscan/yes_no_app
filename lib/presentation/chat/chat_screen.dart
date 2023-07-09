import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: _ChatView(),
    );
  }
}

//?**********************************************/
//?  Widget _AppBar
//?**********************************************/
class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://static.wikia.nocookie.net/hunger_games_simulator/images/c/c5/Rihanna.png/revision/latest?cb=20201030013543'),
        ),
      ),
      title: const Text('Rihanna'),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

//?**********************************************/
//?  Widget _ChatView
//?**********************************************/
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(children: [
        Expanded(
            child: ListView.builder(
          controller: chatProvider.chatScrollController,
          itemCount: chatProvider.messageList.length,
          itemBuilder: (context, index) {
            final message = chatProvider.messageList[index];
            return (message.fromWho == FromWho.hers)
                ? HerMessageBuble(
                    message: message
                  )
                : MyMessageBubble(message: message);
          },
        )),

        //Caja de Texto
         MessageFieldBox(
          onValue: chatProvider.sendMessage,
          // onValue: (value) => chatProvider.sendMessage(value)  // Esta forma tambien es válida
          // Cuando tenemos un caso donde la misma cantidad de argumentos definidos aqui (value)
          // es igual a la misma cantidad de argumentos y en la misma posicion a ser pasados
          // a la funcion sendMessage(value), entonces es posible solo mandar la referencia a 
          // la función, ejemplo=   onValue: chatProvider.sendMessage
        ),
      ]),
    );
  }
}
