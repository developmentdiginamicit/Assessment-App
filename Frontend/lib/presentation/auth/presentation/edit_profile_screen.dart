import 'package:assessili_assement_app/presentation/auth/controller/auth_controller.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/base_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/assets_paths.dart';
import '../../base_widgets/base_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final authController = Get.put(AuthController());
  @override
  void initState() {
    // TODO: implement initState
    authController.getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(AppAssets.curvedContainer),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const  Text(
                              "Full Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            CustomButton(buttonText: "Logout",width: 100.w,height: 40.h,
                            onTap: () => authController.logout(),)
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          controller:
                              authController.registrationnameController.value,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          enableBorderColor: Colors.white,
                          focusBorderColor: Colors.purple,
                          // hintText: 'Enter your email',
                          border: 10.r,
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          "Email Address",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          controller:
                              authController.registrationemailController.value,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          enableBorderColor: Colors.white,
                          focusBorderColor: Colors.purple,
                          //hintText: 'Enter your email',
                          border: 10.r,
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          "School Name",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          controller:
                              authController.registrationschoolController.value,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          enableBorderColor: Colors.white,
                          focusBorderColor: Colors.purple,
                          //hintText: 'Enter your email',
                          border: 10.r,
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          "Board",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          controller:
                              authController.registrationboardController.value,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          enableBorderColor: Colors.white,
                          focusBorderColor: Colors.purple,
                          //hintText: 'Enter your email',
                          border: 10.r,
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Class",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomTextField(
                                    controller: authController
                                        .registrationclassController.value,
                                    keyboardType: TextInputType.emailAddress,
                                    style: const TextStyle(color: Colors.white),
                                    enableBorderColor: Colors.white,
                                    focusBorderColor: Colors.purple,
                                    //hintText: 'Enter your email',
                                    border: 10.r,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          "Guardian Contact (not mandatory)",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          controller: authController
                              .registrationguardianController.value,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          enableBorderColor: Colors.white,
                          focusBorderColor: Colors.purple,
                          //hintText: 'Enter your email',
                          border: 10.r,
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          "Phone Number",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50.h,
                              width: 80.w,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: '+91',
                                  dropdownColor: const Color(0xFF464748),
                                  items: <String>['+91', '+1', '+44']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                  iconEnabledColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: CustomTextField(
                              controller: authController
                                  .registrationphoneController.value,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(color: Colors.white),
                              enableBorderColor: Colors.white,
                              focusBorderColor: Colors.purple,
                              border: 10.r,
                              hintStyle: const TextStyle(color: Colors.grey),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const CustomButton(
                          buttonText: 'Save',
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height *
                      0.25, // Adjust the vertical position
                  left: MediaQuery.of(context).size.width * 0.5 - 60.r,
                  child: Center(
                      child: Image.asset(
                    AppAssets.defaultAvatar,
                    height: 120.h,
                    width: 120.h,
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
