import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  late String emailID;
  late String password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blue[100],
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            height: 250.0,
            width: 350.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: _password,
                  decoration: const InputDecoration(hintText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                    onPressed: () async {
                      emailID = _email.text;
                      password = _password.text;
                      final userCred = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailID, password: password);
                      print(
                          'Email ID -> $emailID and password is -> $password and the cred -> $userCred');
                    },
                    child: const Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
