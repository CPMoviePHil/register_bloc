import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/utils/screens/screensUtils.dart';

class Download extends StatefulWidget {
  Download({Key key}) : super(key: key);

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(156, 163, 173, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              AppElevatedButton(
                buttonText: "Download!",
                onPressed: () {

                },
                onLongPress: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
