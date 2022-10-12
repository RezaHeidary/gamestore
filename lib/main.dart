import 'package:flutter/material.dart';

import 'package:gamestore/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       title: 'Flutter Demo',
      locale: const Locale("fa"),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        fontFamily: "dana",
          textTheme: const TextTheme(

            subtitle2: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,fontFamily: "",color: Colors.grey),
            subtitle1: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.black54),


            headline6: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
            headline5: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
            headline4: TextStyle(fontSize: 18,fontWeight: FontWeight.w300,color: Colors.black,),
            headline3: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),


            bodyText1: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,),


          )


      ),
      home:  MySplashScreen()
    );
  }
}


