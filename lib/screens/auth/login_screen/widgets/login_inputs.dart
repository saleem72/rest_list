//

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/localization/language_constants.dart';
import '../../../../widgets/main_widgets.dart';
import 'login_password_section.dart';
import 'login_email_section.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({
    Key? key,
    required FocusNode emailFocusNode,
    required FocusNode passwordFocusNode,
  })  : _emailFocusNode = emailFocusNode,
        _passwordFocusNode = passwordFocusNode,
        super(key: key);

  final FocusNode _emailFocusNode;
  final FocusNode _passwordFocusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        LoginEmailSection(emailFocusNode: _emailFocusNode),
        const SizedBox(height: 8),
        LoginPasswordSection(passwordFocusNode: _passwordFocusNode),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              // fillColor: MaterialStateProperty.resolveWith(getColor),
              value: false,
              onChanged: (bool? value) {},
            ),
            Text(
              'Remember Me',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
