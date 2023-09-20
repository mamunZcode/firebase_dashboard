import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/login%20screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';
import 'dashboard2.dart';
import 'package:firebase_setup/dashboard/components/dashboardContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class dashboard extends StatelessWidget {
  // final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('Name').snapshots();
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance.collection('info').snapshots();
  static const String id = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        body: Stack(children: [
          Opacity(
            opacity: 0.2,
            child: Image(
              image: AssetImage('assets/Mamun.jpeg'),
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Consumer<FirebaseAuthMethods>(builder: (context, auth, child) {
            return SafeArea(
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // read data
                        // Container(
                        //   child:
                        //   StreamBuilder<QuerySnapshot>(
                        //     stream: users,
                        //     builder:(
                        //         BuildContext context,
                        //         AsyncSnapshot<QuerySnapshot> snapshot,
                        //   ){
                        //       if(snapshot.hasError){
                        //         return Text('its error');
                        //       }
                        //    if(snapshot.connectionState == ConnectionState.waiting){
                        //      return Text('Loading');
                        //    }
                        //    final data = snapshot.requireData;
                        //    return ListView.builder(
                        //        itemCount: data.size,
                        //        itemBuilder:(context,index){
                        //          return Text('my email is ${data.docs[index]['Email']}'+'\n'
                        //              'My name is ${data.docs[index]['Name']}');
                        //        }
                        //    );
                        //     }
                        //   ),
                        //   color: Colors.blue,
                        //   height: 400.0,
                        //   width: 300.0,
                        // ),
                        Expanded(
                          child: dashboardContainer(
                            text: Text(
                              'your mail',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            bottomText: Text(
                              '${auth.user.email}',
                              style: TextStyle(fontSize: 24),
                            ),
                            icon: Icons.attach_money,
                            color: Colors.deepOrange,
                            child:
                            Container(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: user,
                                builder: (
                                    BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot,
                                    ){
                                  if(snapshot.hasError){
                                    return Text('This is error');
                                  }
                                  if(snapshot.connectionState==ConnectionState.waiting){
                                    return Text('Loading');
                                  }
                                  final data = snapshot.requireData;
                                  return ListView.builder(
                                      itemCount: data.size,
                                      itemBuilder: (
                                          context,
                                          index,
                                          ){
                                        return Text('User name is:''\n''${data.docs[index]['name']}'
                                          ,style: TextStyle(fontSize: 15.0,color: Colors.black26,fontWeight: FontWeight.bold),
                                        );
                                      }
                                  );
                                },
                              ),
                              height: 100,
                              width: 150,
                            )
                            ,
                          ),
                        ),
                        Expanded(
                            child: dashboardContainer(
                          text: Text(
                            'totalAmount',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          bottomText: Text(
                            '\$1000.00',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          icon: Icons.cabin,
                          color: Colors.deepPurple,
                              child: Container(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: user,
                                  builder: (
                                      BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot,
                                      ){
                                    if(snapshot.hasError){
                                      return Text('This is error');
                                    }
                                    if(snapshot.connectionState==ConnectionState.waiting){
                                      return Text('Loading');
                                    }
                                    final data = snapshot.requireData;
                                    return ListView.builder(
                                        itemCount: data.size,
                                        itemBuilder: (
                                            context,
                                            index,
                                            ){
                                          return Text('User name is:${data.docs[index]['name']}',style: TextStyle(fontSize: 5.0,color: Colors.deepOrange),
                                          );
                                        }
                                    );
                                  },
                                ),
                                height: 100,
                                width: 150,
                              ) ,
                        )),
                        Expanded(
                          child: dashboardContainer(
                            text: Text(
                              'my amount',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,),
                            ),
                            bottomText: Text(
                              '\$1000.00',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            icon: Icons.ice_skating,
                            color: Colors.deepPurpleAccent,
                            child: Container(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: user,
                                builder: (
                                    BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot,
                                    ){
                                  if(snapshot.hasError){
                                    return Text('This is error');
                                  }
                                  if(snapshot.connectionState==ConnectionState.waiting){
                                    return Text('Loading');
                                  }
                                  final data = snapshot.requireData;
                                  return ListView.builder(
                                      itemCount: data.size,
                                      itemBuilder: (
                                          context,
                                          index,
                                          ){
                                        return Text('User name is :${data.docs[index]['name']}'+'\n'+
                                            'Email is :${data.docs[index]['Email']}''\n'+
                                            'Address is :${data.docs[index]['address']}''\n'+
                                            'phone number is :${data.docs[index]['phone Number']}',style: TextStyle(fontSize: 20.0,color: Colors.deepOrange),
                                        );
                                      }
                                  );
                                },
                              ),
                              height: 100,
                              width: 150,
                            ) ,
                          ),
                        ),
                        Expanded(
                            child: dashboardContainer(
                          text: Text(
                            'my amount',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          bottomText: Text(
                            '\$1000.00',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          icon: Icons.ice_skating,
                          color: Colors.deepOrange,
                              child:  Container(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: user,
                                  builder: (
                                      BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot,
                                      ){
                                    if(snapshot.hasError){
                                      return Text('This is error');
                                    }
                                    if(snapshot.connectionState==ConnectionState.waiting){
                                      return Text('Loading');
                                    }
                                    final data = snapshot.requireData;
                                    return ListView.builder(
                                        itemCount: data.size,
                                        itemBuilder: (
                                            context,
                                            index,
                                            ){
                                          return Text('User name is :${data.docs[index]['name']}'+'\n'+
                                              'Email is :${data.docs[index]['Email']}''\n'+
                                              'Address is :${data.docs[index]['address']}''\n'+
                                              'phone number is :${data.docs[index]['phone Number']}''\n'+
                                              'fav color is: ${data.docs[index]['fav color']}',
                                            style: TextStyle(fontSize: 20.0,color: Colors.black),
                                          );
                                        }
                                    );
                                  },
                                ),
                                height: 100,
                                width: 150,
                              ),
                        )),
                        Expanded(
                          child: dashboardContainer(
                            text: Text(
                              'Account',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            bottomText: Text(
                              '\$1000.00',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            icon: Icons.ice_skating,
                            color: Colors.orangeAccent,
                            child:  Container(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: user,
                                builder: (
                                    BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot,
                                    ){
                                  if(snapshot.hasError){
                                    return Text('This is error');
                                  }
                                  if(snapshot.connectionState==ConnectionState.waiting){
                                    return Text('Loading');
                                  }
                                  final data = snapshot.requireData;
                                  return ListView.builder(
                                      itemCount: data.size,
                                      itemBuilder: (
                                          context,
                                          index,
                                          ){
                                        return Text('User name is :${data.docs[index]['name']}'+'\n'+
                                            'Email is :${data.docs[index]['Email']}''\n'+
                                            'Address is :${data.docs[index]['address']}''\n'+
                                            'phone number is :${data.docs[index]['phone Number']}',style: TextStyle(fontSize: 20.0,color: Colors.deepOrange),
                                        );
                                      }
                                  );
                                },
                              ),
                              height: 100,
                              width: 150,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, dashboard2.id);
                          },
                          label: Text(
                            'mamun page',
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: Icon(Icons.login),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ]));
  }
}
