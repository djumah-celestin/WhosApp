import 'package:flutter/material.dart';
import 'package:whosapp/Configs/functions.dart';
import 'package:whosapp/Pages/register.dart';
import 'package:whosapp/Services/auth_services.dart';
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
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _headContainer(_height, _width),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: _middleContainer(_height, _width),
              ),
              _bottomContainer(_height, _width),
            ],
          ),
        ),
      ),
    );
  }

  Container _headContainer(double heigth, double width) {
    return Container(
      height: heigth / 3,
      width: width,
      decoration: BoxDecoration(
          color: Colors.purple[400],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(heigth / 15),
              bottomRight: Radius.circular(heigth / 15))),
      child: Center(
          child: Text(
        "WhosApp Connexion",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: heigth / 25,
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
          _sizedBox(heigth / 25),
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
            obscureText: false,
            keybardType: TextInputType.visiblePassword,
            hint: 'Entrez votre mot de passe',
          ),
        ],
      ),
    );
  }

  Container _bottomContainer(double heigth, double width) {
    return Container(
      height: heigth / 3,
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(Icons.face), Icon(Icons.g_translate)],
          ),
          SizedBox(
            height: heigth / 40,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Avez vous déjà un compte ?"),
                  SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      onPressed: () {
                        navigateToNextPage(context, Register());
                      },
                      child: Text("Inscription"))
                ],
              ),
              SizedBox(
                height: heigth / 40,
              ),
              TextButton(
                  onPressed: () async {
                    await AuthServices()
                        .signIn(emailController.text, pwdController.text);
                  },
                  child: Text('Connexion',
                      style: TextStyle(
                          fontSize: heigth / 25, color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: heigth / 10)))),
            ],
          )
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
