import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'modals/constants.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  _CartState createState() => _CartState();
}

var scaffoldkey = GlobalKey<ScaffoldState>();

class _CartState extends State<Cart> {
  Future<Null> refreshList() async {
    await Future.delayed(Duration(
        seconds: 3)); // inorder for the refresh indicator to take 3 seconds
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      height: 100,
      color: Colors.orange[200],
      onRefresh: refreshList,
      child: SafeArea(
        child: Scrollbar(
          child: Scaffold(
            key: scaffoldkey,
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
              title: Text('Cart', style: GoogleFonts.lato(color: Colors.black)),
              actions: [
                IconButton(
                    color: Colors.green,
                    icon: FaIcon(FontAwesomeIcons.bell),
                    onPressed: () {
                      scaffoldkey.currentState!.openEndDrawer();
                    }),
              ],
            ),
            endDrawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      'E-Agric Manager',
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: Text(
                      'collinsbigomba8@gmail.com',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(color: Colors.white70),
                    currentAccountPicture: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage('assets/1.jpeg'),
                      ),
                    ),
                  ),
                  ListTile(
                    autofocus: true,
                    title: Text('Prices'),
                    trailing: Icon(Icons.monetization_on),
                    onTap: () {},
                  ),
                  ListTile(
                    autofocus: true,
                    title: Text('Account'),
                    trailing: Icon(Icons.account_balance),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    autofocus: true,
                    title: Text('Close'),
                    trailing: Icon(Icons.cancel),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Material(
              elevation: 8,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        '\$${cartList.length > 0 ? cartList.map((e) => e.price! * e.quantity!).reduce((value, element) => value + element).toStringAsFixed(2) : 0}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payments()));
                          },
                          child: Text(
                            'Pay',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                            ),
                          )))
                ],
              ),
            ),
            body: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  //   BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(cartList[index].image!),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartList[index].title!,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            cartList[index].desc!,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          Text("\$ ${cartList[index].price!.toString()}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (cartList[index].quantity! > 0) {
                                        // ignore: unnecessary_statements
                                        cartList[index].quantity! - 1;
                                      }
                                    });
                                  }),
                              Container(
                                  width: 44,
                                  height: 44,
                                  color: Colors.white70,
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: cartList[index]
                                            .quantity!
                                            .toString(),
                                        hintStyle:
                                            TextStyle(color: Colors.black)),
                                  )),
                              IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (cartList[index].quantity! <= 8) {
                                        // ignore: unnecessary_statements
                                        cartList[index].quantity! + 1;
                                      }
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
