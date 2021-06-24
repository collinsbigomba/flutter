import 'dart:async';
import 'package:flutter/material.dart';
import 'modals/constants.dart';

class Categoriess extends StatefulWidget {
  Categoriess({Key? key}) : super(key: key);

  @override
  _CategoriessState createState() => _CategoriessState();
}

class _CategoriessState extends State<Categoriess> {
  int currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentIndex < sliderImages.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 340), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          'Users',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: sliderImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      sliderImages[index],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    sliderImages.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      width: currentIndex == index ? 24 : 8,
                      height: 8,
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                          color:
                              currentIndex == index ? cOrange : cPrimaryLight,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
            ],
          ), //StickyLabel()
        ],
      ),
    ));
  }
}
