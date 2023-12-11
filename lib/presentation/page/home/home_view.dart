import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:itfsd/app/components/buttons/income_other.dart';
import 'package:itfsd/app/components/buttons/ware_house_tab.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/common/shimmer/listview/loading_item.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/components/buttons/button_tab_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/data/model/news/news_model.dart';
import 'package:itfsd/presentation/controllers/edit_profile/edit_profile_controller.dart';
import 'package:itfsd/presentation/page/contract/custtomtabbar_view.dart';
import 'package:itfsd/presentation/page/edit_profile/widgets/information_profile.view.dart';
import 'package:itfsd/presentation/page/home/harvested_crop_list_view.dart';
import 'package:itfsd/presentation/page/home/notification/list_notification.dart';
import 'package:itfsd/presentation/page/news/home_page.dart';
import 'package:itfsd/presentation/page/viewlandfull/tab_viewland/lands_detail.dart';
import '../../controllers/home/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    EditProfileController editProfileController =
        Get.put(EditProfileController());
    final HarvestedCrop harvestedCrop;
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
                    : InkWell(
                        onTap: () {
                          Get.to(() => InformationPage());
                        },
                        child: Container(
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
              ),
              onLeadingPressed: () {},
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.CHAT_AI);
                  },
                  icon: const Image(
                    image: AssetImage("assets/icons/messenger.png"),
                    color: Colors.white,
                    height: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => const ListNotification());
                  },
                  icon: const Image(
                    image: AssetImage("assets/images/notification.png"),
                    // color: Colors.white,
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
            Container(
              height: 250,
              color: ColorConstant.background_color,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.landAreas.length,
                itemBuilder: (context, index) {
                  LandArea landArea = controller.landAreas[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LandAreaDetailScreen(landArea: landArea),
                      ),
                    ),
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.all(8),
                      child: Card(
                        elevation: 0.2,
                        color: ColorConstant.background_color,
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(landArea.images
                                      .first), // Lấy ảnh đầu tiên của vùng sản xuất
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                landArea.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                'Diện tích: ${landArea.acreage} ha',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            WareHouseTabView(),
            Container(
              height: 250,
              color: ColorConstant.background_color,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.harvestedCrops.length,
                itemBuilder: (context, index) {
                  HarvestedCrop harvestedCrop =
                      controller.harvestedCrops[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HarvestedCropDetailScreen(
                            harvestedCrop: harvestedCrop),
                      ),
                    ),
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.all(8),
                      child: Card(
                        elevation: 0.2,
                        color: ColorConstant.background_color,
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      harvestedCrop.imageUrls.first),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                harvestedCrop.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                'Số lượng: ${harvestedCrop.quantity} ${harvestedCrop.unit}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            IncomeTabView(),
            Container(
              height: 250,
              // Set the height according to your design
              color: ColorConstant.background_color,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.newsArticles.length,
                itemBuilder: (context, index) {
                  NewsArticle news = controller.newsArticles[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          title: controller.newsArticles[index].title!,
                          description:
                              controller.newsArticles[index].description!,
                          imageUrl:
                              controller.newsArticles[index].urlToImage ?? "",
                          author: controller.newsArticles[index].author ?? "",
                          publishedAt: controller
                              .newsArticles[index].publishedAt
                              .toString(),
                          content: controller.newsArticles[index].content!,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 200, // Set the width of each news item
                      margin: EdgeInsets.all(8),
                      child: Card(
                        elevation: 0.2,
                        color: ColorConstant.background_color,
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(news.urlToImage!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                news.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                news.content!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
