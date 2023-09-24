import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class datastore extends StatefulWidget{

  @override
  State<datastore> createState() => _datastoreState();
}

class _datastoreState extends State<datastore> {
  final Stream <QuerySnapshot> users = FirebaseFirestore.instance.collection('info').snapshots();

  @override
  Widget build(BuildContext context) {
   return Scaffold(

     body: Container(
       child: StreamBuilder<QuerySnapshot>(
         stream: users,
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
                 return Text('User name is${data.docs[index]['name']}'+'\n'+
                     'Email is ${data.docs[index]['Email']}''\n'+
                     'Address is ${data.docs[index]['address']}''\n'+
                     'phone number is ${data.docs[index]['phone Number']}',style: TextStyle(fontSize: 20.0,color: Colors.deepOrange),
                 );
               }
           );
         },
       ),
       height: 400,
       width: 350,
       color: Colors.black12,
     ),

   );
  }
}