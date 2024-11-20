import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 160,
        color: Colors.black,
        child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(right: 24, bottom: 24),
            child: Text(
              text,
              maxLines: 1,
              style: const TextStyle(color: Colors.white, fontSize: 60),
            )));
  }
}
