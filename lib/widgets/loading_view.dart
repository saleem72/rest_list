//

import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
    required this.isVisible,
  }) : super(key: key);
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return isVisible
        ? const Center(
            child: SizedBox(
              height: 75,
              width: 75,
              child: CircularProgressIndicator(),
            ),
          )
        : const SizedBox.shrink();
  }
}
