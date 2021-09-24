import 'package:flutter/material.dart';
import 'package:whosapp/Widgets/textfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _headContainer(_height, _width),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: _middleContainer(_height, _width),
            ),
          ],
        ),
      ),
    );
  }

  Container _headContainer(double heigth, double width) {
    return Container(
      height: heigth / 4,
      width: width,
      decoration: BoxDecoration(
          color: Colors.purple[400],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(heigth / 15),
              bottomRight: Radius.circular(heigth / 15))),
      child: Center(
          child: Text(
        "WhosApp Login",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: heigth / 22,
            color: Colors.white),
      )),
    );
  }

  Container _middleContainer(double heigth, double width) {
    return Container(
      height: heigth / 3,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CTextfiel(
            inputAction: TextInputAction.next,
            controller: emailController,
            prefix: Icon(Icons.email),
            keybardType: TextInputType.emailAddress,
            hint: 'Entrez votre email',
          ),
          _sizedBox(heigth / 25),
          CTextfiel(
            controller: pwdController,
            inputAction: TextInputAction.done,
            prefix: Icon(Icons.vpn_key),
            obscureText: true,
            keybardType: TextInputType.visiblePassword,
            hint: 'Entrez votre mot de passe',
          ),
        ],
      ),
    );
  }

  SizedBox _sizedBox(double heigth) {
    return SizedBox(
      height: heigth,
    );
  }
}
