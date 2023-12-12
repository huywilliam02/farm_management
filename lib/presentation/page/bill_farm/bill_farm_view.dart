// ... Import các packages và controllers cần thiết

import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/bill_farm/bill_farm_controller.dart';
import 'package:itfsd/presentation/page/main_tabview/main_tabview_view.dart';

import '../../../app/components/buttons/list_icon_phone_number.dart';
import '../users/user.dart';

class BillFarmView extends BaseView<BillFarmController> {
  const BillFarmView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    final List<Map<String, dynamic>> customList = [
      {
        'name': 'Tháng 7/2023',
        'k': '17091 kW',
        't': '32,170,000 đ',
        'y': '29/7/2023',
        'l': 'Đã thanh toán',
      },
      {
        'name': 'Tháng 8/2023',
        'k': '7091 kW',
        't': '16,800,000 đ',
        'y': '25/9/2023',
        'l': 'Đã thanh toán',
      },
      // Thêm 3 dữ liệu nữa
      {
        'name': 'Tháng 9/2023',
        'k': '2091 kW',
        't': '5,900,000 đ',
        'y': '22/10/2023',
        'l': 'Đã thanh toán',
      },
      {
        'name': 'Tháng 10/2023',
        'k': '8991 kW',
        't': '16,970,000 đ',
        'y': '29/10/2023',
        'l': 'Chưa thanh toán',
      },
      {
        'name': 'Tháng 11/2023',
        'k': '5000 kW',
        't': '12,500,000 đ',
        'y': '15/11/2023',
        'l': 'Chưa thanh toán',
      },
      {
        'name': 'Tháng 12/2023',
        'k': '12000 kW',
        't': '25,000,000 đ',
        'y': '20/12/2023',
        'l': 'Chưa thanh toán',
      },
    ];

    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Hoá đơn",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.offAll(() =>  MainTabView());
        },
        actions: [
          IconButton(
              onPressed: () {
                Dialogs.materialDialog(
                    msg:
                    'Chỉ có chủ hội và thư ký hoặc người có quyền mới sử dụng được tính năng này.',
                    title: "Bạn không có quyền truy cập",
                    color: Colors.white,
                    context: context,
                    actions: [
                      DiaLogIconsButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'Trở lại',
                        iconData: Icons.cancel_outlined,
                        color: Colors.white,
                        textStyle: TextStyle(color: Colors.grey),
                        iconColor: Colors.grey,
                      ),
                    ]);
              },
              icon: Icon(IconsUtils.add))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ... Phần header và nút thêm hóa đơn
            const SizedBox(height: 10),
            Expanded(
              flex: 9,
              child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemCount: customList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  final item = customList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BillDetailPage(billData: item),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const SizedBox(height: 10),
                                Text(
                                  "Tiêu thu : " + item['k'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 25,
                                  width: 170,
                                  color: Colors.grey,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Image.asset("assets/icons/money.png"),
                                      const SizedBox(width: 10),
                                      Text(
                                        item['l'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    item["t"],
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    item["y"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
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

class BillDetailPage extends StatelessWidget {
  final Map<String, dynamic> billData;

  BillDetailPage({required this.billData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Chi tiết hoá đơn",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.offAll(() =>  MainTabView());
        },
        actions: [
          IconButton(
              onPressed: () {
                Dialogs.materialDialog(
                    msg:
                    'Chỉ có chủ hội và thư ký hoặc người có quyền mới sử dụng được tính năng này.',
                    title: "Bạn không có quyền truy cập",
                    color: Colors.white,
                    context: context,
                    actions: [
                      DiaLogIconsButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'Trở lại',
                        iconData: Icons.cancel_outlined,
                        color: Colors.white,
                        textStyle: TextStyle(color: Colors.grey),
                        iconColor: Colors.grey,
                      ),
                    ]);
              },
              icon: Icon(IconsUtils.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên Hóa Đơn: ${billData["name"]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tiêu Thụ: ${billData["k"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Tổng Giá Trị: ${billData["t"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Ngày Thanh Toán: ${billData["y"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Trạng Thái: ${billData["l"]}',
              style: TextStyle(fontSize: 16),
            ),
            // Thêm các thông tin khác tùy thuộc vào dữ liệu bạn muốn hiển thị
          ],
        ),
      ),
    );
  }
}
