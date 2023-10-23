import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/services/internet_connection_services/network_manager.dart';
import 'package:internet_connection_checker/widgets/internet_connection_status_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final NetworkManager _networkManager = networkManager;

  @override
  void initState() {
    super.initState();
    _networkManager.initialize();
  }

  @override
  void dispose() {
    _networkManager.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6ae792),
      ),
      body: StreamBuilder<Map<ConnectivityResult, bool>>(
        stream: _networkManager.myStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text(
              'Loading...',
              style: TextStyle(fontSize: 54),
            );
          }
          final connectivityResult = snapshot.data?.keys.first;
          final isOnline = snapshot.data?.values.first;

          if (connectivityResult == ConnectivityResult.none ||
              connectivityResult == ConnectivityResult.other) {
            return const InternetConnectionStatusWidget();
          } else if (connectivityResult == ConnectivityResult.mobile ||
              connectivityResult == ConnectivityResult.wifi) {
            if (isOnline!) {
              return const Text("User is online");
            } else {
              return const Text(
                'Offline',
                style: TextStyle(fontSize: 54),
              );
            }
          }
          return const InternetConnectionStatusWidget();
        },
      ),
    );
  }
}
