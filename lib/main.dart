import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setup/login%20screen/login.dart';
import 'package:firebase_setup/service/firebase_auth_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login screen/dashboard.dart';
import 'registration Screen/registration.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAdNmUAmK53LGu7APDgP4DWSUamkHuyj88", appId:"1:734812578241:web:44c933d6a098491b91cf40", messagingSenderId: "734812578241", projectId: "firebsesetup"));

  }
  await Firebase.initializeApp();
  runApp( MultiProvider(
    providers: [
      Provider<FirebaseAuthMethods>(
        create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) => context.read<FirebaseAuthMethods>().authState,
        initialData: null,
      ),
    ],
    child: const MainApp(),
  ),

  );
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:login.id,
      routes: {
        login.id:(context)=>login(),
        registration.id:(context)=>registration(),
        dashboard.id:(context)=>dashboard(),
      },
    );
  }
}
