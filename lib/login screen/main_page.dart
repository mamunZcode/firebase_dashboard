import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/login%20screen/login.dart';
import 'package:firebase_setup/registration%20Screen/registration.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class main_page extends StatefulWidget{
  @override
  State<main_page> createState() => _main_pageState();
}
class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return dashboard();
          }
          else{
            return login();
          }
        },
      ),
    );
  }
}