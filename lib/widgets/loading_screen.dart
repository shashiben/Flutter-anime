import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';

class LoadingScreen extends StatelessWidget {
  final String text;

  const LoadingScreen({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(text),
          ],
        ),
      ),
    );
  }
}
