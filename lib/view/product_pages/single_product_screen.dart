import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamestore/component/my_component.dart';
import 'package:gamestore/constant/my_String.dart';
import 'package:gamestore/constant/my_color.dart';
import 'package:gamestore/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../models/fake_model.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      //set for component
      appBar: MyComponent().productAppbar(),
      //set for component
      bottomNavigationBar: Container(
        width: Get.width,
        height: Get.height/12,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                SizedBox(width: 20,),
                Icon(Icons.bookmark_border,color: Colors.black,size: 40,),
                SizedBox(width: 20,),
                Icon(Icons.add_shopping_cart,color: Colors.black,size: 40,),

              ],
            ),
            Row(
              children: [
                const Text("تومان  "),
                Text("1000000".seRagham(),style: Theme.of(context).textTheme.headline4,),
                const SizedBox(width: 15,)

              ],
            ),
          ],
        ),
      ),




      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              Assets.images.poster1.path,
              width: Get.width,
              height: Get.height / 4,
              fit: BoxFit.fill,
            ),

            //comment and like icons

            commentAndLike(context),

            // header text
            SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "بتل پس دوتا 2",
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.right,
                  ),
                )),

            //body text

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("تعداد خریدار 2000"),
                Text("مدت زمان : 1 ماه"),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("بعد از 2 روی اکانت شماست "),
                Text(
                  "درصد رضایت مشتری 78 ",
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),

            // banner for information
            SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  "توضیحات",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            Container(
              width: Get.width * .9,
              height: Get.height / 12,
              decoration: BoxDecoration(
                color: MyColor.bannerInformationColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(MyString.bannerInformation),

              ),
            ),

            // product Similar
            SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  "محصولات مشابه",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            similarLiseView(context),

           const SizedBox(height: 40,)

            //
          ],
        ),
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
            children: [
              const Icon(
                CupertinoIcons.heart,
                color: Colors.black87,
                size: 35,
              ),
              Center(child: Text("1780".seRagham()))
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

  //  Void product Similar

  similarLiseView(context) {
    return SizedBox(
      height: Get.height / 2.5,
      width: Get.width,
      child: ListView.builder(
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(14),
            child: Material(
              color: Colors.transparent,
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: Get.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColor.bestsellingColor,
                ),
                child: Column(
                  children: [
                    //image
                    Container(
                      width: Get.width,
                      height: Get.height / 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                              FakeModel().bestsellingLisView[index].image,
                            ),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.lightBlueAccent),
                    ),
                    //headText
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        FakeModel().bestsellingLisView[index].name,
                        style: Theme.of(context).textTheme.headline4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //PriceText
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "قیمت",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "تومان ${FakeModel().bestsellingLisView[index].price.seRagham()}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    // titleText
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 102),
                      child: Text(
                        "دوتا2",
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    //bookmark
                    const Padding(
                      padding: EdgeInsets.only(top: 50, left: 102),
                      child: Icon(
                        Icons.bookmark_border_outlined,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

}
