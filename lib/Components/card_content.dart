import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String? text;
  final AssetImage? image;

  CardContent({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Image(image: image!),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          flex: 2,
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    );
  }
}
