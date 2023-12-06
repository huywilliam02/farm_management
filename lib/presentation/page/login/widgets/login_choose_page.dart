import 'package:flutter/material.dart';
import '../login.dart';

class LoginChoosePage extends StatefulWidget {
  const LoginChoosePage({super.key});

  @override
  State<LoginChoosePage> createState() => _LoginChoosePageState();
}

class _LoginChoosePageState extends State<LoginChoosePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async => false),
      child: CommonScaffold(
        appBar: CommonAppBar(
          title: "",
          leadingIcon: IconsUtils.back,
          onLeadingPressed: () => Get.back(),
          titleType: AppBarTitle.text,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                "assets/logo/logo.png",
                height: 200,
              ),
              const Text(
                "Ứng dụng #1 cho nông nghiệp",
                // LocaleKeys.start_page_text_title.tr,
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 50,
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all()),
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/icons/google.png",
                          height: 25,
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Google",
                              style: TextStyleConstant.black16Roboto,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.SIGN_UP);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(color: Colors.white, border: Border.all()
                            // borderRadius: BorderRadius.circular(10),
                            ),
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Liên hệ",
                                // LocaleKeys
                                //     .login_page_text_title_signup
                                //     .tr,
                                style: TextStyleConstant.black16Roboto,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Facebook",
                              // LocaleKeys
                              //     .login_page_text_title_signup
                              //     .tr,
                              style: TextStyleConstant.white16Roboto,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  const Center(
                    child: Text(
                      'Cùng kiến tạo tương lai',
                      // LocaleKeys.start_page_text_already_member.tr,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CommonConstrainBoxButton(
                text: "Đăng nhập",
                onPressed: () {
                  Get.to(() => const LoginPage(),
                      transition: Transition.rightToLeft);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
