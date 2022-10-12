import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamestore/constant/my_color.dart';
import 'package:gamestore/gen/assets.gen.dart';
import 'package:get/get.dart';

import 'main_pages/main_screen.dart';

class MyLoginScreen extends StatelessWidget {
  MyLoginScreen({Key? key}) : super(key: key);
  var muyIndex = 0.obs;
  var imageForStack = Assets.images.studentCard.path.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset:false ,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: MyColors.backgroundLoginColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
            Center(
              child: Container(
                width: Get.width / 2 + 150,
                height: Get.height / 2.5 + 400,
                decoration: BoxDecoration(
                    color: MyColor.backgroundLoginShieldColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Image.asset(
                      imageForStack.value,
                      scale: 3,
                    ),
                    IndexedStack(
                      index: muyIndex.value,
                      children: [
                        //phone and steam
                        loginPhoneAndSteam(context),
                        //sms
                        loginPassword(context)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
// Void phone and steam
  loginPhoneAndSteam(context) {
    return SizedBox(
      height: Get.height / 3,
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //txt_phone
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: Get.height / 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(255),
                  color: Colors.white),
              child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(255)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(255)),
                    ),
                    hintText: '** ** *** 09',
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                    suffix: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        Assets.images.iphone.path,
                        height: 20,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  )),
            ),
          ),
          //txt_steam
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: Get.height / 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(255),
                  color: Colors.white),
              child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(255)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(255)),
                    ),
                    hintText: 'Steam',
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                    suffix: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        Assets.images.steam.path,
                        height: 20,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  )),
            ),
          ),
          // btn_send
          SizedBox(
            width: Get.width / 2,
            height: Get.height / 20,
            child: ElevatedButton(
              onPressed: () {
                muyIndex.value = 1;
                imageForStack.value=Assets.images.cyberSecurity.path;
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyColor.buttonLoginColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              child: Text("ارسال", style: Theme.of(context).textTheme.headline6),
            ),
          )
        ],
      )),
    );
  }
//Void sms
  loginPassword(context) {
    return SizedBox(
      height: Get.height / 3,
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //txt_sms code
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: Get.height / 17,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(255),
                  color: Colors.white),
              child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(255)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(255)),
                    ),
                    hintText: 'کد ارسال شده',
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                    suffix: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(
                        Assets.images.messages.path,
                        height: 20,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  )),
            ),
          ),
          // btn_end login
          SizedBox(
            width: Get.width / 2,
            height: Get.height / 20,
            child: ElevatedButton(
              onPressed: () {

                Get.off( MainScreen());
              },

              style: ButtonStyle(

                backgroundColor:
                    MaterialStateProperty.all(MyColor.buttonLoginColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              child:
                  Text("ورود", style: Theme.of(context).textTheme.headline6,),
            ),
          )
        ],
      )),
    );
  }
}
