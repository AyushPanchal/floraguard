import 'package:flora_guard/features/predict/controller/plant_controller.dart';
import 'package:flora_guard/features/predict/controller/predict_controller.dart';
import 'package:flora_guard/features/predict/screen/predict_result_screen.dart';
import 'package:flora_guard/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class PredictScreen extends StatelessWidget {
  const PredictScreen({super.key, required this.plantType});

  final PlantType plantType;

  @override
  Widget build(BuildContext context) {
    final predictController = Get.put(PredictController());
    final plantController = Get.put(PlantController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Upload Disease Affected Image"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              Obx(
                () => RoundedContainer(
                  height: 208,
                  width: 208,
                  backgroundColor: Colors.black,
                  showBorder: true,
                  child: predictController.imageFile.value != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image(
                            image:
                                FileImage(predictController.imageFile.value!),
                          ),
                        )
                      : Center(
                          child: Text(
                            "Please Select an Image",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: TColors.light),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Obx(
                () => predictController.imageSelected.value
                    ? Container()
                    : Text(
                        "Please select an image to continue",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.red),
                      ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    if (plantType == PlantType.cashew) {
                      await predictController.getImagePredictCashew();
                    } else if (plantType == PlantType.cassava) {
                      predictController.getImagePredictCassava();
                    } else if (plantType == PlantType.maize) {
                      predictController.getImagePredictMaize();
                    } else {
                      predictController.getImagePredictTomato();
                    }
                  },
                  child: const Text("Select Image"),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => PredictResultScreen(
                        plantType: plantType,
                      ),
                    );
                  },
                  child: const Text("Make Prediction"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
