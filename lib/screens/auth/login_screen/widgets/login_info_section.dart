//

import 'package:flutter/material.dart';

import '../../../../helpers/localization/language_constants.dart';

class LoginInfoSection extends StatelessWidget {
  const LoginInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Translator.translation(context).login,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          Translator.translation(context).login,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                height: 1.3,
              ),
        ),
      ],
    );
  }
}
