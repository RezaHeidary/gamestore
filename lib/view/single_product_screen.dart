import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamestore/component/my_color.dart';
import 'package:gamestore/gen/assets.gen.dart';
import 'package:get/get.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //search shop
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 8),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 34,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 34,
                    ),
                  ],
                ),
                //arrow bake
                const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 34,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            Assets.images.poster1.path,
            width: Get.width,
            height: Get.height / 4,
            fit: BoxFit.fill,
          ),
          //comment and like icons
          commentAndLike(context)
        ],
      ),
    );
  }

  // Void comment and like
  commentAndLike(context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.heart,
                color: Colors.black87,
                size: 35,
              ),
              Center(child: Text("256"))
            ],
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        //comment
        const Icon(
          CupertinoIcons.conversation_bubble,
          color: Colors.black87,
          size: 35,
        ),
      ],
    );
  }
}
