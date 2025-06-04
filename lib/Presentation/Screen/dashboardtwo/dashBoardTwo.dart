import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_setup/Presentation/Screen/login%20screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import '../../../Core/service/firebase_auth_methods.dart';
import '../../../Core/service/firestore_service.dart';
import '../../Widget/TextContainer.dart';
import '../dashboard/components/dashboardContainer.dart';
import 'package:fl_chart/fl_chart.dart';

import 'components/listtileCustom2.dart';



class DashboardTwo extends StatefulWidget {
  static const String id = 'DashBoardTwo';


  @override
  State<DashboardTwo> createState() => _DashboardTwoState();
}

class _DashboardTwoState extends State<DashboardTwo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// // Backend
  TextEditingController searchContoller = TextEditingController();
  TextEditingController amountController=TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FireStoreService firestoreService = FireStoreService();
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
      'amount': amountController.value.text,
    });
  }

  @override
  void initState()
  {
    super.initState();
    setStateIfdataExist();
  }

  int _currentindex = 0;
//Design Forntend
// app start
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(preferredSize:Size.fromHeight(80.0),
              child:AppBar(
            backgroundColor: Colors.green,
            bottom:const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home_filled)),
                Tab(icon: Icon(Icons.image_aspect_ratio_outlined)),
                Tab(icon: Icon(Icons.headset_mic)),
              ],
              indicatorColor: Colors.green,
            ),
                actions: [
                  IconButton(onPressed: (){
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                      icon: const Icon(Icons.list))
                ],
          ),
          ),
          endDrawer: Drawer(
            // backgroundColor: Color(0xffffdffd),
            backgroundColor: Colors.green,
            child: Column(
              children: [
                DrawerHeader(
                    child: Image(
                      image: AssetImage('assets/list.png'),
                    )),
                ListTileCustom2(
                  image: 'assets/home.png',
                  press: () {
                    Navigator.pushNamed(context,login.id);
                  },
                ),
                ListTileCustom2(
                  image: 'assets/star1.png',
                  press: () {},
                  foregroundColor: Colors.black,
                ),
                ListTileCustom2(image: 'assets/love.png',
                    press: () {}
                ),
                ListTileCustom2(
                    image: 'assets/location.png',
                    press: () {}
                ),
                ListTileCustom2(image: 'assets/chat.png',
                    press: () {}
                ),
                ListTileCustom2(
                    image: 'assets/setting.png',
                    press: () {}
                ),
                ListTileCustom2(
                    image: 'assets/wifi.png',
                    press: () {}
                ),
              ],
            ),
            width: 80.0,
          ),
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
              return PageView(
                children:[
                  TabBarView(
                      children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Drawer

                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Appbar
                                //Appbar
                                // AppBar(
                                //   leading: Center(
                                //       child: Text(
                                //     'Logo',
                                //     style: TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 24.0,
                                //         fontWeight: FontWeight.bold),
                                //   )),
                                //   title: Text(
                                //     'AppBar',
                                //     style: TextStyle(color: Colors.black),
                                //   ),
                                //   backgroundColor: Colors.white,
                                //   actions: [
                                //
                                //     IconButton(
                                //       onPressed: () {
                                //         Navigator.pushNamed(context, login.id);
                                //       },
                                //       icon: Icon(Icons.search_rounded),
                                //       tooltip: 'search it',
                                //     ),
                                //
                                //   ],
                                //   iconTheme: IconThemeData(
                                //     color: Colors.black87,
                                //     size: 24.0,
                                //   ),
                                //   shadowColor: Colors.yellowAccent,
                                // ),
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
                                                colors: [Colors.yellowAccent, Colors.greenAccent],
                                                transform: GradientRotation(10.0))),
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
                                                  colors: [Colors.yellowAccent, Colors.greenAccent],
                                                  transform: GradientRotation(10.0))),
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
                                                colors: [Colors.yellowAccent, Colors.greenAccent],
                                                transform: GradientRotation(10.0))),
                                        text: Text(
                                          'Your Balance',
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        bottomText: Text(
                                          '${'Balance'}' +
                                              '\n'
                                                  'Total Balance: ${data2['amount']},' +
                                              '\n',
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
                                                          Colors.yellowAccent,
                                                          Colors.greenAccent,
                                                        ],
                                                        transform:
                                                        GradientRotation(10.0))),
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
                                                        transform: GradientRotation(20.0)
                                                    )
                                                ),
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
                                            height: 120,
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Current Memory Card'),
                                                    Icon(Icons.line_weight_sharp),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: LineChart(
                                                    LineChartData(
                                                      lineTouchData: LineTouchData(
                                                        touchTooltipData:
                                                        LineTouchTooltipData(
                                                          tooltipBgColor: Colors
                                                              .deepOrange, // Customize tooltip background color
                                                        ),
                                                        handleBuiltInTouches:
                                                        true, // Enable built-in touch gestures
                                                      ),
                                                      gridData: FlGridData(
                                                        show: true,
                                                        drawHorizontalLine: true,
                                                        drawVerticalLine: true,
                                                        horizontalInterval: 1,
                                                        verticalInterval: 1,
                                                      ),
                                                      titlesData: FlTitlesData(
                                                        leftTitles: AxisTitles(
                                                            sideTitles: SideTitles(
                                                                showTitles: true)),
                                                        bottomTitles: AxisTitles(
                                                            sideTitles: SideTitles(
                                                                showTitles: true)),
                                                      ),
                                                      borderData: FlBorderData(
                                                        show: true,
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 1.0),
                                                      ),
                                                      lineBarsData: [
                                                        LineChartBarData(
                                                          spots: [
                                                            FlSpot(0, 2),
                                                            FlSpot(2, 3),
                                                            FlSpot(4, 2.5),
                                                            FlSpot(6, 5),
                                                            FlSpot(8, 7),
                                                            FlSpot(10, 9.5),

                                                            // Add more data points here
                                                          ],
                                                          isCurved: true,
                                                          color: Colors.red,
                                                          dotData:
                                                          FlDotData(show: false),
                                                          belowBarData:
                                                          BarAreaData(show: false),
                                                        ),
                                                      ],
                                                      minX: 0,
                                                      maxX: 14,
                                                      minY: 0,
                                                      maxY: 6,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                              height: 250,
                                              width: 250,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Current Status'),
                                                      Flexible(child: Icon(Icons.line_axis)),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: PieChart(
                                                      PieChartData(
                                                        sections: [
                                                          PieChartSectionData(
                                                            color: Colors.blue, // Color of the pie section
                                                            value: 45, // Value of the section
                                                            title: '45%', // Title text (optional)
                                                            radius: 60, // Adjust the radius to make it half
                                                          ),
                                                          PieChartSectionData(
                                                            color: Colors.red, // Color of the pie section
                                                            value: 55, // Value of the section
                                                            title: '55%', // Title text (optional)
                                                            radius: 60, // Adjust the radius to make it half
                                                          ),
                                                        ],
                                                        borderData: FlBorderData(show: false), // Hide the border
                                                        sectionsSpace: 0, // Remove spacing between sections
                                                        centerSpaceRadius: 40, // Adjust the hole size in the center
                                                        startDegreeOffset: 90, // Rotate the chart to make it a half pie
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Icon( Symbols.settings,
                                                        fill: 1, weight: 700, grade: 0.25, opticalSize: 48 ,color: Colors.blueAccent,),
                                                      Icon( Symbols.sd_card,
                                                        fill: 1, weight: 700, grade: 0.25, opticalSize: 48 ,color: Colors.red,),
                                                    ],
                                                  )
                                                ],
                                              )

                                          ),
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
                                              height: 250,
                                              width: 250,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Cloud Storage'),
                                                      Flexible(child: Icon(Icons.line_weight)),
                                                    ],
                                                  ),
                                                  Center(
                                                    child: Image(
                                                      image: AssetImage('assets/cloud.png'),
                                                      height: 150,
                                                      width: 150,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 50,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('45 / 320GB'),
                                                      Flexible(child: Icon(Icons.sd_storage_outlined)),
                                                    ],
                                                  ),
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
                    Image(image: AssetImage('assets/newws.png') ),
                    Icon(Icons.directions_bike),
                  ]
                  ),
                //DashBoard Design
                //   Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Drawer(
                //       backgroundColor: Color(0xffffdffd),
                //       child: Column(
                //         children: [
                //           DrawerHeader(
                //               child: Image(
                //             image: AssetImage('assets/list.png'),
                //           )),
                //           ListTileCustom2(
                //             image: 'assets/home.png',
                //             press: () {
                //               Navigator.pushNamed(context,login.id);
                //             },
                //           ),
                //           ListTileCustom2(
                //             image: 'assets/star1.png',
                //             press: () {},
                //             foregroundColor: Colors.black,
                //           ),
                //           ListTileCustom2(image: 'assets/love.png',
                //               press: () {}
                //           ),
                //           ListTileCustom2(
                //               image: 'assets/location.png',
                //               press: () {}
                //           ),
                //           ListTileCustom2(image: 'assets/chat.png',
                //               press: () {}
                //           ),
                //           ListTileCustom2(
                //               image: 'assets/setting.png',
                //               press: () {}
                //           ),
                //           ListTileCustom2(
                //               image: 'assets/wifi.png',
                //               press: () {}
                //           ),
                //         ],
                //       ),
                //       width: 80.0,
                //     ),
                //     Expanded(
                //       flex: 1,
                //       child: SingleChildScrollView(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             // AppBar(
                //             //   leading: Center(
                //             //       child: Text(
                //             //     'Logo',
                //             //     style: TextStyle(
                //             //         color: Colors.black,
                //             //         fontSize: 24.0,
                //             //         fontWeight: FontWeight.bold),
                //             //   )),
                //             //   title: Text(
                //             //     'AppBar',
                //             //     style: TextStyle(color: Colors.black),
                //             //   ),
                //             //   backgroundColor: Colors.white,
                //             //   actions: [
                //             //
                //             //     IconButton(
                //             //       onPressed: () {
                //             //         Navigator.pushNamed(context, login.id);
                //             //       },
                //             //       icon: Icon(Icons.search_rounded),
                //             //       tooltip: 'search it',
                //             //     ),
                //             //
                //             //   ],
                //             //   iconTheme: IconThemeData(
                //             //     color: Colors.black87,
                //             //     size: 24.0,
                //             //   ),
                //             //   shadowColor: Colors.yellowAccent,
                //             // ),
                //             SizedBox(
                //               height: 16.0,
                //             ),
                //             //1st Raw
                //             Flex(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               direction: Axis.horizontal,
                //               children: [
                //                 Expanded(
                //                   flex: 1,
                //                   child: dashboardContainer(
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(20.0),
                //                         gradient: LinearGradient(
                //                             tileMode: TileMode.clamp,
                //                             begin: Alignment.topCenter,
                //                             end: Alignment.bottomCenter,
                //                             colors: [Colors.yellowAccent, Colors.greenAccent],
                //                             transform: GradientRotation(10.0))),
                //                     text: Text(
                //                       'your mail',
                //                       overflow: TextOverflow.fade,
                //                       style: TextStyle(
                //                         fontSize: 24,
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black87,
                //                       ),
                //                     ),
                //                     bottomText: Text(
                //                       '${auth.user.email}' +
                //                           '\n'
                //                               'Name: ${data['name']},' +
                //                           '\n'
                //                               'Age: ${data['age']}',
                //                       overflow: TextOverflow.fade,
                //                       style: TextStyle(fontSize: 24),
                //                     ),
                //                     icon: Icons.attach_money,
                //                     color: Colors.black12,
                //                   ),
                //                 ),
                //                 Expanded(
                //                     flex: 1,
                //                     child: dashboardContainer(
                //                       decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(20.0),
                //                           gradient: LinearGradient(
                //                               tileMode: TileMode.clamp,
                //                               begin: Alignment.topCenter,
                //                               end: Alignment.bottomCenter,
                //                               colors: [Colors.yellowAccent, Colors.greenAccent],
                //                               transform: GradientRotation(10.0))),
                //                       text: Text(
                //                         'Your Details',
                //                         overflow: TextOverflow.fade,
                //                         style: TextStyle(
                //                           fontSize: 24,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.black87,
                //                         ),
                //                       ),
                //                       bottomText: Text(
                //                         '${'DetaisInFO'}' +
                //                             '\n'
                //                                 'AddressName: ${data2['address']},' +
                //                             '\n'
                //                                 'Number: ${data2["phonenum"]}',
                //                         overflow: TextOverflow.fade,
                //                         style: TextStyle(fontSize: 24),
                //                       ),
                //                       icon: Icons.attach_money,
                //                       color: Colors.black12,
                //                     )),
                //                 Expanded(
                //                   flex: 1,
                //                   child: dashboardContainer(
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(20.0),
                //                         gradient: LinearGradient(
                //                             tileMode: TileMode.clamp,
                //                             begin: Alignment.topCenter,
                //                             end: Alignment.bottomCenter,
                //                             colors: [Colors.yellowAccent, Colors.greenAccent],
                //                             transform: GradientRotation(10.0))),
                //                     text: Text(
                //                       'Your Balance',
                //                       overflow: TextOverflow.fade,
                //                       style: TextStyle(
                //                         fontSize: 24,
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black87,
                //                       ),
                //                     ),
                //                     bottomText: Text(
                //                       '${'Balance'}' +
                //                           '\n'
                //                               'Total Balance: ${data2['amount']},' +
                //                           '\n',
                //                       overflow: TextOverflow.fade,
                //                       style: TextStyle(fontSize: 24),
                //                     ),
                //                     icon: Icons.attach_money,
                //                     color: Colors.black12,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             // 2nd Raw
                //             Flex(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               direction: Axis.horizontal,
                //               children: [
                //                 Expanded(
                //                   flex: 1,
                //                   child: Column(
                //                     children: [
                //                       Card(
                //                         shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(16.0)),
                //                         color: Colors.white,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(0.0),
                //                           child: Container(
                //                             decoration: BoxDecoration(
                //                                 borderRadius:
                //                                     BorderRadius.circular(16.0),
                //                                 gradient: LinearGradient(
                //                                     tileMode: TileMode.clamp,
                //                                     begin: Alignment.topCenter,
                //                                     end: Alignment.bottomCenter,
                //                                     colors: [
                //                                       Colors.yellowAccent,
                //                                       Colors.greenAccent,
                //                                     ],
                //                                     transform:
                //                                         GradientRotation(10.0))),
                //                             height: 80,
                //                             width: 300,
                //                             child: Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.spaceBetween,
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.center,
                //                               children: [
                //                                 Text(
                //                                   '  data',
                //                                   style: TextStyle(
                //                                       fontSize: 20,
                //                                       fontWeight: FontWeight.bold),
                //                                   overflow: TextOverflow.fade,
                //                                 ),
                //                                 Icon(Icons.import_contacts_sharp),
                //                                 Text(
                //                                   '1365  ',
                //                                   style: TextStyle(
                //                                       fontSize: 15,
                //                                       fontWeight: FontWeight.bold),
                //                                   overflow: TextOverflow.fade,
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       Card(
                //                         shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(16.0)),
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(0.0),
                //                           child: Container(
                //                             decoration: BoxDecoration(
                //                                 borderRadius:
                //                                     BorderRadius.circular(16.0),
                //                                 gradient: LinearGradient(
                //                                   begin: Alignment.topCenter,
                //                                   end: Alignment.bottomCenter,
                //                                   colors: [
                //                                     Colors.blue,
                //                                     Colors.green
                //                                   ],
                //                                   transform: GradientRotation(20.0)
                //                                 )
                //                             ),
                //                             height: 80,
                //                             width: 300,
                //                             child: Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.spaceBetween,
                //                               children: [
                //                                 Text(
                //                                   '  data',
                //                                   style: TextStyle(
                //                                       fontSize: 20,
                //                                       fontWeight: FontWeight.bold),
                //                                   overflow: TextOverflow.fade,
                //                                 ),
                //                                 Icon(Icons.import_contacts_sharp),
                //                                 Text(
                //                                   '1365  ',
                //                                   style: TextStyle(
                //                                       fontSize: 15,
                //                                       fontWeight: FontWeight.bold),
                //                                   overflow: TextOverflow.fade,
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 2,
                //                   child: Card(
                //                     shape: RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.circular(16.0)),
                //                     color: Colors.white38,
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(16.0),
                //                       child: Container(
                //                         height: 120,
                //                         width: 300,
                //                         child: Column(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.start,
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.spaceBetween,
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 Text('Current Memory Card'),
                //                                 Icon(Icons.line_weight_sharp),
                //                               ],
                //                             ),
                //                             Expanded(
                //                               child: LineChart(
                //                                 LineChartData(
                //                                   lineTouchData: LineTouchData(
                //                                     touchTooltipData:
                //                                         LineTouchTooltipData(
                //                                       tooltipBgColor: Colors
                //                                           .deepOrange, // Customize tooltip background color
                //                                     ),
                //                                     handleBuiltInTouches:
                //                                         true, // Enable built-in touch gestures
                //                                   ),
                //                                   gridData: FlGridData(
                //                                     show: true,
                //                                     drawHorizontalLine: true,
                //                                     drawVerticalLine: true,
                //                                     horizontalInterval: 1,
                //                                     verticalInterval: 1,
                //                                   ),
                //                                   titlesData: FlTitlesData(
                //                                     leftTitles: AxisTitles(
                //                                         sideTitles: SideTitles(
                //                                             showTitles: true)),
                //                                     bottomTitles: AxisTitles(
                //                                         sideTitles: SideTitles(
                //                                             showTitles: true)),
                //                                   ),
                //                                   borderData: FlBorderData(
                //                                     show: true,
                //                                     border: Border.all(
                //                                         color: Colors.black,
                //                                         width: 1.0),
                //                                   ),
                //                                   lineBarsData: [
                //                                     LineChartBarData(
                //                                       spots: [
                //                                         FlSpot(0, 2),
                //                                         FlSpot(2, 3),
                //                                         FlSpot(4, 2.5),
                //                                         FlSpot(6, 5),
                //                                         FlSpot(8, 7),
                //                                         FlSpot(10, 9.5),
                //
                //                                         // Add more data points here
                //                                       ],
                //                                       isCurved: true,
                //                                       color: Colors.red,
                //                                       dotData:
                //                                           FlDotData(show: false),
                //                                       belowBarData:
                //                                           BarAreaData(show: false),
                //                                     ),
                //                                   ],
                //                                   minX: 0,
                //                                   maxX: 14,
                //                                   minY: 0,
                //                                   maxY: 6,
                //                                 ),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //             // 3rd Row
                //             Flex(
                //               direction: Axis.horizontal,
                //               children: [
                //                 Expanded(
                //                   flex: 1,
                //                   child: Column(
                //                     children: [
                //                       Card(
                //                         shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(16.0)),
                //                         color: Colors.blueGrey,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(16.0),
                //                           child: Container(
                //                               height: 120,
                //                               width: 120,
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                 children: [
                //                                   Icon(Icons.cloud),
                //                                   Text('User')
                //                                 ],
                //                               )),
                //                         ),
                //                       ),
                //                       Card(
                //                         shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(16.0)),
                //                         color: Colors.yellowAccent,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(16.0),
                //                           child: Container(
                //                               height: 120,
                //                               width: 120,
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                 children: [
                //                                   Icon(Icons.cloud),
                //                                   Text('User')
                //                                 ],
                //                               )),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 1,
                //                   child: Column(
                //                     children: [
                //                       Card(
                //                         shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(16.0)),
                //                         color: Colors.greenAccent,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(16.0),
                //                           child: Container(
                //                               height: 120,
                //                               width: 120,
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                 children: [
                //                                   Icon(Icons.cloud),
                //                                   Text('User')
                //                                 ],
                //                               )),
                //                         ),
                //                       ),
                //                       Card(
                //                         shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(16.0)),
                //                         color: Colors.red,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(16.0),
                //                           child: Container(
                //                               height: 120,
                //                               width: 120,
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                 children: [
                //                                   Icon(Icons.cloud),
                //                                   Text('User')
                //                                 ],
                //                               )),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 2,
                //                   child: Card(
                //                     shape: RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.circular(16.0)),
                //                     color: Colors.white38,
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(16.0),
                //                       child: Container(
                //                         height: 250,
                //                           width: 250,
                //                           child: Column(
                //                             mainAxisAlignment: MainAxisAlignment.start,
                //                             crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                          Row(
                //                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                            crossAxisAlignment: CrossAxisAlignment.start,
                //                            children: [
                //                              Text('Current Status'),
                //                              Flexible(child: Icon(Icons.line_axis)),
                //                            ],
                //                          ),
                //                           Expanded(
                //                             child: PieChart(
                //                               PieChartData(
                //                                 sections: [
                //                                   PieChartSectionData(
                //                                     color: Colors.blue, // Color of the pie section
                //                                     value: 45, // Value of the section
                //                                     title: '45%', // Title text (optional)
                //                                     radius: 60, // Adjust the radius to make it half
                //                                   ),
                //                                   PieChartSectionData(
                //                                     color: Colors.red, // Color of the pie section
                //                                     value: 55, // Value of the section
                //                                     title: '55%', // Title text (optional)
                //                                     radius: 60, // Adjust the radius to make it half
                //                                   ),
                //                                 ],
                //                                 borderData: FlBorderData(show: false), // Hide the border
                //                                 sectionsSpace: 0, // Remove spacing between sections
                //                                 centerSpaceRadius: 40, // Adjust the hole size in the center
                //                                 startDegreeOffset: 90, // Rotate the chart to make it a half pie
                //                               ),
                //                             ),
                //                           ),
                //                           Row(
                //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                             crossAxisAlignment: CrossAxisAlignment.start,
                //                             children: [
                //                               Icon( Symbols.settings,
                //                                 fill: 1, weight: 700, grade: 0.25, opticalSize: 48 ,color: Colors.blueAccent,),
                //                               Icon( Symbols.sd_card,
                //                                 fill: 1, weight: 700, grade: 0.25, opticalSize: 48 ,color: Colors.red,),
                //                             ],
                //                           )
                //                          ],
                //                       )
                //
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 2,
                //                   child: Card(
                //                     shape: RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.circular(16.0)),
                //                     color: Colors.white38,
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(16.0),
                //                       child: Container(
                //                           height: 250,
                //                           width: 250,
                //                           child: Column(
                //                             mainAxisAlignment: MainAxisAlignment.start,
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Row(
                //                             crossAxisAlignment: CrossAxisAlignment.start,
                //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Text('Cloud Storage'),
                //                               Flexible(child: Icon(Icons.line_weight)),
                //                             ],
                //                           ),
                //                           Center(
                //                             child: Image(
                //                               image: AssetImage('assets/cloud.png'),
                //                               height: 150,
                //                               width: 150,
                //                             ),
                //                           ),
                //                           SizedBox(
                //                             height: 50,
                //                           ),
                //                           Row(
                //                             crossAxisAlignment: CrossAxisAlignment.start,
                //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Text('45 / 320GB'),
                //                               Flexible(child: Icon(Icons.sd_storage_outlined)),
                //                             ],
                //                           ),
                //                         ],
                //                       )),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             )
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
            ]
              );
            }
          }),
        ),
      );
  }
  Container user_details_form() {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.lightGreen,
       image:DecorationImage(
         image: AssetImage('assets/Mamun.jpeg'),
         fit: BoxFit.fill,
         colorFilter: ColorFilter.mode(Colors.white54.withOpacity(0.2), BlendMode.srcOver,)
       ) ,
      ),
      child: Column(
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
            color: Colors.white54,
              nameController: nameController,
              labelText: "Name",
              icon: Icon(Icons.verified_user),
              obscureText: false,
              hintText: 'Enter your name'),
          TextContainer(
            color: Colors.white54,
              nameController: ageController,
              labelText: "Age",
              icon: Icon(Icons.numbers),
              obscureText: false,
              hintText: 'Enter your age'),
          TextContainer(
            color: Colors.white54,
              nameController: addressController,
              labelText: 'Enter Your Address',
              icon: Icon(Icons.ice_skating_sharp),
              obscureText: false,
              hintText: 'gfd'),
          TextContainer(
            color: Colors.white54,
              nameController: phoneController,
              labelText: 'Enter Your Phone Num',
              icon: Icon(Icons.ice_skating_sharp),
              obscureText: false,
              hintText: '017456'),
          TextContainer(
              nameController: amountController,
              labelText: 'Enter Your Total Balance',
              icon: Icon(CupertinoIcons.money_dollar),
              obscureText: false,
              hintText: '200\$',
              color: Colors.white54),
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
      ),
    );
  }
}
