/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/screens/signup/signup_controller.dart';
import 'package:helpdesk/widgets/boxedittext.dart';
import 'package:helpdesk/widgets/button.dart';
import 'package:helpdesk/widgets/multi_dropdown.dart';
import 'package:helpdesk/widgets/search_dropdown.dart';

class SignupScreen extends GetView<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('New Tenant'),
      ),
      body: Obx(
        () => Stack(
          children: [
            Stepper(
              type: StepperType.horizontal,
              currentStep: controller.activeStep.value,
              steps: [
                _firstStepForm(),
                _secondStepForm(),
              ],
              controlsBuilder: (_, details) {
                bool isSubmit = controller.activeStep.value == 1;
                return CustomButton(
                    buttonText: isSubmit ? 'Register' : 'Next',
                    onPressed: isSubmit
                        ? () => controller.submit()
                        : () => controller.nextPage());
              },
            ),
            controller.isLoading.value
                ? Container(
                    color: Colors.white60,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  _firstStepForm() {
    return Step(
        state: controller.activeStep.value == 0
            ? StepState.editing
            : StepState.complete,
        isActive: controller.activeStep.value == 0,
        title: const Text('User Detail'),
        content: Column(
          children: [
            BoxEditText(
              placeholder: 'First Name',
              controller: controller.fnameController,
            ),
            const SizedBox(
              height: 12,
            ),
            BoxEditText(
              placeholder: 'Last Name',
              controller: controller.lnameController,
            ),
            const SizedBox(
              height: 12,
            ),
            BoxEditText(
              placeholder: 'EmailID',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 12,
            ),
            BoxEditText(
              placeholder: 'Mobile No',
              controller: controller.mobileController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ),
            const SizedBox(
              height: 12,
            ),
            BoxEditText(
              placeholder: 'Password',
              controller: controller.passwordController,
              obsecureText: true,
            ),
            const SizedBox(
              height: 12,
            ),
            BoxEditText(
              placeholder: 'Confirm Password',
              controller: controller.cpasswordController,
              obsecureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ));
  }

  _secondStepForm() {
    return Step(
        state: controller.activeStep.value == 1
            ? StepState.editing
            : StepState.complete,
        isActive: controller.activeStep.value == 1,
        title: const Text('Mapping Company'),
        content: Column(
          children: [
            SearchDropDown(
                controller.companyList.value, controller.selectedCompany.value,
                prefix: const Icon(Icons.location_city),
                label: 'Company', onChanged: (val) {
              if (val != null && val != controller.selectedCompany.value) {
                controller.selectedCompany(val);
                controller.setupLocation();
              }
            }),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () => MultiDropDown(
                controller.selectedLocationList
                    .map((e) => e['LocationName'])
                    .toList(),
                prefix: const Icon(Icons.pin_drop_rounded),
                hint: 'Select Location',
                onTab: controller.locationList.isEmpty
                    ? null
                    : () => controller.showLocations(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () => MultiDropDown(
                controller.selectedBuildingList
                    .map((e) => e['BuildingName'])
                    .toList(),
                prefix: const Icon(Icons.location_city),
                hint: 'Select Building',
                onTab: controller.buildingList.isEmpty
                    ? null
                    : () => controller.showBuilding(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () => MultiDropDown(
                controller.selectedFloorList
                    .map((e) => e['FloorName'])
                    .toList(),
                prefix: const Icon(Icons.window),
                hint: 'Select Floor',
                onTab: controller.floorList.isEmpty
                    ? null
                    : () => controller.showFloor(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
*/
