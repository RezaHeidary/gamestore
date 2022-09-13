import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gamestore/component/my_color.dart';
import 'package:gamestore/gen/assets.gen.dart';
import 'package:gamestore/models/fake_model.dart';
import 'package:gamestore/view/login_screen.dart';
import 'package:gamestore/view/main_pages/search_screen.dart';
import 'package:get/get.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import '../../component/my_component.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  var currentIndex = 0.obs;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          key: _key,
          backgroundColor: MyColor.backgroundColor,
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                SizedBox(
                  width: Get.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            _key.currentState!.openDrawer();
                          },
                          child: const Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        Text(
                          "فروشگاه",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to( MySearchScreen());
                          },
                          child: const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.black,
                          ),
                        )
                      ]),
                ),
              ]),
          drawer: myDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                //pic_poster
                poster(context),
                const SizedBox(
                  height: 30,
                ),
                //pics_poster Gridview
                postersGridview(context),
                const SizedBox(
                  height: 30,
                ),

                //List view Bestselling and text

                SizedBox(
                    width: Get.width - 30,
                    child: Text(
                      "پرفروش ترین ها",
                      style: Theme.of(context).textTheme.headline5,
                    )),
                bestSellLiseView(context),
                //List view Off and text

                SizedBox(
                    width: Get.width - 30,
                    child: Text(
                      "تخفیف های امروز",
                      style: Theme.of(context).textTheme.headline5,
                    )),
                offListView(context),

                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          bottomNavigationBar: myBottomNavigationBar(context)),
    );
  }

  //Void pic_poster
  poster(context) {
    return Center(
      child: SizedBox(
        width: Get.width / 2 + 150,
        height: Get.height / 4.5,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PageIndicatorContainer(
              length: 3,
              child: PageView.builder(
                  itemCount: 3,
                  reverse: true,
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                    AssetImage(FakeModel().imagePoster[index]),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Center(
                              child: Text(
                            FakeModel().titlePoster[index],
                            style: Theme.of(context).textTheme.headline6,
                          )),
                        ),
                      ))),
        ),
      ),
    );
  }

  //  Void pic_Gridview
  postersGridview(context) {
    return SizedBox(
      height: Get.height / 5,
      child: Center(
        child: GridView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 50),
            itemBuilder: (context, index) => Column(
                  children: [
                    // images
                    Material(
                      color: Colors.transparent,
                      elevation: 10,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage(
                                  FakeModel().imagePosterGridview[index]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    //txt_title
                    Text(
                      FakeModel().titlePosterGridview[index],
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )),
      ),
    );
  }

  //Void off ListView
  offListView(context) {
    return SizedBox(
      height: Get.height / 2.4,
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
                      color: MyColor.offColor,
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
                            //offText
                            Column(
                              children: [
                                Text(
                                  "تومان ${FakeModel().bestsellingLisView[index].price.seRagham()}",
                                  style: MyComponent().offListView,
                                ),
                                Text(
                                    "تومان ${FakeModel().bestsellingLisView[index].off.seRagham()}",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // titleText and Container for off
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "دوتا2",
                                style: Theme.of(context).textTheme.subtitle1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                              ),
                              Container(
                                height: 24,
                                width: 36,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text("50%",
                                        style: MyComponent().offNumListView)),
                              )
                            ],
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

  //Void ListBestSell
  bestSellLiseView(context) {
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

  //Void  BottomNavigationBar
  myBottomNavigationBar(context) {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.black,
      currentIndex: currentIndex.value,
      onTap: (index) {
        currentIndex.value = index;
      },
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.shopping_bag),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.add),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.bookmark),
        ),
      ],
    );
  }

  // Void Drawer
  myDrawer() {
    return Drawer(

      width: Get.width / 2 + 50,
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.asset(
            Assets.images.group12.path,
            scale: 3,
          )),
          ListTile(
            leading: const Icon(
              Icons.account_circle_sharp,
              color: Colors.black,
              size: 30,
            ),
            title: const Text("حساب کاربری"),
            onTap: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            leading: Image.asset(
              Assets.images.sellingForDrawer.path,
            ),
            title: const Text("فروخته شد"),
            onTap: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
            title: const Text("خروج از حساب "),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
