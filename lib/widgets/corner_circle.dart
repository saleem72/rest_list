//

import 'package:flutter/material.dart';

import '../screens/auth/login_screen/models/login_constants.dart';

class CornerCircle extends StatelessWidget {
  const CornerCircle({
    Key? key,
    this.toBottom = false,
  }) : super(key: key);
  final bool toBottom;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double circleDiagnal = size.width * LoginConstants.cornerCircleRatio;
    return Transform.translate(
      offset: toBottom
          ? Offset(size.width * 0.5, size.height * 0.5)
          : Offset(-size.width * 0.5, -size.height * 0.5),
      child: Container(
        height: circleDiagnal,
        width: circleDiagnal,
        alignment: Alignment.center,
        child: Container(
          height: circleDiagnal,
          width: circleDiagnal,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
