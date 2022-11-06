import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hint;
  final Function? onTap;
  final Color? color;
  final BoxShadow? boxShadow;

  CustomSearchBar({
    this.hint,
    this.onTap,
    this.color,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
      decoration: BoxDecoration(
        boxShadow: [
          boxShadow ?? BoxShadow(color: Theme.of(context).cardColor),
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: color ?? Theme.of(context).cardColor,
      ),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        cursorColor: kMainColor,
        readOnly: true,
        decoration: InputDecoration(
          icon: ImageIcon(
            AssetImage('assets/Icons/ic_search.png'),
            color: Theme.of(context).secondaryHeaderColor,
            size: 16,
          ),
          hintText: hint,
          hintStyle:
              Theme.of(context).textTheme.headline6!.copyWith(color: kHintColor),
          border: InputBorder.none,
        ),
        onTap: onTap as void Function()?,
      ),
    );
  }
}
