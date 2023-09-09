import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/registration%20Screen/registration.dart';
import 'package:flutter/material.dart';
import '../TextContainer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';
import 'dashboard.dart';
import 'package:firebase_setup/registration Screen/registration.dart';
import '../registration Screen/registration.dart';

class login extends StatefulWidget {
  static const String id= 'login';
  @override
  State<login> createState() => _loginState();
  const login ({Key?key}): super (key: key);
}
class _loginState extends State<login> {
  //Text Controller
  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
// Firebase auth init:
  void singIn(){
    context.read<FirebaseAuthMethods>().loginWithEmail(email: emailNameController.value.text, password: passwordController.value.text, context: context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Color(0xFF0A0E21),
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 48.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
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
                Center(child: Text('Login', style: TextStyle(fontSize: 24.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),)),
                //userNAme
                TextContainer(nameController: emailNameController,
                    labelText: 'Enter Your Email',
                    icon: Icon(Icons.drive_file_rename_outline_sharp),
                    obscureText: false,
                ),
                //Password
                TextContainer(nameController: passwordController,
                    labelText: 'Enter your password',
                    icon: Icon(Icons.password_outlined),
                    obscureText: true,
                ),
                //Button
                Expanded(
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                  ),
                ),
                Expanded(
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Registration here',textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 18.0),)),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,registration.id);
                        },
                        child: Text('click here',textAlign: TextAlign.center,)

                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  void reset() {
    emailNameController.text = '';
    passwordController.text = '';
  }

}