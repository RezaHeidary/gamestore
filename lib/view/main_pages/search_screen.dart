import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamestore/models/fake_model.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../constant/my_color.dart';

class MySearchScreen extends StatelessWidget {
  MySearchScreen({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 40),
          //txt_search
          txtSearch(context),
          //data list view
          tagListView(context),
          //list view search
          listViewSearch(context)
        ],
      ),
    );
  }

  // Void txt search
  txtSearch(context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
        ),

        //search TextBox and arrow Icon
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Text box for search
            SizedBox(
              width: Get.width / 2 + 100,
              child: TextField(
                controller: textEditingController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'جستجو',
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            // arrow Icon
            const Icon(
              Icons.arrow_forward_outlined,
              size: 25,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  //Void list tag
  tagListView(context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 5,
     // List Images for search
     child: ListView.builder(
          itemCount: FakeModel().imagePosterGridview.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                 //Image for search
                    Container(
                      width: Get.width / 5,
                      height: Get.height / 9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  FakeModel().imagePosterGridview[index]),
                              fit: BoxFit.fill)),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                 // Text for image
                    Text(FakeModel().titlePosterGridview[index])
                  ],
                ),
              )),
    );
  }

  //Void List view search
  listViewSearch(context) {
    return SizedBox(
      height: Get.height * .66,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  elevation: 3,
                  child: Container(
                      width: Get.width,
                      height: Get.height / 6,
                      decoration: BoxDecoration(
                        color: MyColor.bkButtonNavColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [

                         //images
                          Container(
                            height: Get.height / 2,
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(
                                      FakeModel().imagePoster[index]),
                                  fit: BoxFit.fill),
                            ),
                          ),

                          // 3 text column info
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    FakeModel().bestsellingLisView[index].name),
                                const Text("dota2"),
                                Text(
                                  "تومان ${FakeModel().bestsellingLisView[index].price.seRagham()}",
                                ),
                              ],
                            ),
                          ),

                          //user Our system
                          FakeModel().bestsellingLisView[index].user

                              //system
                              ? SizedBox(
                                  width: Get.width / 3.5,
                                  height: Get.height,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Icon(
                                          Icons.add_shopping_cart,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          Icons.bookmark_border_outlined,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                )

                              //user
                              : const Text(
                                  "خرید از کاربر",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                )
                        ],
                      )),
                ),
              )),
    );
  }
}
