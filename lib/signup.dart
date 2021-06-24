import 'package:flutter/material.dart';

import 'main.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'collinsbigomba8@gmail.com',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  maxLength: 30,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Email is required";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phonelink_lock),
                      labelText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    obscureText: true,
                    maxLength: 15,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "password is required";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SCBottom()));
                  },
                  child: Text("Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
