
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';
import '../TextContainer.dart';
import '../service/firestore_service.dart';
import 'dashboard2.dart';
import 'package:firebase_setup/dashboard/components/dashboardContainer.dart';
import 'dashboard2.dart';

class Dashboard extends StatefulWidget {
  static const String id = 'dashboard';

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();
  FirestoreService firestoreService = FirestoreService();
  bool isDataExistForCurrentUser = false;
  Map<String, dynamic> data = {};

  setStateIfDataExist() async {
    var currentUser = context.read<FirebaseAuthMethods>().user;
    var docs = await firestoreService.getDocuments(currentUser.uid);
    if (docs.isNotEmpty) {
      setState(() {
        data = docs.first;
      });
      setState(() {
        isDataExistForCurrentUser = true;
      });
    }
  }

  void saveData() async {
    var currentUser = context.read<FirebaseAuthMethods>().user;
    //save data to firebase
    await firestoreService.addProfileData(currentUser.uid, {
      'name': nameController.value.text,
      'age': ageController.value.text,
      'address':adressController.value.text,
      'phonenum':phonenumController.value.text
    });
  }
  @override
  void initState() {
    super.initState();
    setStateIfDataExist();
  }


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
            if (!isDataExistForCurrentUser) {
              return user_details_form();
            }
            else
            return SafeArea(
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              '${auth.user.email}'+'\n'
                                  'Name: ${data['name']},'+'\n'
                                  'Age: ${data['age']}',
                              style: TextStyle(fontSize: 24),
                            ),
                            icon: Icons.attach_money,
                            color: Colors.deepOrange,

                          ),
                        ),
                        Expanded(
                            child: dashboardContainer(
                          text: Text(
                            'TotalAmount',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          bottomText: Text(
                            '\$1000.00'+'\n'
                                'Address: ${data['address']}'+'\n'
                                'phonenum: ${data['phonenum']}',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          icon: Icons.cabin,
                          color: Colors.deepPurple,

                        )),
                        Expanded(
                          child: dashboardContainer(
                            text: Text(
                              'MY amount',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            bottomText: Text(
                              '\$1000.00',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            icon: Icons.ice_skating,
                            color: Colors.deepPurpleAccent,

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
                            Map<String, String> data = {
                              "id": "1",
                              "Name": "Boss",
                              'roll':'65812'
                            };
                            FirebaseFirestore.instance
                                .collection('info')
                                .add(data)
                                .then((value) => {debugPrint('data$value')});
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
                  Center(
                    child: ElevatedButton(
                        onPressed: (){
                          context.read<FirebaseAuthMethods>().signOut(context);
                        },
                        child: Text('LogOut')),
                  )
                ],
              ),
            );
          }),
        ]));
  }
  Column user_details_form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('Give Your Information',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Color(0xff4f378b)),)),
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
            nameController: adressController,
            labelText: 'Enter Your Address',
            icon:Icon(Icons.ice_skating_sharp),
            obscureText: false,
            hintText: 'gfd'),
        TextContainer(
            nameController: phonenumController,
            labelText: 'Enter Your Phone Num',
            icon: Icon(Icons.ice_skating_sharp),
            obscureText: false,
            hintText: '017456'),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: (){
              saveData();
             setStateIfDataExist();
        }, child: Text('submit'))
      ],
    );
  }
}
