import 'package:firebase_setup/login%20screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';
import 'dashboardContainer.dart';

class dashboard extends StatefulWidget {
  static const String id = 'dashboard';

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Consumer<FirebaseAuthMethods>(builder: (context, auth, child) {
          return SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashboardContainer(
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
                      color: Colors.red,),
                    dashboardContainer(
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
                      color: Colors.pink,
                    ),
                    dashboardContainer(
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
                      color: Colors.green,
                    ),
                    dashboardContainer(
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
                      color: Colors.yellowAccent,
                    ),
                    dashboardContainer(
                      text: Text(
                        'Account',
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
                      color: Colors.orangeAccent,
                    )
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
                          Navigator.pushNamed(context, login.id);
                        },
                        label: Text(
                          'mamun page',
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
          );
        }));
  }
}
