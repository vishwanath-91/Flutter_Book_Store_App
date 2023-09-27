import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth/sign_in/sign_in_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  nextPage() async {
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      nextPage();
                      setState(() {});
                    },
                    child: const Text("logOut")),
              ],
            )
          ]),
    );
  }
}
