import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chat/select_user_screen.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/app.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'screens/chat/screens.dart';

//import 'package:flutter_app/screen/home/home.dart';

void main(){
  final client = StreamChatClient(streamKey);
  runApp(
      MyApp(
        client: client,
      )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key, required this.client}): super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Chat',
      builder: (context, child){
        return StreamChatCore(
            client: client,
            child: ChannelsBloc(
              child: UsersBloc(child: child!),
            )
        );
      },
      home: SelectUserScreen(),
    );
  }

  //@override
  // Widget build(Object context){
  //   return MaterialApp(
  //
  //     debugShowCheckedModeBanner: false,//remove debug banner
  //     theme: ThemeData(
  //       backgroundColor: Color(0xFFF5F6F6),
  //       primaryColor: Color(0xFF811B83),
  //       accentColor: Color(0xFFFA5019),
  //       textTheme: TextTheme(
  //           headline1: TextStyle(color: Color(0xFF100E34)),
  //           bodyText1: TextStyle(color: Color(0xFF100E34).withOpacity(0.5)),
  //       ),
  //     ),
  //     home: HomePage()
  //   );
  // }
}