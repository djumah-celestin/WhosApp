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
  var confirdPwdController = TextEditingController();
  bool _isObscure1 = true;
    bool _isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: _height,
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
      height: heigth / 3.5,
      width: width,
      decoration: BoxDecoration(
        color: Colors.purple[400],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/whitemsg.png"),
                fit: BoxFit.fill,
              ),
              color: Colors.purple[400],
            ),
            height: heigth / 4,
            width: width / 2,
          ),
        ],
      ),
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
          Text(
            "Inscrivez - vous",
            style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: heigth / 35),
          ),
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
            suffix: IconButton(
                icon:
                    Icon(_isObscure1 ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure1 = !_isObscure1;
                  });
                }),
            obscureText: _isObscure1,
            keybardType: TextInputType.visiblePassword,
            hint: 'Entrez votre mot de passe',
          ),
          _sizedBox(heigth / 25),
          CTextfiel(
            controller: confirdPwdController,
            inputAction: TextInputAction.done,
            prefix: Icon(Icons.vpn_key),
            suffix: IconButton(
                icon:
                    Icon(_isObscure2 ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure2 = !_isObscure2;
                  });
                }),
            obscureText: _isObscure2,
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
                  Text("Avez vous d??j?? un compte ?"),
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
