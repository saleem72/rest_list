//

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rest_list/helpers/styling/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Assets.loginBackground),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              _content(context),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // Terms of Service       Privacy Policy
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Terms of Service'),
                  ),
                  const SizedBox(width: 48),
                  TextButton(
                    onPressed: () {},
                    child: Text('Privacy Policy'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _content(BuildContext context) {
    return SizedBox(
      width: 450,
      // color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logo(),
          _emailInput(context),
          _passwordInput(context),
          _rememberMeButton(context),
          const SizedBox(height: 48),
          _loginButton(context),
          const SizedBox(height: 8),
          _forgetPasswordButton(context)
        ],
      ),
    );
  }

  RichText _forgetPasswordButton(BuildContext context) {
    return RichText(
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
              ..onTap = () {
                print('reset password');
              },
          ),
        ],
      ),
    );
  }

  TextButton _loginButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      child: Text(
        'Login',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  Row _rememberMeButton(BuildContext context) {
    return Row(
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
    );
  }

  TextField _passwordInput(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: true,
      autocorrect: false,
      decoration: const InputDecoration(
        fillColor: Colors.black,
        label: Text('Password'),
      ),
    );
  }

  TextField _emailInput(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: const InputDecoration(
        fillColor: Colors.black,
        label: Text('Email Address'),
      ),
    );
  }

  SizedBox _logo() {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          const Spacer(),
          Image.asset(
            Assets.logo,
            fit: BoxFit.fitHeight,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
