import 'user.dart';

class UsersView extends BaseView<UsersController> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Thành viên nông trại",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () => Get.back(),
        actions: [
          if (controller
              .hasAdminOrFarmerRole) // Kiểm tra quyền admin hoặc chủ hội
            IconButton(
              onPressed: () {
                controller.refreshForm();
                Get.off(() => CreateUsersView());
                // Get.to(() => CreateUsersView());
              },
              icon: const Icon(IconsUtils.add),
            )
        ],
      ),
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
                child: buildUserList(),
              ),
            ],
          ),
        ),
      ),
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
              "Hiện thị: ${controller.listUsers.length}",
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

  Widget buildUserList() {
    final createUserController = Get.put(EditUserController());
    return Obx(
      () {
        if (controller.isLoading.value && controller.listUsers.value.isEmpty) {
          return const ListViewLoader();
        } else if (controller.listUsers.isEmpty) {
          return const CommonNoItemsFoundIndicator();
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const CommonDivider(),
            itemCount: controller.listUsers.length,
            itemBuilder: (BuildContext context, int index) {
              UserDetailsModel user = controller.listUsers[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: InkWell(
                  onTap: () {
                    createUserController.showUserDetails(user);
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
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "http://116.118.49.43:8878${user.avatar}",
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
                                          user.fullName,
                                          style: AppTextStyle.textNameData,
                                        ),
                                        Text(
                                          user.updatedAt != null
                                              ? DateTimeUtils.tryParse(
                                                    date: user.updatedAt
                                                        .toString(),
                                                    format:
                                                        DateTimeFormatConstants
                                                            .uiDateTime,
                                                  )?.toStringWithFormat(
                                                    DateTimeFormatConstants
                                                        .uiDateDmy,
                                                  ) ??
                                                  'Invalid date'
                                              : 'No date available',
                                          style: AppTextStyle.textNumberData,
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
                            width: 25,
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
