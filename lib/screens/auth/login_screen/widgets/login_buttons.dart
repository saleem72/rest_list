//

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_submit_button.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    Key? key,
    required this.onResetPassword,
  }) : super(key: key);
  final Function onResetPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 32),
        const LoginSubmitButton(),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                ),
            children: [
              const TextSpan(text: 'Forgot your password? '),
              TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                text: 'Get help resetting',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => onResetPassword(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
