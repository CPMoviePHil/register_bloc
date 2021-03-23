import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;

  AppElevatedButton({
    Key key,
    this.buttonText,
    this.onPressed,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        padding: EdgeInsets.only(
          top: 0,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
          ),
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: Text(
            "$buttonText",
          ),
        ),
      ),
    );
  }
}