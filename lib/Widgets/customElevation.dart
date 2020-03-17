import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;
  final double height;

  CustomElevation({ @required this.child, @required this.height }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(this.height / 2)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF8CC9F8).withOpacity(.6),
            blurRadius: height / 7,
            offset: Offset(0, height / 8),
          )
        ]
      ),
      child: this.child,
    );
  }
}