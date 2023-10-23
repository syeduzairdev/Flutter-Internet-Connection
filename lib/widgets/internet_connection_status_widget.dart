import 'package:flutter/material.dart';

class InternetConnectionStatusWidget extends StatelessWidget {
  const InternetConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 100,
            color: Colors.red,
          ),
          Text("No Internet Connection",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Text("check your internet connection, then try again")
        ],
      ),
    );
  }
}
