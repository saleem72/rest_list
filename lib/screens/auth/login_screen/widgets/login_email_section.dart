//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/localization/language_constants.dart';
import '../../../../widgets/main_widgets.dart';
import '../login_bloc/login_bloc.dart';

class LoginEmailSection extends StatelessWidget {
  const LoginEmailSection({
    Key? key,
    required FocusNode emailFocusNode,
  })  : _emailFocusNode = emailFocusNode,
        super(key: key);

  final FocusNode _emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return LoginEMailInput(
          focusNode: _emailFocusNode,
          initialValue: state.email.value,
          hasError: state.email.invalid,
        );
      },
    );
  }
}

class LoginEMailInput extends StatelessWidget {
  const LoginEMailInput({
    Key? key,
    required this.focusNode,
    required this.initialValue,
    required this.hasError,
  }) : super(key: key);

  final FocusNode focusNode;
  final String initialValue;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return ValidatedTextField(
      focusNode: focusNode,
      initialValue: initialValue,
      label: Translator.translation(context).email,
      hint: Translator.translation(context).email_hint,
      hasError: hasError,
      errorMessage: Translator.translation(context).email_validation_error,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      onChange: (value) {
        context.read<LoginBloc>().add(LoginEmailChanged(email: value));
      },
    );
  }
}
