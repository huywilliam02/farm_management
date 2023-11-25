import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import '../../../base/base_view.dart';
import '../../../app/core/constants/app_constants.dart';
import '../../controllers/choose_language/choose_language_controller.dart';

class ChooseLanguageView extends BaseView<ChooseLanguageController> {
  const ChooseLanguageView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/start.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await controller.updateLanguage(1);
                  },
                  child: Container(
                    height: UtilsReponsive.height(context, 50),
                    padding: EdgeInsets.symmetric(
                      horizontal: UtilsReponsive.height(context, 40),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: UtilsReponsive.height(context, 40),
                    ),
                    color: Colors.redAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: UtilsReponsive.height(context, 26),
                              width: UtilsReponsive.width(context, 30),
                              child: Image.asset("assets/icons/vn.png")),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "Tiếng Việt",
                            // LocaleKeys.common_language_vi.tr,
                            style: TextStyleConstant.white22RobotoBold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: UtilsReponsive.height(context, 15),
                ),
                InkWell(
                  onTap: () async {
                    await controller.updateLanguage(2);
                  },
                  child: Container(
                    height: UtilsReponsive.height(context, 50),
                    padding: EdgeInsets.symmetric(
                      horizontal: UtilsReponsive.height(context, 40),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: UtilsReponsive.height(context, 40),
                    ),
                    color: Colors.blueAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: UtilsReponsive.height(context, 26),
                              width: UtilsReponsive.width(context, 30),
                              child: Image.asset(
                                  "assets/icons/us.png")),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "Tiếng anh",
                            // LocaleKeys.common_language_en.tr,
                            style: TextStyleConstant.white22RobotoBold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
