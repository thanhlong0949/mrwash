import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final bool? isCollapsed;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final TextCapitalization? textCapitalization;
  final Color? imageColor;

  EntryField(
      {this.controller,
      this.label,
      this.image,
      this.initialValue,
      this.readOnly,
      this.keyboardType,
      this.maxLength,
      this.hint,
      this.border,
      this.maxLines,
      this.suffixIcon,
      this.onTap,
      this.textCapitalization,
      this.imageColor,
      this.prefixIcon,
      this.isCollapsed});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        cursorColor: kMainColor,
        onTap: onTap as void Function()?,
        autofocus: false,
        controller: controller,
        initialValue: initialValue,
        style: Theme.of(context).textTheme.caption,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        minLines: 1,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: label,
          prefixIcon: prefixIcon,
          labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 14,
              ),
          isCollapsed: isCollapsed ?? false,
          //alignLabelWithHint: true,
          hintText: hint,
          hintStyle: theme.textTheme.caption!
              .copyWith(color: theme.hintColor, fontSize: 14),
          border: border,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          counter: Offstage(),
          icon: (image != null)
              ? ImageIcon(
                  AssetImage(image!),
                  color: imageColor ?? theme.primaryColor,
                  size: 20.0,
                )
              : null,
        ),
      ),
    );
  }
}
