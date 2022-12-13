//

import 'package:flutter/material.dart';

/*
  
*/
class ValidatedTextField extends StatelessWidget {
  const ValidatedTextField({
    Key? key,
    required this.focusNode,
    required this.initialValue,
    required this.hint,
    required this.hasError,
    required this.errorMessage,
    required this.label,
    required this.onChange,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final FocusNode focusNode;
  final String initialValue;
  final String hint;
  final bool hasError;
  final String label;
  final String errorMessage;
  final Function(String) onChange;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;

  /*
    /*
    TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: const InputDecoration(
        fillColor: Colors.black,
        label: Text('Email Address'),
      ),
    )
  */


  TextFormField(
          initialValue: state.password.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            helperText:
                '''Password should be at least 8 characters with at least one letter and number''',
            helperMaxLines: 2,
            labelText: 'Password',
            errorMaxLines: 2,
            errorText: state.password.invalid
                ? '''Password must be at least 8 characters and contain at least one letter and number'''
                : null,
          ),
          obscureText: true,
          onChanged: (value) {
            context.read<MyFormBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        )
  */

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          labelText: label,
          errorText: hasError ? errorMessage : null),
      keyboardType: keyboardType,
      onChanged: (value) => onChange(value),
      textInputAction: textInputAction,
    );
  }
}
