import 'package:flutter/material.dart';


class SuccessValidation extends StatelessWidget {
  const SuccessValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Validation succeed",style: TextStyle(
          fontSize: 25,
          color: Colors.green
        ),),
      ),
    );
  }
}
