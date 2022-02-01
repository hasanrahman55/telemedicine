import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String details;
  const DetailsPage({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hee"),
      ),
      body: Container(
        child: Text(details),
      ),
    );
  }
}
