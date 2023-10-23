import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_setup/dashboard2/components/listtileCustom2.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';
import 'package:firebase_setup/service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../TextContainer.dart';
import '../dashboard/components/dashboardContainer.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';

class dashboard22 extends StatefulWidget {
  static const String id = 'dashboard22';

  @override
  State<dashboard22> createState() => _dashboard22State();
}

class _dashboard22State extends State<dashboard22> {
// Backend
  TextEditingController searchContoller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FirestoreService firestoreService = FirestoreService();
  Map<String, dynamic> data = {};
  Map<String, dynamic> data2 = {};
  bool isDataExistForCurrentUser = false;

  setStateIfdataExist() async {
    var currentUser = context.read<FirebaseAuthMethods>().user;
    var docs = await firestoreService.getDocuments(currentUser.uid);
    var profile_data =
        docs.where((map) => map["doc_id"].contains("profile_data")).toList();
    var personal_data =
        docs.where((map) => map["doc_id"].contains("personal_data")).toList();

    if (docs.isNotEmpty) {
      setState(() {
        data = profile_data.first;
        data2 = personal_data.first;
        isDataExistForCurrentUser = true;
      });
    }
  }

  void saveData() async {
    var currentUser = context.read<FirebaseAuthMethods>().user;
    await firestoreService.addProfileData(currentUser.uid, {
      'name': nameController.value.text,
      'age': ageController.value.text,
    });
    await firestoreService.addPersonalData(currentUser.uid, {
      'address': addressController.value.text,
      'phonenum': phoneController.value.text,
    });
  }

  @override
  void initState() {
    super.initState();
    setStateIfdataExist();
  }

  int _currentindex = 0;

// app start
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
      body: Consumer<FirebaseAuthMethods>(builder: (context, auth, child) {
        if (!isDataExistForCurrentUser) {
          return user_details_form();
        } else {
          return SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Drawer(
                  backgroundColor: Color(0xffffdffd),
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
                      ListTileCustom2(
                        image: 'assets/star1.png',
                        press: () {},
                        foregroundColor: Colors.black,
                      ),
                      ListTileCustom2(image: 'assets/love.png', press: () {}),
                      ListTileCustom2(
                          image: 'assets/location.png', press: () {}),
                      ListTileCustom2(image: 'assets/chat.png', press: () {}),
                      ListTileCustom2(
                          image: 'assets/setting.png', press: () {}),
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
                          leading: Center(
                              child: Text(
                            'Logo',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          )),
                          title: Text(
                            'AppBar',
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Colors.white,
                          actions: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search_rounded),
                              tooltip: 'open it',
                            )
                          ],
                          iconTheme: IconThemeData(
                            color: Colors.black87,
                            size: 24.0,
                          ),
                          shadowColor: Colors.yellowAccent,
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    gradient: LinearGradient(
                                        tileMode: TileMode.clamp,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.blue, Colors.green],
                                        transform: GradientRotation(20.0))),
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
                                  '${auth.user.email}' +
                                      '\n'
                                          'Name: ${data['name']},' +
                                      '\n'
                                          'Age: ${data['age']}',
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(fontSize: 24),
                                ),
                                icon: Icons.attach_money,
                                color: Colors.black12,
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: dashboardContainer(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      gradient: LinearGradient(
                                          tileMode: TileMode.clamp,
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Colors.blue, Colors.green],
                                          transform: GradientRotation(20.0))),
                                  text: Text(
                                    'Your Details',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  bottomText: Text(
                                    '${'DetaisInFO'}' +
                                        '\n'
                                            'AddressName: ${data2['address']},' +
                                        '\n'
                                            'Number: ${data2["phonenum"]}',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  icon: Icons.attach_money,
                                  color: Colors.black12,
                                )),
                            Expanded(
                              flex: 1,
                              child: dashboardContainer(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    gradient: LinearGradient(
                                        tileMode: TileMode.clamp,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.blue, Colors.green],
                                        transform: GradientRotation(20.0))),
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
                                color: Colors.black12,
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            gradient: LinearGradient(
                                                tileMode: TileMode.clamp,
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.blue,
                                                  Colors.green
                                                ],
                                                transform:
                                                    GradientRotation(20.0))),
                                        height: 80,
                                        width: 300,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '  data',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.fade,
                                            ),
                                            Icon(Icons.import_contacts_sharp),
                                            Text(
                                              '1365  ',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.fade,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.blue,
                                                Colors.green
                                              ],
                                            )),
                                        height: 80,
                                        width: 300,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '  data',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.fade,
                                            ),
                                            Icon(Icons.import_contacts_sharp),
                                            Text(
                                              '1365  ',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.fade,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                color: Colors.white38,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                      child: Column(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 300,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('data'),

                                          ],
                                        ),
                                      )
                                    ],
                                  )),
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    color: Colors.blueGrey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                          height: 120,
                                          width: 120,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cloud),
                                              Text('User')
                                            ],
                                          )),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    color: Colors.yellowAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                          height: 120,
                                          width: 120,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cloud),
                                              Text('User')
                                            ],
                                          )),
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    color: Colors.greenAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                          height: 120,
                                          width: 120,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cloud),
                                              Text('User')
                                            ],
                                          )),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                          height: 120,
                                          width: 120,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cloud),
                                              Text('User')
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
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
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
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
                                  )),
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
          );
        }
      }),
    );
  }

  Column user_details_form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          'Give Your Information',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color(0xff4f378b)),
        )),
        TextContainer(
            nameController: nameController,
            labelText: "Name",
            icon: Icon(Icons.verified_user),
            obscureText: false,
            hintText: 'Enter your name'),
        TextContainer(
            nameController: ageController,
            labelText: "Age",
            icon: Icon(Icons.numbers),
            obscureText: false,
            hintText: 'Enter your age'),
        TextContainer(
            nameController: addressController,
            labelText: 'Enter Your Address',
            icon: Icon(Icons.ice_skating_sharp),
            obscureText: false,
            hintText: 'gfd'),
        TextContainer(
            nameController: phoneController,
            labelText: 'Enter Your Phone Num',
            icon: Icon(Icons.ice_skating_sharp),
            obscureText: false,
            hintText: '017456'),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: () {
              saveData();
              setStateIfdataExist();
            },
            child: Text('submit')),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
