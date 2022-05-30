import 'package:flutter/material.dart';

class LoadingInProgress extends StatelessWidget {
  final String message;

  const LoadingInProgress({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(
            color: Colors.white70,
          ),
          if (message.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.05,
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenSize.shortestSide * 0.05,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
