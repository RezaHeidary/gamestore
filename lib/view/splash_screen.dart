import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gamestore/constant/my_color.dart';
import 'package:gamestore/gen/assets.gen.dart';
import 'package:gamestore/view/login_screen.dart';
import 'package:get/get.dart';

class MySplashScreen extends StatelessWidget {
  MySplashScreen({Key? key}) : super(key: key);

//ToDo Animation for group pic

  Timer timer = Timer(const Duration(seconds: 4), () {
    Get.off(  MyLoginScreen());
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:MyColor.backgroundColor,

        body: Center(
          child: Image.asset(
            Assets.images.group12.path,
            scale: 2,
          ),
        ),
      );


  }
}
