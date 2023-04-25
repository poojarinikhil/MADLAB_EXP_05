import 'package:flutter/material.dart';
import 'package:exp_05/splashscreen.dart';
import 'package:exp_05/login.dart';
import 'package:exp_05/register.dart';
import 'package:exp_05/resetpass.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome',
      title: 'Google-Internship',
      //home: MyHomePage(),
      routes: {
        'welcome':(context) => splashscreen(),
        'login': (context) => MyLogin(),
        'register': (context) => RegisterPage(),
        'forgot': (context) => resetPassword(),
      },
    );
  }
}