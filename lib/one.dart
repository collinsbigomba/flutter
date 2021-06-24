import 'package:flutter/material.dart';

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {Navigator.of(context).pop();
               
              }),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Discovery',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.camera_roll_sharp,
                  color: Colors.grey,
                ),
                onPressed: () {})
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10),
                children: [
                  listItem('assets/1.jpeg', 'assets/images14.jpeg'),
                  SizedBox(
                    width: 35,
                  ),
                  listItem('assets/1.jpeg', 'assets/images12.png'),
                  SizedBox(
                    width: 35,
                  ),
                  listItem('assets/1.jpeg', 'assets/images13.png'),
                  SizedBox(
                    width: 35,
                  ),
                  listItem('assets/1.jpeg', 'assets/images15.png'),
                  SizedBox(
                    width: 35,
                  ),
                  listItem('assets/1.jpeg', 'assets/images16.png'),
                  SizedBox(
                    width: 35,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 4,
                child: Container(
                    height: 450,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: AssetImage('assets/index3.jpeg'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Daisy',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '13 mins ago',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      iconSize: 20,
                                      icon: Icon(Icons.more_vert),
                                      color: Colors.grey,
                                      onPressed: () {})
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'jdrdycluhpo[wertyu76434567890--098ertyuiop[]asdfghjuytrrtyuihgfdfghjkjhgfdfghjkjhgfdfghjkjhgfghjkjhgfghj',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Hero(
                              tag: 'assets/images5.jpeg',
                              child: Container(
                                height: 200,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images6.jpeg',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Hero(
                                  tag: 'assets/iages.jpeg',
                                  child: Container(
                                    height: 95,
                                    width: (MediaQuery.of(context).size.width -
                                            100) /
                                        2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/1.jpeg',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Hero(
                                  tag: 'assets/images5.jpeg',
                                  child: Container(
                                    height: 95,
                                    width: (MediaQuery.of(context).size.width -
                                            100) /
                                        2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images6.jpeg',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.brown.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    'Smart Farming',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.brown),
                                  ),
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.brown.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    'E-Agriculture',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.brown),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.reply,
                              color: Colors.grey.withOpacity(0.4),
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '1.9million',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.comment,
                              color: Colors.grey.withOpacity(0.4),
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '378',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 100),
                              // width: MediaQuery.of(context).size.width - 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '3.6k',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(String imgPath, String logo) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.5),
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    image: DecorationImage(
                        image: AssetImage(logo), fit: BoxFit.cover)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        OutlinedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            icon: Icon(Icons.agriculture),
            label: Text(
              'follow',
              style: TextStyle(color: Colors.black),
            )),
        /*Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF916144)),
          child: Center(
            child: Text(
              'follow',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),*/
      ],
    );
  }
}
