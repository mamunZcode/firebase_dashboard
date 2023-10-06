import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_setup/dashboard2/components/listtileCustom2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_setup/dashboard/components/listtilecustom.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../dashboard/components/dashboardContainer.dart';

class dashboard22 extends StatelessWidget {
  static const String id = 'dashboard22';
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      //BOTTOM NAVIGATION BAR
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: Colors.black87,
          itemCount: 3,
          tabBuilder: (index, isActive) {
            return Icon(
              index == 0
                  ? Icons.home
                  : (index == 1 ? Icons.search : Icons.person),
              color: Colors.blue,
            );
          },
          activeIndex: _currentindex,
          onTap: (index) {}),
      // MAIN SCREEN
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Drawer(
              backgroundColor:Color(0xffffdffd),
              child: Column(
                children: [
                  DrawerHeader(
                      child: Image(
                    image: AssetImage('assets/list.png'),
                  )),
                  ListTileCustom2(
                    image: 'assets/home.png',
                    press: () {},
                  ),
                  ListTileCustom2(image: 'assets/star1.png', press: () {},foregroundColor: Colors.black,),
                  ListTileCustom2(image: 'assets/love.png', press: () {}),
                  ListTileCustom2(image: 'assets/location.png', press: () {}),
                  ListTileCustom2(image: 'assets/chat.png', press: () {}),
                  ListTileCustom2(image: 'assets/setting.png', press: () {}),
                  ListTileCustom2(image: 'assets/wifi.png', press: () {}),
                ],
              ),
              width: 80.0,
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBar(
                      leading: Center(child: Text('Logo',style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),)),
                      title: Text('AppBar',style: TextStyle(color: Colors.black),),
                      backgroundColor: Colors.white,
                      actions: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded))
                      ],
                      iconTheme: IconThemeData(
                        color: Colors.black87,
                        size: 24.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),

                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    //1st Raw
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: dashboardContainer(
                            text: Text(
                              'your mail',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            bottomText: Text(
                              '${'Mamun'}' +
                                  '\n'
                                      'Name: ${['name']},' +
                                  '\n'
                                      'Age: ${['age']}',
                              overflow: TextOverflow.fade,
                              style: TextStyle(fontSize: 24),
                            ),
                            icon: Icons.attach_money,
                            color: Colors.white38,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                            color: Colors.white38,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                    Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                    Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                            color: Colors.white38,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(

                                child:  Column(
                                  children: [
                                    Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                    Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                    Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                  ],
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 2nd Raw
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Card(
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                color: Colors.white38,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    child:  Column(
                                      children: [
                                        Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                        Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                        Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                        Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                        Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                        Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                color: Colors.white38,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    child:  Column(
                                      children: [
                                        Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                        Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                        Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                        Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                        Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                        Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                      ],
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Card(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                            color: Colors.white38,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child:  Column(
                                  children: [
                                    Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                    Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                    Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                  ],
                                )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // 3rd Row
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Card(
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                color: Colors.white38,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                      child:  Column(
                                        children: [
                                          Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                          Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                          Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                        ],
                                      )
                                  ),
                                ),
                                  ),
                              Card(
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                color: Colors.white38,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                      child:  Column(
                                        children: [
                                          Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                          Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                          Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                        ],
                                      )

                                  ),
                                ),
                                  ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                             Card(
                               shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                               color: Colors.white38,
                               child: Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child: Container(
                                     child:  Column(
                                       children: [
                                         Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                         Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                         Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                         Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                         Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                         Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                       ],
                                     )
                                 ),
                               ),
                                  ),
                              Card(
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                color: Colors.white38,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                      child:  Column(
                                        children: [
                                          Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                          Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                          Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                          Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                        ],
                                      )

                                  ),
                                ),
                                  ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Card(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                            color: Colors.white38,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  child:  Column(
                                    children: [
                                      Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                      Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                      Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                      Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                      Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                      Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    ],
                                  )
                              ),
                            ),
                              ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Card(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                            color: Colors.white38,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  child:  Column(
                                    children: [
                                      Text("Hellogfgfgfgffgfgfdgsfgdsg"),
                                      Text("Hellogfgfgfggfdgsfdgdffgdfs"),
                                      Text("Hellofgfgfggfdgsdgfgfdgfgfd"),
                                      Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                      Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                      Text("Hellogfgfgfgfdgfsdgfdgfgfg"),
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
