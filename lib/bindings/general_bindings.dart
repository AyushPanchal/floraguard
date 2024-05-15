import 'package:flora_guard/data/repositories/plant_detail/plant_detail_repository.dart';
import 'package:flora_guard/data/repositories/predict/predict_repository.dart';
import 'package:flora_guard/data/repositories/user/user_repository.dart';
import 'package:get/get.dart';

import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(PredictRepository());
    Get.put(UserRepository());
    Get.put(PlantDetailRepository());
  }
}
