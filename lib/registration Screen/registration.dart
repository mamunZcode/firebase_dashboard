import 'package:flutter/material.dart';
import '../TextContainer.dart';

class registration extends StatefulWidget{
  @override
  State<registration> createState() => _registrationState();
}
class _registrationState extends State<registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              TextContainer(nameController: nameController, labelText: 'Enter Your Name', icon: Icon(Icons.drive_file_rename_outline),obscureText:false,),
              //Email
              TextContainer(nameController: emailController, labelText: 'Enter Your Email', icon: Icon(Icons.email),obscureText: false,),
              //pass
              TextContainer(nameController: passController, labelText: 'Enter Your Password', icon: Icon(Icons.password_rounded), obscureText: true),
              //Button
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ login');
                      },
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
                   Text('click here',textAlign: TextAlign.center,),
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
