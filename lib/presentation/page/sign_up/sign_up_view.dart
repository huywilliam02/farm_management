// import 'package:agritour/app/widgets/components/form_field_widget.dart';
// import 'package:agritour/app/modules/sign-up/controllers/sign_up_controller.dart';
// import 'package:agritour/app/widgets/resources/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../base/base_view.dart';

// class SignUpView extends BaseView<SignUpController> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController fullnameController = TextEditingController();
//   @override
//   Widget buildView(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorConstant.common_bg_dark,
//         title: const Text(
//           // LocaleKeys.sign_up_view_text_sign_up_appbar.tr,
//           "Đăng ký",
//         ),
//       ),
//       body: Obx(
//         () => controller.isLoading.isTrue
//             ? const Center(
//                 child: CircularProgressIndicator(
//                 color: Colors.green,
//               ))
//             : SafeArea(
//                 child: Container(
//                   margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
//                   width: context.width,
//                   height: context.height,
//                   child: SingleChildScrollView(
//                     child: Form(
//                       child: Column(
//                         children: [
//                           const Center(
//                             child: Image(
//                               image:
//                                   AssetImage("assets/logo/logo.png"),
//                               height: 100,
//                               width: 100,
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             // LocaleKeys.sign_up_view_text_sign_up_appbar.tr,
//                             "Đăng ký",
//                             style: TextStyleConstant.black22RobotoBold,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Obx(
//                             () => FormFieldWidget(
//                                 // initValue: controller.nameInput.value,
//                                 controllerEditting: usernameController,
//                                 textInputType: TextInputType.text,
//                                 icon: const Icon(Icons.person),
//                                 labelText: "Tên",
//                                 errorText: controller.erruserNameInput.value,
//                                 setValueFunc: controller.setNameInput),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           Obx(
//                             () => FormFieldWidget(
//                                 // initValue: controller.email.value,
//                                 controllerEditting: fullnameController,
//                                 textInputType: TextInputType.text,
//                                 icon: const Icon(Icons.mail),
//                                 labelText: "Họ và tên",
//                                 errorText: controller.errfullnameInput.value,
//                                 setValueFunc: controller.setEmailInput),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           Obx(
//                             () => FormFieldWidget(
//                                 enableInteractiveSelection: false,
//                                 isObscureText: controller.checkpassword.value,
//                                 suffixIcon: IconButton(
//                                   icon: Icon(controller.checkpassword.value
//                                       ? Icons.visibility_off
//                                       : Icons.visibility),
//                                   onPressed: () {
//                                     controller.checkpassword.value =
//                                         !controller.checkpassword.value;
//                                   },
//                                 ),
//                                 textInputType: TextInputType.text,
//                                 icon: const Icon(Icons.lock),
//                                 labelText: "Mật khẩu",
//                                 errorText: controller.errPasswordInput.value,
//                                 setValueFunc: controller.setPasswordInput),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           Obx(
//                             () => FormFieldWidget(
//                                 enableInteractiveSelection: false,
//                                 isObscureText: controller.checkpassword.value,
//                                 suffixIcon: IconButton(
//                                   icon: Icon(controller.checkpassword.value
//                                       ? Icons.visibility_off
//                                       : Icons.visibility),
//                                   onPressed: () {
//                                     controller.checkpassword.value =
//                                         !controller.checkpassword.value;
//                                   },
//                                 ),
//                                 textInputType: TextInputType.text,
//                                 icon: const Icon(Icons.lock),
//                                 labelText: "Mật khẩu",
//                                 setValueFunc: controller.setRePasswordInput),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           Obx(
//                             () => ConstrainedBox(
//                               constraints:
//                                   BoxConstraints.tightFor(width: context.width),
//                               child: ElevatedButton(
//                                 style: ButtonStyle(
//                                   shape: MaterialStateProperty.all(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                   ),
//                                   backgroundColor: MaterialStateProperty.all(
//                                       controller.enableButton.isTrue
//                                           ? Colors.deepPurpleAccent
//                                           : Colors.grey),
//                                   padding: MaterialStateProperty.all(
//                                       const EdgeInsets.all(14)),
//                                 ),
//                                 child: const Text(
//                                   "Đăng ký",
//                                   style: TextStyleConstant.white16Roboto,
//                                 ),
//                                 onPressed: () async {
//                                   if (controller.enableButton.isTrue) {
//                                     await controller.signUp();
//                                   }
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
