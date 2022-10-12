import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyComponent{

 //Void app bar for sell items
  productAppbar(){
    return AppBar(
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
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 34,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
