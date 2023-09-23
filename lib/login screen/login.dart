import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/dashboard/dashboard.dart';
import 'package:firebase_setup/registration%20Screen/registration.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../TextContainer.dart';

class login extends StatefulWidget {
  static const String id = 'login';

  @override
  State<login> createState() => _loginState();

  const login({Key? key}) : super(key: key);
}

class _loginState extends State<login> {
  //Text Controller
  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idController = TextEditingController();

// Firebase auth init:
  void singIn() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
        email: emailNameController.value.text,
        password: passwordController.value.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 48.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Image(
                image: AssetImage('assets/love2.png'),
                width: 125.0,
                height: 125.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  )),
              //userNAme
              TextContainer(
                nameController: emailNameController,
                labelText: 'Enter Your Email',
                icon: Icon(Icons.drive_file_rename_outline_sharp),
                obscureText: false,
                hintText: 'mamun@65gmail.com',
              ),
              //Password
              TextContainer(
                nameController: passwordController,
                labelText: 'Enter your password',
                icon: Icon(Icons.password_outlined),
                obscureText: true,
                hintText: '56846',
              ),
              SizedBox(
                height: 30.0,
              ),
              //Button
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      singIn();
                      // Navigator.pushNamed(context, '/ dashboard');
                    },
                    icon: Icon(
                      Icons.image,
                    ),
                    label: Text(
                      "login",
                      style: TextStyle(color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      reset();
                    },
                    label: Text(
                      'reset',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(Icons.add_card),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    'Registration here',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 18.0),
                  )),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, registration.id);
                      },
                      child: Text(
                        'click here',
                        textAlign: TextAlign.center,
                      )),
                ],
              )
            ],
          ),
        ));
  }

  void reset() {
    emailNameController.text = '';
    passwordController.text = '';
  }
}
