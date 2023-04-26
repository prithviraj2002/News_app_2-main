import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/models/auth_service.dart';
import 'package:news_app_2/screens/signup-screen.dart';
import 'package:news_app_2/screens/tab_bar_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  late var authStatus = "";

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/login.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Cannot have empty value";
                    }
                  },
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Cannot have empty value";
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      if(_email.text.isNotEmpty && _password.text.isNotEmpty){
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text)
                            .then((value) => Navigator.of(context).pushNamed(TabBarScreen.routeName));
                      }
                    },
                    child: const Text("LOGIN", style: TextStyle(color: Colors.red),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New user?"),
                TextButton(
                    onPressed: () {
                  Navigator.of(context).pushNamed(SignUp.routeName);
                },
                    child: const Text("Sign up", style: TextStyle(color: Colors.red),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
