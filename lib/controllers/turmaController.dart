import 'package:app/services/remote_services.dart';
import 'package:get/get.dart';

class TurmaController extends GetxController {
  var isLoadind = true.obs;
  var turmas = [].obs;

  @override
  void onInit() {
    getTurmas();
    super.onInit();
  }

  void getTurmas() async {
    try {
      isLoadind(true);
      var classe = await RemoteServices.getTurmas();
      if (classe != null) {
        for (var c in classe) {
          turmas.add(c);
          print(turmas);
        }
      }
    } finally {
      isLoadind(false);
    }
  }
}
