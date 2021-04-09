import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  static const double height = 48;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
