import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.of(context).pop();
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
        body: Center(child: CircleAvatar()),
      ),
    );
  }
}
