import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget{
  @override
  State<dashboard> createState() => _dashboardState();
}
class _dashboardState extends State<dashboard> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount',style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),),
                              Text('\$1000.00', style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          Icon(Icons.attach_money),
                        ],
                      ),
                    ),
                    color: Colors.pinkAccent,
                    elevation: 4,
                  ),
                ),
                Expanded(child:
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Amount',style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),),
                            Text('\$1000.00', style: TextStyle(fontSize: 24)),
                          ],
                        ),
                        Icon(Icons.attach_money),
                      ],
                    ),
                  ),
                  color: Colors.blueAccent,
                  elevation: 4,
                )
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount',style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),),
                              Text('\$1000.00', style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          Icon(Icons.attach_money),
                        ],
                      ),
                    ),
                    color: Colors.yellow,
                    elevation: 4,
                  ),
                ),
                Expanded(child:
                Card(
                  color: Colors.orangeAccent,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Amount', style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        )),
                        Text('\$1000.00', style: TextStyle(fontSize: 24, color: Colors.white)),
                      ],
                    ),
                  ),
                )
                ),
              ],
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
                      Navigator.pushNamed(context,'/ login');
                    },
                    label: Text(
                      'login',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(Icons.login),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}