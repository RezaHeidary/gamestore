import 'package:gamestore/gen/assets.gen.dart';

class FakeModel {

  List<String> titlePoster=[

    "خرید بتل پس با 10 درصد تخفیف",
    "کوریور دوتا2",
    "ارکانای جاگارنات"
  ];

  List<String> imagePoster = [
    Assets.images.poster1.path,
    Assets.images.p2.path,
    Assets.images.p3.path
  ];

  List<String> titlePosterGridview=[

    "وارکرافت",
    "کالاف",
    "csg",
    "dota2",
    " سخت افزار",
    "پاب جی"
  ];

  List<String> imagePosterGridview = [
    Assets.images.picGridview1.path,
    Assets.images.picGridview2.path,
    Assets.images.picGridview3.path,
    Assets.images.picGridview4.path,
    Assets.images.picGridview5.path,
    Assets.images.picGridview6.path,


  ];

  List<String> imageBestsellingLisView=[
    Assets.images.poster1.path,
    Assets.images.p2.path,
    Assets.images.p3.path,
    Assets.images.picGridview1.path,
    Assets.images.picGridview2.path,

  ];

  List<String> titleBestsellingLisView=[
    "خرید بتل پس با 10 درصد تخفیف",
    "کوریور دوتا2",
    "ارکانای جاگارنات",
    "وارکرافت",
    "کالاف",

  ];

  List<FakeModelForListView> bestsellingLisView=[
    FakeModelForListView(Assets.images.poster1.path,
        " بتل پس ", "100000", "50000",true),
    FakeModelForListView(Assets.images.p2.path,
        "کوریور دوتا2", "100000", "50000",true),
    FakeModelForListView(Assets.images.p3.path,
        "ارکانای جاگارنات", "100000", "50000",false),



  ];

}

class FakeModelForListView{

  late String image;
  late String name;
  late String price;
  late String off;
  late bool user;

  FakeModelForListView(this.image, this.name, this.price, this.off,this.user);


}


