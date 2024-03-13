import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/firebase_options.dart';
//import 'package:my_notes/views/loginview.dart';
// import 'package:my_notes/views/registerview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: HomePage(),
      )));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue[300],
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              final userCred = user?.emailVerified ?? false;
              if (userCred) {
                print("Email Verified!!!");
              } else {
                print("Verify your Email First!");
              }
              return const Text("Done...");
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}
