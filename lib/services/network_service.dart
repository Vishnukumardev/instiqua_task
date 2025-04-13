import '../utils/path_provider.dart';

class NetworkService extends GetxService {
  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((statusList) async {
      if (statusList.isNotEmpty) {
        _getNetworkStatus(statusList.last);
      }
    });
  }

  void _getNetworkStatus(ConnectivityResult status) {
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      if (Get.isDialogOpen == true) {}
    } else {}
  }
}
