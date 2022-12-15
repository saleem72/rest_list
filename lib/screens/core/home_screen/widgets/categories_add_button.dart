//

import 'package:flutter/material.dart';

class CategoriesAddButton extends StatelessWidget {
  const CategoriesAddButton({
    super.key,
    required this.onTap,
  });
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor, // Color(0xFFE7A968),E7A968
          size: 16,
        ),
      ),
    );
  }
}
