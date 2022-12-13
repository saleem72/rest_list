//

import 'package:flutter/material.dart';

import '../helpers/styling/styling.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: height,
    );
  }
}
