import 'package:chat/UI/SplachScreen.dart';
import 'package:chat/UI/base%20Pages/RegisterScreen/Register_Screen.dart';
import 'package:chat/UI/base%20Pages/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen3.routeName,
      routes: {
        registerScreen.routeName :(_) => registerScreen() ,
        LoginScreen.routeName :(_) => LoginScreen() ,
        SplashScreen3.routeName :(_) => SplashScreen3() ,
      },
      

    );
  }
}
