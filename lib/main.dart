import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setup/login%20screen/login.dart';
import 'package:firebase_setup/login%20screen/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login screen/dashboard.dart';
import 'registration Screen/registration.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAdNmUAmK53LGu7APDgP4DWSUamkHuyj88", appId:"1:734812578241:web:44c933d6a098491b91cf40", messagingSenderId: "734812578241", projectId: "firebsesetup"));

  }
  await Firebase.initializeApp();
  runApp(const MainApp(
  )
  );
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: main_page(),
      
      // initialRoute:'/ reg',
      routes: {
        // '/ homepage':(context)=>homepage(),
        '/ login':(context)=>login(),
        // '/ dashboard':(context)=>dashboard(),
        '/ reg':(context)=>registration()
      },
    );
  }
}
