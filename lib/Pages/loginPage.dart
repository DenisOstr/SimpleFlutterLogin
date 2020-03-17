import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fresh_login/Widgets/customElevation.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool checkBoxValue = false;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFF9732AF), Color(0xFF1FA8F0)]
  ).createShader(Rect.fromLTWH(0.0, 0.0, 110.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.all(10.0),
      children: <Widget> [
        Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSans",
                        foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: "OpenSans",
                          ),
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          "Create your account.",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Color(0xFFE4504F),
                            fontFamily: "OpenSans",
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        suffixIcon: Icon(
                          Icons.account_circle,
                          // color: Color(0xFF63BEF6),
                        )
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: Icon(
                          Icons.lock_outline
                        )
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              checkBoxValue = value;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                        ),
                        SizedBox(width: 35.0),
                        Text(
                          "Forgot Password?",
                        )
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: CustomElevation(
                        height: 65.0,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),

                          color: Color(0xFF1669D3),
                          
                          padding: EdgeInsets.symmetric(horizontal: 90.0),

                          onPressed: () {

                          },
                          
                          child: Text(
                            "Login".toUpperCase(),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFFFFFFFF)
                            ),
                          ),
                        )
                      )
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: Text(
                        "Or login with",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF8D8D8E)
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SocButton(buttonColor: Color(0xFF1254AB), buttonIcon: FaIcon(FontAwesomeIcons.facebookF)),

                        SocButton(buttonColor: Color(0xFF0BAAFC), buttonIcon: FaIcon(FontAwesomeIcons.twitter)),
                        
                        SocButton(buttonColor: Color(0xFFF65A5B), buttonIcon: FaIcon(FontAwesomeIcons.googlePlusG)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.0),
        ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: orangeGradients,
                begin: Alignment.topLeft,
                end: Alignment.center,
              )
            ),
          ),
        )
      ]
    );
  }
}

const List<Color> orangeGradients = [
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    var w = size.width;
    var h = size.height;

    path.lineTo(w, h);

    var firstControlPoint = new Offset(0.0, 0.0);
    var firstEndPoint = new Offset(size.width / 7, size.height / 2);

    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(firstEndPoint.dx, firstEndPoint.dy, firstControlPoint.dx, firstControlPoint.dy);

    var secondControlPoint = Offset(size.width / 7, size.height / 5);
    var secondEndPoint = Offset(size.width, size.height);

    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.quadraticBezierTo(secondEndPoint.dx, secondEndPoint.dy, secondControlPoint.dx, secondControlPoint.dy);

    // var thirdControlPoint = Offset(size.width, 0);
    // var thirdEndPoint = Offset(size.width, size.height);

    // path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0.0, h);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SocButton extends StatelessWidget {
  final Color buttonColor;
  final FaIcon buttonIcon;

  const SocButton({
    Key key,
    this.buttonColor,
    this.buttonIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),

      // child: CustomElevation(
      //   height: 45.0,
      child: IconButton(
        icon: buttonIcon,

        color: Color(0xFFFFFFFFF),

        padding: EdgeInsets.symmetric(horizontal: 25.0),

        onPressed: () {

        },
      )
      // )
    );
  }
}