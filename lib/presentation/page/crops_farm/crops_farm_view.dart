import 'package:itfsd/presentation/controllers/crops_farm/controllers/edit_crop_controller.dart';
import 'package:itfsd/presentation/page/crops_farm/edit_crop/create_crop_view.dart';

import 'crop.dart';
import 'package:get/get.dart';

class CropsFarmView extends BaseView<CropsFarmController> {
  const CropsFarmView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: buildAppBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!controller.lazyLoading.value &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            controller.fetchMoreDataThrottled();
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async => await controller.refreshData(),
          child: Column(
            children: [
              const CommonDivider(),
              buildSearchTextField(),
              const CommonDivider(),
              buildItemCountRow(),
              Expanded(
                flex: 9,
                child: buildCropList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return CommonAppBar(
      title: "Cây trồng nông trại",
      titleType: AppBarTitle.text,
      centerTitle: true,
      titleTextStyle: AppTextStyle.textTitleAppBar,
      leadingIcon: IconsUtils.back,
      onLeadingPressed: () => {
        controller.refreshData(),
        Get.back(),
      },
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => const CreateCropView());
          },
          icon: const Icon(IconsUtils.add),
        ),
      ],
    );
  }

  Widget buildSearchTextField() {
    return TextField(
      onChanged: (value) async {
        await controller.onTypingSearch(value);
      },
      decoration: const InputDecoration(
        hintText: "Tìm kiếm",
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget buildItemCountRow() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hiện thị: ${controller.listCropsFarm.length}",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Image(
                    height: 30,
                    image: AssetImage("assets/icons/filter.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCropList() {
    final editCropController = Get.put(EditCropController());

    return Obx(
      () {
        if (controller.isLoading.value &&
            controller.listCropsFarm.value.isEmpty) {
          return const CommonLoadingPageProgressIndicator();
        } else if (controller.listCropsFarm.isEmpty) {
          return const CommonNoItemsFoundIndicator();
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const CommonDivider(),
            itemCount: controller.listCropsFarm.length,
            itemBuilder: (BuildContext context, int index) {
              CropsDetail crop = controller.listCropsFarm[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: InkWell(
                  onTap: () {
                    editCropController.showCropDetails(crop);
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      height: 60,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "http://116.118.49.43:8878${crop.images!.first}",
                                        errorWidget: (context, url, error) {
                                          return Image.asset(
                                              "assets/images/avatar.png");
                                        },
                                        progressIndicatorBuilder:
                                            (context, url, progress) {
                                          return const LoadingItem();
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          crop.name!,
                                          style: AppTextStyle.textNameData,
                                        ),
                                        Text(
                                          NumberFormatUtils.formatDong(
                                              crop.price!.toString()),
                                          style: AppTextStyle.textPriceData,
                                        ),
                                        Text(
                                          crop.harvest!,
                                          style: AppTextStyle.textQuantityData,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/icons/next.png",
                                height: 15,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
