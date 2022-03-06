import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase9_12/pages/google_signin_page.dart';
import 'package:flutter_firebase9_12/pages/home_page.dart';
import 'package:flutter_firebase9_12/pages/show_contact_page.dart';
import 'package:flutter_firebase9_12/pages/signin_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong...!'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const ShowContactPage();
          } else {
            return const SignInPage();
          }
        },
      ),
    );
  }
}
