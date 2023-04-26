import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/screens/login-screen.dart';
import 'package:news_app_2/screens/tab_bar_screen.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign-up-screen';
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

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
            Image.asset("assets/images/signup.png"),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _confirmpassword,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Confirm password",
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
                    onPressed: () async{
                      if(_email.text.isNotEmpty && _password.text.isNotEmpty && _confirmpassword.text == _password.text){
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text)
                            .then((value) => Navigator.of(context).pushNamed(TabBarScreen.routeName));
                      }
                    },
                    child: const Text("SIGN UP", style: TextStyle(color: Colors.red),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already signed up?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: const Text("Login", style: TextStyle(color: Colors.red),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
