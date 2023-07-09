import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBuble extends StatelessWidget {
  final Message message;

  const HerMessageBuble(
      {super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            )),
        const SizedBox(height: 5),
        _ImageBubble(imageUrl: message.imageUrl ?? ''),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.6,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          //*  Mostrar un Circular Progress Indicator  *//
          return Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const CircularProgressIndicator(
                  strokeWidth: 14, color: Colors.blueAccent));
        },
      ),
    );
  }
}
