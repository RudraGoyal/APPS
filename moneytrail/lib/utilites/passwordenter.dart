import 'package:flutter/material.dart';
import 'package:moneytrail/utilites/colors.dart';
import 'package:provider/provider.dart';

import '../services/controllers/auth.dart';

class PasswordField extends StatefulWidget {
  PasswordField({
    required this.hinttext,
  });
  final String hinttext;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final _formKey = GlobalKey<FormState>();
  String password = '';
  String error = '';
  bool obscure = true;
  int toggle = 0;

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Container(
      decoration: BoxDecoration(
        color: BrandColors.white,
        borderRadius: BorderRadius.circular(34),
        border: Border.all(width: 2, color: BrandColors.purple_blue),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  // scrollPadding: EdgeInsets.all(20),
                  obscureText: obscure,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Password'),
                  validator: (value) => value == null || value.length < 6
                      ? 'Enter a password 6+ characters long'
                      : null,
                  onChanged: ((value) {
                    if (_formKey.currentState!.validate()) {
                      setState(() => _authService.setPassword(value));
                    }
                  }),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                obscure = !obscure;
              });
            }, //have to make a toggle fuction that changes
            //if(toggle is even){obscure text is true and
            //white eye while if toggle is odd obscure text is
            // fasle and eye white, add one to the integer with
            //each click or just use a toogle button}
            child: Container(
              height: 20,
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 0, 25, 8),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(34),
                  bottomRight: Radius.circular(34),
                ),
              ),
              child: Icon(obscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
              //IconData(0xf2ff, fontFamily: 'MaterialIcons')
            ),
          ),
        ],
      ),
    );
  }
}
