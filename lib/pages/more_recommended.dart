import 'package:flutter/material.dart';

class SeeRecommended extends StatefulWidget {
  const SeeRecommended({Key? key}) : super(key: key);

  @override
  State<SeeRecommended> createState() => _SeeRecommendedState();
}

class _SeeRecommendedState extends State<SeeRecommended> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
    );
  }
}
