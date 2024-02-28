import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? inputType;
  final Widget? trailing;
  final bool isVisible;
  const InputField({super.key,
  this.label = "label name",
    this.icon,
    this.validator,
    this.controller,
    this.inputFormat,
    this.inputType,
    this.trailing,
    this.isVisible = false,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        inputFormatters: inputFormat,
        keyboardType: inputType,
        //Automatically validates without pressing the button
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isVisible,
        decoration: InputDecoration(

          label: Text(label),
          hintText: label,
          prefixIcon: Icon(icon),
          suffixIcon: trailing,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.3),
              width: 1.5
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: Colors.indigo.withOpacity(.4),
                width: 2.5
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: Colors.red.shade900,
                width: 1
            ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: Colors.red.shade900,
                width: 2
            ),
          ),


        ),
      ),
    );
  }
}
