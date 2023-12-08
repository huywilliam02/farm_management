import 'package:cached_network_image/cached_network_image.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/common/shimmer/listview/loading_item.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/components/buttons/button_tab_view.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Stack(
          children: [
            CommonAppBar(
              title: "Biên Hòa",
              titleType: AppBarTitle.text,
              centerTitle: true,
              titleTextStyle: AppTextStyle.textTitleAppBar,
              backgroundColor: Colors.green,
              leadingIcon: Obx(
                () => controller.isLoading.value
                    ? const CommonLoadingPageProgressIndicator()
                    : Container(
                        clipBehavior: Clip.hardEdge,
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "http://116.118.49.43:8878${controller.avatar}",
                          errorWidget: (context, url, error) {
                            return Image.asset("assets/images/avatar.png");
                          },
                          progressIndicatorBuilder: (context, url, progress) {
                            return const LoadingItem();
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              onLeadingPressed: () {},
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Image(
                    image: AssetImage("assets/icons/messenger.png"),
                    color: Colors.white,
                    height: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Image(
                    image: AssetImage("assets/icons/notification.png"),
                    color: Colors.white,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: UtilsReponsive.height(context, 10),
            ),
            const ButtonTabView(),
          ],
        ),
      ),
    );
  }
}
