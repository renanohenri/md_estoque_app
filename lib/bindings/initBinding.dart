import 'package:app/controllers/agendaController.dart';
import 'package:app/controllers/turmaController.dart';
import 'package:app/controllers/usuarioController.dart';
import 'package:get/get.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UsuarioController());
    Get.put(TurmaController());
    Get.put(AgendaController());
  }
}
