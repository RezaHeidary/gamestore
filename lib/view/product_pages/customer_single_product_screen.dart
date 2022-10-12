import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamestore/constant/my_String.dart';
import 'package:gamestore/constant/my_color.dart';
import 'package:gamestore/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../component/my_component.dart';
import '../../models/fake_model.dart';

class CustomerSingleProductScreen extends StatelessWidget {
  const CustomerSingleProductScreen({Key? key}) : super(key: key);

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
                Icon(Icons.sms,color: Colors.black,size: 40,),
                SizedBox(width: 40,),
                Icon(Icons.call,color: Colors.black,size: 40,),

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("شماره تماس 0933335555"),
                Text("مدت زمان : 1 ماه"),
                Text("تعداد 2"),
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
                  "اکانت استیم rrezah ",
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
