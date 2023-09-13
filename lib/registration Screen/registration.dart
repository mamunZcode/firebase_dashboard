import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_setup/login%20screen/login.dart';
import 'package:flutter/material.dart';
import '../TextContainer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';


class registration extends StatefulWidget{
  static const String id= 'registration';
  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void singup(){
      context.read<FirebaseAuthMethods>().signUpWithEmail(email: emailController.value.text, password: passController.value.text, context: context);
    }
    return Scaffold(
      body:  SafeArea(
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Center(child: Text('SingUp',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff705ec9) ),)),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('You have to chance to create new'+'\n'
                      'account if you Really Want to',textAlign: TextAlign.center,style: TextStyle(color: Colors.black87,fontSize: 18.0),)),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              //Name
              TextContainer(nameController: nameController, labelText: 'Enter Your Name', icon: Icon(Icons.drive_file_rename_outline),obscureText:false, hintText:'Muntasir',
              ),
              //Email
              TextContainer(nameController: emailController, labelText: 'Enter Your Email', icon: Icon(Icons.email),obscureText: false,hintText: 'mamun@gmail.com',
              ),
              //pass
              TextContainer(nameController: passController, labelText: 'Enter Your Password', icon: Icon(Icons.password_rounded), obscureText: true,hintText: '12345',),

              TextContainer(nameController: ageController, labelText: 'Enter Your Age Please', icon: Icon(EvaIcons.heart), obscureText: false, hintText: '12'),
              //Button
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Expanded(
                    child: ElevatedButton.icon(
                      onPressed: singup,
                      icon: Icon(
                        Icons.done,
                      ),
                      label: Text(
                        "SingUp",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff705ec9)),
                    ),
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
                        backgroundColor: Color(0xff705ec9)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Center(child: Text('Already have a Account ? ',textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 18.0),)),
                   SizedBox(
                     width: 5.0,
                   ),
                   GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context,login.id);
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
  void reset (){
    nameController.text='';
    emailController.text='';
    passController.text='';
  }
}
