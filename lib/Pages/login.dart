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
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          width: _width,
          child: Stack(
            children: [
              Column(
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
      height: heigth / 3,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Connectez - vous",
            style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: heigth / 35),
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
            inputAction: TextInputAction.done,
            prefix: Icon(Icons.vpn_key),
            suffix: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            obscureText: _isObscure,
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
            height: heigth / 70,
          ),
          TextButton(
              onPressed: () async {
                await AuthServices()
                    .signIn(emailController.text, pwdController.text);
              },
              child: Text('Connexion',
                  style: TextStyle(fontSize: heigth / 25, color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: heigth / 10)))),
          SizedBox(height: heigth / 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                ),
              ),
              Text("Ou"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: heigth / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(heigth / 25)),
                child: CircleAvatar(
                  radius: heigth / 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/google2.jpg"),
                ),
              ),
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(heigth / 25)),
                child: CircleAvatar(
                  radius: heigth / 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/apple2.png"),
                ),
              ),
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(heigth / 25)),
                child: CircleAvatar(
                  radius: heigth / 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/facebook2.jpg"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: heigth / 40,
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
