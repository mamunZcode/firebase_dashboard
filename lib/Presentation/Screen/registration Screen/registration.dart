import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_setup/Presentation/Screen/login%20screen/login.dart';
import 'package:flutter/material.dart';
import '../../../Core/service/firebase_auth_methods.dart';
import '../../Widget/TextContainer.dart';
import 'package:provider/provider.dart';


class Registration extends StatefulWidget {
  static const String id = 'registration';

  const Registration({super.key});
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController ilController = TextEditingController();
  void singUp() {
    context
        .read<FirebaseAuthMethods>()
        .signUpWithEmail(email: emailController.value.text, password: passController.value.text, context: context);
  }
  void reset() {
    nameController.text = '';
    emailController.text = '';
    passController.text = '';
    idController.text = '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration Here'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const Center(
                  child: Text(
                'SingUp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff705ec9)),
              )),
              const SizedBox(
                height: 18.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    'You have to chance to create new' +
                        '\n'
                            'account if you Really Want to',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 18.0),
                  )),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              //Name
              TextContainer(
                color: Colors.black,
                nameController: nameController,
                labelText: 'Enter Your Name',
                icon: Icon(Icons.drive_file_rename_outline),
                obscureText: false,
                hintText: 'Muntasir',
              ),
              //Email
              TextContainer(
                color: Colors.black,
                nameController: emailController,
                labelText: 'Enter Your Email',
                icon: Icon(Icons.email),
                obscureText: false,
                hintText: 'mamun@gmail.com',
              ),
              //pass
              TextContainer(
                color: Colors.black,
                nameController: passController,
                labelText: 'Enter Your Password',
                icon: Icon(Icons.password_rounded),
                obscureText: true,
                hintText: '12345',
              ),

              TextContainer(
                  color: Colors.black,
                  nameController: idController,
                  labelText: 'Enter Your id Please',
                  icon: Icon(EvaIcons.heart),
                  obscureText: false,
                  hintText: '192-35-2870'),
              ///Button
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: singUp,
                    icon: const Icon(
                      Icons.save_alt_sharp,
                      color: Colors.black54,
                    ),
                    label: const Text(
                      "SingUp",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff705ec9)),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
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
                    icon: const Icon(Icons.reset_tv_outlined,color: Colors.black54,),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff705ec9)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    'Already have a Account ? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 18.0),
                  )),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, login.id);
                      },
                      child: const Text(
                        'click here',
                        textAlign: TextAlign.center,
                      )),
                ],
              )
            ],
          ),
        ));
  }


}
