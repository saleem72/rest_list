//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../helpers/localization/language_constants.dart';
import '../login_bloc/login_bloc.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({super.key});
  /*
    TextButton(
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
    )
  */
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return TextButton(
          onPressed: state.status.isValidated
              ? () => context.read<LoginBloc>().add(LoginFormSubmitted())
              : null,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
            disabledForegroundColor: Colors.white,
          ),
          child: Text(
            Translator.translation(context).login,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        );
      },
    );
  }
}
