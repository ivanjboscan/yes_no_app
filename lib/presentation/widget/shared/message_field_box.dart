import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();

    final focusNode = FocusNode();

    final chatProvider = context.watch<ChatProvider>();

    // Se puede crear variables para definir los parametros de los atributos
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      filled: true,
      suffixIcon: IconButton(
          onPressed: () {
            // ignore: avoid_print
            final textValue = textController.value.text;
            // ignore: avoid_print
            //print('Valor de la caja de texto ? $textValue');
            onValue(textValue);
            textController.clear();
          },
          icon: const Icon(Icons.send_outlined)),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      hintText: 'Finaliza tu mensaje con signo de "?"',
    );

    // Acá se utilizan las variables definidas arriba
    return TextFormField(
      decoration: inputDecoration,
      maxLines: 1,
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (evento) {
        focusNode.unfocus();
        //print("UnFocus");
      },
      onFieldSubmitted: (value) {
        // ignore: avoid_print
        //print('Submit value: $value');
        textController.clear();
        //Una vez que se limpie el campo, se obtiene el focus nuevamente
        focusNode.requestFocus();
        onValue(value);
      },
      /*onChanged: (value) {
          // ignore: avoid_print
          print('**********************     changed: $value');
        },*/
    );
  }
}
