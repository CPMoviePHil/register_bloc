import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget{

  final String hintText;
  final String errorText;
  final int maxLines;

  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final GestureTapCallback onTap;

  AppTextField({
    Key key,
    this.hintText,
    this.errorText,
    this.maxLines = 1,

    this.textEditingController,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,

    this.onChanged,
    this.onSubmitted,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        focusNode: focusNode,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        onTap: onTap,
        keyboardType: keyboardType,
        controller: textEditingController,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 5.0,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}