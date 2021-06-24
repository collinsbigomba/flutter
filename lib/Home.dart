import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:lottie/lottie.dart';

var bannerItems = ['Hotels', 'Safaris', 'love', 'Picnics', 'Entertainment'];
var bannerImage = [
  'assets/iages.jpeg',
  'assets/images.jpeg',
  'assets/1.jpeg',
  'assets/images1.jpeg',
  'assets/images2.jpeg',
];

class HiddenDrawer extends StatefulWidget {
  HiddenDrawer({Key? key}) : super(key: key);

  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> items = [];

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Home",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
          selectedStyle: TextStyle(),
        ),
        Home()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Info",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(),
        ),
        Home2()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HiddenDrawerMenu(
        actionsAppBar: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
        backgroundColorMenu: Colors.blueGrey,
        backgroundColorAppBar: Colors.cyan,
        screens: items,
        //    typeOpen: TypeOpen.FROM_RIGHT,
        //    disableAppBarDefault: false,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
        slidePercent: 50,
        verticalScalePercent: 80.0,
        contentCornerRadius: 40.0,
        //    iconMenuAppBar: Icon(Icons.menu),
        //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //    whithAutoTittleName: true,
        //    styleAutoTittleName: TextStyle(color: Colors.red),

        //    backgroundColorContent: Colors.blue,
        elevationAppBar: 0,
        //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        //    enableShadowItensMenu: true,
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Lottie.asset('assets/plant.json'),
          ),
        ],
      )),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: TextFormField(
                  controller: searchTextEditingController,
                  autocorrect: true,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Search..',
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(0.9),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.orange,
                      )),
                ),
              ),
            ),
            BannerWidgetArea(),
          ],
        ),
      ),
    );
  }
}

class BannerWidgetArea extends StatefulWidget {
  const BannerWidgetArea({Key? key}) : super(key: key);
  @override
  _BannerWidgetAreaState createState() => _BannerWidgetAreaState();
}

class _BannerWidgetAreaState extends State<BannerWidgetArea> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = [];

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          //shadow behind pageview
                          color: Colors.black54,
                          offset: Offset(4, 4),
                          blurRadius: 5,
                          spreadRadius: 3)
                    ]),
              ),
              ClipRRect(
                child: Image.asset(
                  bannerImage[x],
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    //black  shadow on page
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[x],
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Container(
      width: screenwidth,
      height: screenwidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
