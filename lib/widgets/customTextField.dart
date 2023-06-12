import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.onChanged,
      this.text,
      this.textType});

  String hint;
  String? text;
  TextInputType? textType;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: TextFormField(
          keyboardType: textType ?? TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "$hint Cant Be Empty";
            }
            return null;
          },
          onChanged: onChanged,
          obscureText: (hint.toLowerCase() == "password") ? true : false,
          style: const TextStyle(fontSize: 14, fontFamily: "MyFont-Medium"),
          initialValue: text ?? '',
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(fontFamily: "MyFont-Bold"),
            errorStyle: const TextStyle(fontFamily: "MyFont-Medium"),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            hintText: hint,
            hintStyle:
                const TextStyle(fontSize: 16, fontFamily: "MyFont-Medium"),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
