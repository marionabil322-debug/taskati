import 'package:flutter/material.dart';

class AddTextFormField extends StatelessWidget {
  final String hintText;
  final int? maxline;
  final Widget? suffixIcon;
  final bool? readonly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const AddTextFormField({
    super.key,
    required this.hintText,
    this.maxline,
    this.suffixIcon,
    this.readonly,
    this.onTap,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readonly ?? false,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Required';
            }
            return null;
          },
      maxLines: maxline,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
      ),
    );
  }
}
