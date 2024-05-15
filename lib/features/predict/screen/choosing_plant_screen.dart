import 'package:flora_guard/common/widgets/appbar/appbar.dart';
import 'package:flora_guard/features/predict/controller/plant_controller.dart';
import 'package:flora_guard/features/predict/screen/predict_screen.dart';
import 'package:flora_guard/utils/constants/enums.dart';
import 'package:flora_guard/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ChoosingPlantScreen extends StatelessWidget {
  const ChoosingPlantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlantController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Choose the plant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const PredictScreen(plantType: PlantType.cashew),
                ),
                child: const Text("Cashew Plant"),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const PredictScreen(plantType: PlantType.cassava),
                ),
                child: const Text("Cassava(Sweet Potato) Plant"),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const PredictScreen(plantType: PlantType.maize),
                ),
                child: const Text("Corn(Maize) Plant"),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const PredictScreen(plantType: PlantType.tomato),
                ),
                child: const Text("Tomato Plant"),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        ),
      ),
    );
  }
}
