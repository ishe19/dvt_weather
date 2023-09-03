import 'package:flutter/material.dart';

class ErrorWidgetText extends StatelessWidget {
  const ErrorWidgetText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Error: Failed to fetch data.", style: TextStyle(color: Colors.red),)
    );
  }
}