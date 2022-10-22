import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({ required this.title,Key? key}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,),
      ),
      body: Center(
        child: Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
