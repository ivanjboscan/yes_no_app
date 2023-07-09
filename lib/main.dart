import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

import 'presentation/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    AppTheme myTheme=AppTheme(modeScreen:Brightness.light);

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=> ChatProvider())],
      child: MaterialApp(
        title: 'Yes No App',
        theme: myTheme.theme(6),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
