import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/dashboard/components/Sidemenu.dart';
import 'package:firebase_setup/dashboard/components/dashboardContainer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class dashboard2 extends StatefulWidget{
  static const String id= 'dashboard2';

  @override
  State<dashboard2> createState() => _dashboard2State();
}

class _dashboard2State extends State<dashboard2> {
  int _currentindex =0;
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance.collection('info').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.red,
          itemCount: 3,
          tabBuilder: (index,isActive){
            return Icon(
              index == 0 ? Icons.home : (index == 1 ? Icons.search : Icons.person),
              color: Colors.blue,
            );
          },
          activeIndex: _currentindex,
          onTap: (index){
            setState(() {
                index = _currentindex;
            });
          }),
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
              child: Row(
                children: [
                  Expanded(child:
                  Container(
                    color: Colors.red,
                    height: 550,
                    width: 350,
                    child:SfCartesianChart(
                      backgroundColor: Colors.purpleAccent,
                      title: ChartTitle(
                        text: 'Mamun',
                        textStyle: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                        ),
                        alignment: ChartAlignment.center
                      ),
                    ),
                  )
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: 550,
                      width: 350,
                      child:SfCartesianChart(
                        title: ChartTitle(
                            text: 'Kings',
                            textStyle: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                            ),
                            alignment: ChartAlignment.center
                        ),
                        backgroundColor: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}
