import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class AddressTypeButton extends StatelessWidget {
  final String? label;
  final String? image;
  final Function? onPressed;
  final bool? isSelected;
  final Color selectedColor = Colors.white;
  final Color unSelectedColor = Colors.black;

  AddressTypeButton({this.label, this.image, this.onPressed, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: isSelected! ? kMainColor : Theme.of(context).cardColor,
      ),
      onPressed: onPressed as void Function()?,
      icon: Image.asset(
        image!,
        scale: 3.5,
        color: isSelected! ? selectedColor : unSelectedColor,
      ),
      label: Text(
        label!,
        style: TextStyle(
          color: isSelected! ? selectedColor : unSelectedColor,
        ),
      ),
    );
  }
}
