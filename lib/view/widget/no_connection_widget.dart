import 'package:flutter/material.dart';

class NoConnectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.wifi_off,
            size: 75,
            color: Colors.grey.shade300,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'No Internet Connection\nPlease reconnect to internet.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
