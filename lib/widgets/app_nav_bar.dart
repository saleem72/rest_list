//

import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    return Container(
      padding: EdgeInsets.only(top: height),
      height: 50 + height,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),

                // style: TextStyle(
                //   fontSize: 20,
                //   color: Colors.white,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
