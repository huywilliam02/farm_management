import 'dart:async';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/page/login/login_page.dart';

class LoginChoosePage extends StatefulWidget {
  const LoginChoosePage({super.key});

  @override
  State<LoginChoosePage> createState() => _LoginChoosePageState();
}

class _LoginChoosePageState extends State<LoginChoosePage> {
  PageController pageController = PageController(initialPage: 0);
  List images = [
    "assets/images/ari.jpg",
    "assets/images/backru.jpg",
    "assets/images/backroutwo.jpg"
  ];
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    int count = 0;
    Future.delayed(const Duration(seconds: 0), () {
      showModalBottomSheet(
          barrierColor: Colors.transparent,
          // backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          enableDrag: false,
          context: context,
          builder: (builder) {
            return WillPopScope(
              onWillPop: (() async => false),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                height: UtilsReponsive.height(context, 380),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text(
                          "Ứng dụng #1 cho nông nghiệp",
                          // LocaleKeys.start_page_text_title.tr,
                          style: TextStyle(fontSize: 30),
                        )),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.blueAccent.shade700),
                                  onPressed: () async {
                                    // await  Get.find<LoginController>().test2();
                                  },
                                  child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.facebook),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Facebook",
                                              style:
                                                  TextStyleConstant.whiteBold16,
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                margin: const EdgeInsets.only(top: 10),
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    Get.toNamed(Routes.SIGN_UP);
                                  },
                                  child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: Colors.black,
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Liên hệ",
                                              // LocaleKeys
                                              //     .login_page_text_title_signup
                                              //     .tr,
                                              style:
                                                  TextStyleConstant.blackBold16,
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            )),
                          ],
                        )),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Container(
                          height: 2,
                          color: Colors.grey,
                        )),
                        const Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                'Cùng kiến tạo tương lai',
                                // LocaleKeys.start_page_text_already_member.tr,
                                style: TextStyle(color: Colors.grey),
                              ),
                            )),
                        Expanded(
                            child: Container(
                          height: 2,
                          color: Colors.grey,
                        ))
                      ],
                    )),
                    Expanded(
                        // flex: 1,
                        child: SizedBox(
                      height: 100,
                      width: 350,
                      // margin: const EdgeInsets.only(bottom: 5, top: 15),
                      // width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent),
                        onPressed: () {
                          Get.to(() => const LoginPage(),
                              transition: Transition.rightToLeft);
                        },
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyleConstant.whiteBold16,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            );
          });
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        count++;
        pageController.animateToPage(
          count % images.length,
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
        );
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("ddd");
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.asset(
                  images[index % images.length],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Chào mừng',
                  // LocaleKeys.login_page_text_title.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Bạn đến với nông trại",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
