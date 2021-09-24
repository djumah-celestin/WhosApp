import 'package:flutter/material.dart';
import 'package:whosapp/Services/auth_services.dart';
import 'package:whosapp/Widgets/textfield.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();
  var pwdController = TextEditingController();
  var confirmpwdController = TextEditingController();
  var nameController = TextEditingController();

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
      height: heigth / 4,
      width: width,
      decoration: BoxDecoration(
          color: Colors.purple[400],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(heigth / 15),
              bottomRight: Radius.circular(heigth / 15))),
      child: Center(
          child: Text(
        "WhosApp Enrregistrement",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: heigth / 25,
            color: Colors.white),
      )),
    );
  }

  Container _middleContainer(double heigth, double width) {
    return Container(
      // height: heigth / 3,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _sizedBox(heigth / 25),
          CTextfiel(
            inputAction: TextInputAction.next,
            controller: nameController,
            prefix: Icon(Icons.border_color),
            keybardType: TextInputType.name,
            hint: 'Entrez votre nom',
          ),
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
            inputAction: TextInputAction.next,
            prefix: Icon(Icons.vpn_key),
            obscureText: true,
            keybardType: TextInputType.visiblePassword,
            hint: 'Entrez votre mot de passe',
          ),
          _sizedBox(heigth / 25),
          CTextfiel(
            controller: pwdController,
            inputAction: TextInputAction.done,
            prefix: Icon(Icons.vpn_key),
            obscureText: true,
            keybardType: TextInputType.visiblePassword,
            hint: 'Confirmez votre mot de passe',
          ),
        ],
      ),
    );
  }

  Container _bottomContainer(double heigth, double width) {
    return Container(
      // height: heigth / 3,
      width: width,
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [Icon(Icons.face), Icon(Icons.g_translate)],
          // ),
          SizedBox(
            height: 15.0,
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
                        Navigator.pop(context);
                      },
                      child: Text("Connexion"))
                ],
              ),
              TextButton(
                  onPressed: () async {
                    await AuthServices().signUp(nameController.text,
                        emailController.text, pwdController.text);
                    Navigator.pop(context);
                  },
                  child: Text('Inscription',
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
