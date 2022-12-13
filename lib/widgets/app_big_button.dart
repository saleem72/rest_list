//

import 'package:flutter/material.dart';

import '../helpers/app_theme/app_theme.dart';

class AppBigButton extends StatelessWidget {
  const AppBigButton({
    Key? key,
    this.foregroundColor = Colors.white,
    this.backgroundColor = AppTheme.primary,
    required this.onPressed,
    required this.label,
  }) : super(key: key);
  final Color foregroundColor;
  final Color backgroundColor;
  final Function onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        fixedSize: const Size.fromHeight(50),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: foregroundColor,
            ),
      ),
    );
  }
}
