import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../../../Core/service/firebase_auth_methods.dart';
import '../../../Core/service/firestore_service.dart';
import '../../Widget/TextContainer.dart';
class NewDashBoard extends StatefulWidget {
  static const String id = 'NewDashBoard';
  const NewDashBoard({super.key});

  @override
  State<NewDashBoard> createState() => _NewDashBoardState();
}

class _NewDashBoardState extends State<NewDashBoard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cellNumController = TextEditingController();
  FireStoreService fireStoreService = FireStoreService();
  Map<String, dynamic> data = {};
  Map<String, dynamic> data2 = {};
  bool isDataExistForCurrentUser = false;

  /// FireBase Setup
  setStateIfDataExists() async {
    var currentUser = context.read<FirebaseAuthMethods>().user;
    var docs = await fireStoreService.getDocuments(currentUser.uid);
    var addProfileData = docs.where((map) => map["doc_id"].contains("profile_data")).toList();
    var addPersonalData = docs.where((map) => map["doc_id"].contains("personal_data")).toList();
    if (docs.isNotEmpty) {
      setState(() {
        data = addProfileData.first;
        data2 = addPersonalData.first;
        isDataExistForCurrentUser = true;
      });
    }
  }

  void saveData() async {
    var currentUser = context.read<FirebaseAuthMethods>().user;
    await fireStoreService.addProfileData(currentUser.uid, {
      'name': nameController.value.text,
      'age': ageController.value.text,
    });
    await fireStoreService.addPersonalData(
        currentUser.uid, {'address': addressController.value.text, 'cellNum': cellNumController.value.text});
  }

  @override
  void initState() {
    // TODO: implement initState
    setStateIfDataExists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double customWidth = 150;
    // double screenWidth = MediaQuery.sizeOf(context).width;
    // double responsiveWidth = min(customWidth, screenWidth);
    ///continer widget
    final containerWidget = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:const DecorationImage(
              image: AssetImage('assets/Mamun.jpeg'),
              fit: BoxFit.fitWidth
          ),
          color: const Color(0xff673AB7),
      ),
      height: 200,
      width: MediaQuery.sizeOf(context).width,
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(shape: BoxShape.circle, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    ///here is data show
                    child: Text('Your Name is : ${data['name']}',style: const TextStyle(color: Color(0xffE0E0E0)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    /// here is data show
                    child: Text(' Age : ${data['age']}',style: const TextStyle(color: Color(0xffE0E0E0))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    final smallContainer = Container(
      decoration:  BoxDecoration(
        color:const Color(0xff26A69A),
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 150,
      width: 150,
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your Address is : ${data2['address']}',style:const TextStyle(color: Color(0xffE0E0E0))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your Cell is : ${data2['cellNum']}',style:const TextStyle(color: Color(0xffE0E0E0))),
          ),
        ],
      ),
    );
    return Scaffold(
        backgroundColor: const Color(0xff1E1E1E),
        appBar: AppBar(
          title: const Text(
            'DashBoard',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor:const Color(0xff1E1E2F),
        ),
        body: Consumer<FirebaseAuthMethods>(builder: (context, auth, child) {
          if(!isDataExistForCurrentUser){
            return userDetailsForm();
          }
          else{
            return
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding:const EdgeInsets.all(10), child: containerWidget),

                    ///three container
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding:const EdgeInsets.all(10), child: smallContainer),
                          Padding(padding:const EdgeInsets.all(10), child: smallContainer),
                          Padding(padding:const EdgeInsets.all(10), child: smallContainer),
                        ],
                      ),
                    ),

                    ///pie-chart
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      color: Color(0xff26A69A),
                                      value: 45,
                                      title: '45%',
                                      radius: 60,
                                    ),
                                    PieChartSectionData(
                                      color: Color(0xff27AE60),
                                      value: 55,
                                      title: '30%',
                                      radius: 60,
                                    ),
                                    PieChartSectionData(
                                      color: Colors.orange,
                                      value: 55,
                                      title: '25%',
                                      radius: 60,
                                    ),
                                  ],
                                  borderData: FlBorderData(show: false), // Hide the border
                                  sectionsSpace: 0, // Remove spacing between sections
                                  centerSpaceRadius: 40, // Adjust the hole size in the center
                                  startDegreeOffset: 90, // Rotate the chart to make it a half pie
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding:const EdgeInsets.only(left: 10, bottom: 15, top: 20, right: 10), child: smallContainer),
                          Padding(
                              padding:const EdgeInsets.only(left: 10, bottom: 15, top: 20, right: 10), child: smallContainer),
                        ],
                      ),
                    ),

                    ///                     Google map  integration                   ///
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(image: AssetImage('assets/map.jpg')),
                    ),

                    ///LogOut
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: const Color(0xffE74C3C),
                            onPressed: (){
                          context.read<FirebaseAuthMethods>().signOut(context);
                        }, child: const Text("LogOut")),
                      ),
                    ),
                  ],
                ),
              );
          }
        }));
  }

  Container userDetailsForm() {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.lightGreen,
        image: DecorationImage(
            image: const AssetImage('assets/Mamun.jpeg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.white54.withOpacity(0.2),
              BlendMode.srcOver,
            )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            'Give Your Information',
            style: TextStyle(
                fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Color(0xff4f378b)),
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
              icon: const Icon(Icons.numbers),
              obscureText: false,
              hintText: 'Enter your age'),
          TextContainer(
              color: Colors.white54,
              nameController: addressController,
              labelText: 'Enter Your Address',
              icon: const Icon(Icons.ice_skating_sharp),
              obscureText: false,
              hintText: 'gfd'),
          TextContainer(
              color: Colors.white54,
              nameController: cellNumController,
              labelText: 'Enter Your Cell Num',
              icon: const Icon(Icons.ice_skating_sharp),
              obscureText: false,
              hintText: '+8801...'),
         const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () {
                saveData();
                setStateIfDataExists();
              },
              child:const Text('submit')),
         const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
