import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/configs/configs.dart';

class AppNetworkImage extends StatelessWidget{

  final String path;
  AppNetworkImage({this.path});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${Config.domain}$path",
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}