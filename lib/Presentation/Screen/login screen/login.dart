
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Core/service/firebase_auth_methods.dart';
import '../../Widget/TextContainer.dart';
import '../registration Screen/registration.dart';


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
  bool isShow  = false;
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
              const Image(
                image: AssetImage('assets/love2.png'),
                width: 125.0,
                height: 125.0,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                  alignment: Alignment.center,
                  child: const Text(
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
                icon: const Icon(Icons.drive_file_rename_outline_sharp),
                obscureText: false,
                hintText: 'mamun@65gmail.com',
                color: Colors.black,
              ),
              //Password
              TextContainer(
                color: Colors.black,
                nameController: passwordController,
                labelText: 'Enter your password',
                icon: const Icon(Icons.password_outlined),
                obscureText: !isShow,
                hintText: '56846',
                iconButton: IconButton(
                  icon: Icon(
                    isShow ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              //Button
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      singIn();
                    },
                    icon: const Icon(
                      Icons.login,
                      color: Colors.black54,
                    ),
                    label: const Text(
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
                    label: const Text(
                      'reset',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(
                        Icons.reset_tv_outlined,
                      color: Colors.black54,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    'Registration here',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 18.0),
                  )),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Registration.id);
                      },
                      child: const Text(
                        'click here',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(onPressed:(){
              //
              //     Navigator.pushNamed(context, DashboardTwo.id);
              //   }, child: const Text('New Dashboard')),
              // )
            ],
          ),
        )
    );
  }

  void reset() {
    emailNameController.text = '';
    passwordController.text = '';
  }
}
