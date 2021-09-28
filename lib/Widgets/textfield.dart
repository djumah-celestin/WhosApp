import 'package:flutter/material.dart';

class CTextfiel extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscureText;
  final TextInputType keybardType;
  final TextInputAction inputAction;
  const CTextfiel(
      {Key key,
      this.controller,
      this.hint,
      this.keybardType,
      this.suffix,
      this.inputAction,
      this.obscureText = false,
      this.prefix});
  @override
  _CTextfielState createState() => _CTextfielState();
}

class _CTextfielState extends State<CTextfiel> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      textInputAction: widget.inputAction,
      decoration: InputDecoration(
          hintText: widget.hint ?? '',
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          border: OutlineInputBorder(),
          filled: true),
      keyboardType: widget.keybardType,
    );
  }
}
