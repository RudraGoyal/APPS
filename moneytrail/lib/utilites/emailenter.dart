import 'package:flutter/material.dart';
import 'package:moneytrail/services/controllers/auth.dart';
import 'package:moneytrail/utilites/colors.dart';
import 'package:provider/provider.dart';

class text_button extends StatefulWidget {
  text_button({
    required this.hinttext,
  });
  final String hinttext;

  @override
  State<text_button> createState() => _text_buttonState();
}

class _text_buttonState extends State<text_button> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Container(
      decoration: BoxDecoration(
        color: BrandColors.white,
        borderRadius: BorderRadius.circular(34),
        border: Border.all(width: 2, color: BrandColors.purple_blue),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Form(
          key: _formKey,
          child: TextFormField(
            
            decoration: InputDecoration(
                border: InputBorder.none, hintText: widget.hinttext),
            validator: (val) => val == null || val.isEmpty || !val.contains("@")
                ? 'Enter a valid Email'
                : null,
            onChanged: (val) {
              if (_formKey.currentState!.validate()) {
                setState(() => _authService.setEmail(val));
              }
            },
          ),
        ),
      ),
    );
  }
}
