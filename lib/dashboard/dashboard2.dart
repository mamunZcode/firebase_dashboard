import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/dashboard/components/Sidemenu.dart';

class dashboard2 extends StatefulWidget{
  static const String id= 'dashboard2';

  @override
  State<dashboard2> createState() => _dashboard2State();
}

class _dashboard2State extends State<dashboard2> {
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance.collection('info').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child:Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Sidemenu(),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
               color: Colors.cyan,
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
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
