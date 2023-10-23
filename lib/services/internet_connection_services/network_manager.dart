import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/services/internet_connection_services/connectivity.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() => _instance;

  NetworkManager._internal();

  Map<ConnectivityResult, bool> _source = {ConnectivityResult.none: false};
  String string = '';
  late NetworkConnectivity _networkConnectivity;
  Stream<Map<ConnectivityResult, bool>>? myStream;

  void initialize() {
    _networkConnectivity = NetworkConnectivity.instance;
    _networkConnectivity.initialise();
    myStream = _networkConnectivity.myStream
        .map((event) => event as Map<ConnectivityResult, bool>);
    myStream?.listen(_updateConnectivity);
  }

  void _updateConnectivity(Map<ConnectivityResult, bool> source) {
    _source = source;
    print('source $_source');
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        string =
            _source.values.toList()[0] ? 'Mobile: Online' : 'Mobile: Offline';
        break;
      case ConnectivityResult.wifi:
        string = _source.values.toList()[0] ? 'WiFi: Online' : 'WiFi: Offline';
        break;
      case ConnectivityResult.none:
      default:
        string = 'Offline';
    }
  }

  void disposeStream() {
    _networkConnectivity.disposeStream();
  }
}

final networkManager = NetworkManager();
