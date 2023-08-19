import 'package:flutter/material.dart';
import 'package:cn23_2_qualification/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  final String email;
  const ProfilePage({super.key, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromARGB(255, 247, 92, 92),
            ),
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Icon(
                Icons.person,
                size: 150, // Adjust the size as needed
              ),
            ),
          ),

          const SizedBox(height: 20),
          Text("Account ID : 4123080512338"),
          const SizedBox(height: 20),
          Text(widget.email),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate back to the login page
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
