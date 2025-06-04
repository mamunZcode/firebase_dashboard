import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Core/service/firebase_auth_methods.dart';

import 'Presentation/Screen/dashboardtwo/dashBoardTwo.dart';
import 'Presentation/Screen/login screen/login.dart';
import 'Presentation/Screen/newdashboard/newDashBoard.dart';
import 'Presentation/Screen/registration Screen/registration.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAdNmUAmK53LGu7APDgP4DWSUamkHuyj88",
            appId: "1:734812578241:web:44c933d6a098491b91cf40",
            messagingSenderId: "734812578241",
            projectId: "firebsesetup"));
  }
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child:  MainApp(),
    ),
  );

}

class MainApp extends StatelessWidget {
     MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
          primary:Colors.pink,
          secondary: Colors.red,
          tertiary:Colors.black,
      ),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute:login.id,
      home: const AuthWrapper(),
      routes: {
        login.id: (context) => const login(),
        Registration.id: (context) => const Registration(),
        // dashboard2.id: (context) => dashboard2(),
        DashboardTwo.id:(context) => DashboardTwo(),
        NewDashBoard.id:(context)=> const NewDashBoard(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    print('USER ${firebaseUser?.email}');

    if (firebaseUser != null) {
      return  const NewDashBoard();
    }
    return const login();
  }
}
