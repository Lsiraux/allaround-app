import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.isObscure = false,
    required this.controller,
    this.icon,
    required this.textInputAction,
    this.keyboardType,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.autofillHints,
    this.readOnly = false,
    this.onTap,
  });

  final String text;
  final bool isObscure;
  final TextEditingController controller;
  final Icon? icon;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Iterable<String>? autofillHints;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure;
  bool _isFieldInError = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;

    widget.controller.addListener(() {
      if (_isFieldInError && widget.controller.text.isNotEmpty) {
        setState(() {
          _isFieldInError = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      autofillHints: widget.autofillHints,

      // --- Wire through the new props ---
      readOnly: widget.readOnly,
      onTap: widget.onTap,

      decoration: InputDecoration(
        prefixIcon: widget.icon,
        suffixIcon:
            widget.isObscure
                ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
                : null,
        hintText: widget.text,
        labelStyle: TextStyle(
          color: _isFieldInError ? const Color(0xFFFF0033) : Colors.grey,
          fontSize: 12,
        ),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
      validator: (value) {
        final validationResult = widget.validator?.call(value);
        setState(() {
          _isFieldInError = validationResult != null;
        });
        return validationResult;
      },
    );
  }
}
