import 'package:flutter/material.dart';
import 'main.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      autofocus: true,
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SCBottom()));
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Signup()));
                      },
                      child: Text('Sign up'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
