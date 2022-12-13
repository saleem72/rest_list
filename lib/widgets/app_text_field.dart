//

import 'package:flutter/material.dart';

import '../helpers/app_theme/app_theme.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.onChange,
    this.onSubmit,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final Function(String)? onChange;
  final Function(String)? onSubmit;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool firstFocus = true;
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (value) {
        if (firstFocus) {
          setState(() {
            firstFocus = false;
          });
          return;
        }
        if (widget.onSubmit != null) {
          widget.onSubmit!(widget.controller.text);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        child: TextField(
          controller: widget.controller,
          onChanged: (value) {
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
          onSubmitted: (value) {
            if (widget.onSubmit != null) {
              widget.onSubmit!(value);
            }
          },
          onEditingComplete: () {
            if (widget.onSubmit != null) {
              print('textField submitted');
              widget.onSubmit!(widget.controller.text);
            }
          },
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                // color: Theme.of(context).colorScheme.primary,
                ),
            border: InputBorder.none,
            isCollapsed: true,
          ),
        ),
      ),
    );
  }
}
