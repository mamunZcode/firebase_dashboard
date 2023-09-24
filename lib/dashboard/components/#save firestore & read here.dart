import 'package:firebase_setup/TextContainer.dart';
import 'package:firebase_setup/service/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/firebase_auth_methods.dart';

class UserDetailsForm extends StatefulWidget {
  static const id = 'user_details_form';

  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
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
      appBar: AppBar(
        title: Text('MyFrom'),
      ),
      body: Consumer<FirebaseAuthMethods>(builder: (context, auth, child) {
        if (!isDataExistForCurrentUser) {
          return user_details_form();
        } else {
          return Center(
              child: Column(
            children: [
              Text('Name : ${data['name']}'),
              Text('Age : ${data['age']}'),
              ElevatedButton(
                  onPressed: () {
                    context.read<FirebaseAuthMethods>().signOut(context);
                  },
                  child: Text('Logout'))
            ],
          ));
        }
      }),
    );
  }

  Column user_details_form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(onPressed: saveData, child: Text('Submit')),
      ],
    );
  }
}
