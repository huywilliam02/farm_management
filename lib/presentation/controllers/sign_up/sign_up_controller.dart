import 'package:flutter/material.dart';
import 'package:itfsd/presentation/page/login/login.dart';

class SignUpController extends BaseController {
  RxString fullName = ''.obs;
  RxString enterprise = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString description = ''.obs;

  RxBool isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController enterpriseController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Rx<String> validateErrFullName = "".obs;
  Rx<String> validateErrEnterprise = "".obs;
  Rx<String> validateErrEmail = "".obs;
  Rx<String> validateErrPhone = "".obs;
  Rx<String> validateErrDescription = "".obs;

  Rx<bool> hasInternet = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  validateFullName(String value) {
    if (value == "") {
      validateErrFullName.value = "Vui lòng nhập tên";
    } else {
      validateErrFullName.value = "";
    }
  }

  validateEnterprise(String value) {
    if (value == "") {
      validateErrEnterprise.value = "Vui lòng nhập tên doanh nghiệp";
    } else {
      validateErrEnterprise.value = "";
    }
  }

  validateEmail(String value) {
    if (value == "") {
      validateErrEmail.value = "Vui lòng nhập email";
    } else {
      validateErrEmail.value = "";
    }
  }

  validatePhone(String value) {
    if (value == "") {
      validateErrPhone.value = "Vui lòng nhập số điện thoại";
    } else {
      validateErrPhone.value = "";
    }
  }

  validateDescription(String value) {
    if (value == "") {
      validateErrDescription.value = "Vui lòng nhập thông tin";
    } else {
      validateErrDescription.value = "";
    }
  }

  setFullNameInput(String? value) {
    if (value != null) {
      validateFullName(value);
      fullName.value = value;
    }
  }

  setEnterpriseInput(String? value) {
    if (value != null) {
      validateEnterprise(value);
      enterprise.value = value;
    }
  }

  setEmailInput(String? value) {
    if (value != null) {
      validateEmail(value);
      email.value = value;
    }
  }

  setPhoneInput(String? value) {
    if (value != null) {
      validatePhone(value);
      phone.value = value;
    }
  }

  setDescriptionInput(String? value) {
    if (value != null) {
      validateDescription(value);
      description.value = value;
    }
  }

  SignUpModel buildSignUpModel() {
    return SignUpModel(
      fullName: fullNameController.text,
      enterprise: enterpriseController.text,
      email: emailController.text,
      phone: phoneController.text,
      description: descriptionController.text,
    );
  }

  Future<void> createContact() async {
    try {
      validateFullName(fullName.value);
      validateEnterprise(enterprise.value);
      validateEmail(email.value);
      validatePhone(phone.value);
      validateDescription(description.value);
      SignUpModel formData = buildSignUpModel();
      bool check = await SignUpApi.createContact(formData);
      if (check) {
        handleSuccess();
      } else {
        ViewUtils.showSnackbarMessage("Tạo liên hệ không thành công", check);
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  void handleSuccess() {
    Get.back();
    Get.snackbar(
      "Thông báo",
      "Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất",
      icon: const Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
