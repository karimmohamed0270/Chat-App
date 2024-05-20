import 'package:chat/screens/loginhome.dart';
import 'package:chat/screens/registerscreen.dart';
import 'package:chat/screens/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{"RegisterScreen":(context) => RegisterScreen(),
      "LoginScreen":(context) => LoginScreen(),
      "ChatPage":(context) => ChatPage(),
      } ,
      initialRoute:"LoginScreen",
    );
  }
}
