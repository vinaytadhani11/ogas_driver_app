import 'package:flutter/material.dart';

class NotApproved extends StatefulWidget {
  const NotApproved({Key? key}) : super(key: key);

  @override
  State<NotApproved> createState() => _NotApprovedState();
}

class _NotApprovedState extends State<NotApproved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('asset/wait.png'),
          SizedBox(height: 30),
          Text(
            'Please wait....🕚',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'We will approve your request soon!📋',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Come back for future updates👍',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
