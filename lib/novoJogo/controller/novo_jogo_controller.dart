import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NovoJogoController extends GetxController {
  RxList jogadores = [].obs;
  late final storage;

  @override
  void onInit() async {
    super.onInit();
    storage = await SharedPreferences.getInstance();
    jogadores.value = await storage.getStringList('jogadores') ?? [];
  }
}
