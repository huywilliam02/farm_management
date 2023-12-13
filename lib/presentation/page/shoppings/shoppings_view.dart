import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/main_tabview/main_tabview_view.dart';
import 'package:itfsd/presentation/page/shoppings/harvest_bill_view.dart';
import 'package:itfsd/presentation/page/shoppings/harvest_menu.dart';
import 'package:itfsd/presentation/page/shoppings/showbottom_shop.dart';

import '../../controllers/shoppings/shoppings_controller.dart';

class ShoppingsView extends BaseView<ShoppingsController> {
  const ShoppingsView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    final List<Map<String, dynamic>> customList = [
      {
        'name': 'Công ty MNO',
        'k': 'BH00010',
        't': '3,000,000 đ',
        'y': '25/9/2023',
        'd': 'Chưa xuất hàng',
        'l': 'Chưa thanh toán',
        'cây trồng': 'Rau sạch',
        'số lượng': '35 kg',
        'khu vực': 'Đồng bằng sông Mekong',
        'ngày thu hoạch': '23/9/2023',
        'tình trạng cây trồng': 'Trạng thái khá',
        'địa chỉ công ty': '987 Đường PNL, Thành phố HCM',
        'người liên hệ': 'Lê Thị Duyên',
        'email': 'lethid@gmail.com',
        'số điện thoại': '0123 789 456',
        'loại hình doanh nghiệp': 'Công ty TNHH',
        'thành lập': '2015',
        'mã số thuế': 'MNO789XYZ',
        'website': 'https://www.mno-company.com',
        'danh sách sản phẩm': ['Sản phẩm G', 'Sản phẩm H', 'Sản phẩm I'],
        'đối tác kinh doanh': [
          {
            'tên': 'Công ty PQR',
            'ngành nghề': 'Đối tác sản xuất',
            'hình ảnh': 'https://example.com/images/company_pqr.jpg'
          },
          {
            'tên': 'Công ty STU',
            'ngành nghề': 'Đối tác cung ứng',
            'hình ảnh': 'https://example.com/images/company_stu.jpg'
          },
        ],
        'đánh giá': {
          'chất lượng': 4.2,
          'dịch vụ': 4.6,
          'thời gian giao hàng': 4.3,
        },
        'giao dịch gần đây': [
          {
            'mã giao dịch': 'GD0007',
            'số tiền': '1,800,000 đ',
            'ngày': '24/9/2023',
            'sản phẩm': 'Sản phẩm dưa lưới'
          },
          {
            'mã giao dịch': 'GD0008',
            'số tiền': '2,200,000 đ',
            'ngày': '26/9/2023',
            'sản phẩm': 'Sản phẩm táo'
          },
        ],
        'lịch sử mua hàng': [
          {
            'mã hóa đơn': 'HD0007',
            'số tiền': '3,000,000 đ',
            'ngày': '21/9/2023',
            'sản phẩm': ['Sản phẩm dưa lưới', 'Sản phẩm táo']
          },
          {
            'mã hóa đơn': 'HD0008',
            'số tiền': '2,500,000 đ',
            'ngày': '22/9/2023',
            'sản phẩm': 'Sản phẩm I'
          },
        ],
        'hình ảnh công ty': 'https://example.com/images/company_mno_logo.jpg',
      },
      {
        'name': 'Công ty PQR',
        'k': 'BH00011',
        't': '1,500,000 đ',
        'y': '28/9/2023',
        'd': 'Đã xuất hàng',
        'l': 'Đã thanh toán',
        'cây trồng': 'Quả cầu mật',
        'số lượng': '25 kg',
        'khu vực': 'Đồng bằng sông Hương',
        'ngày thu hoạch': '26/9/2023',
        'tình trạng cây trồng': 'Trạng thái tốt',
        'địa chỉ công ty': '567 Đường PQR, Thành phố DEF',
        'người liên hệ': 'Trương Văn E',
        'email': 'truongvane@gmail.com',
        'số điện thoại': '0987 456 123',
        'loại hình doanh nghiệp': 'Công ty TNHH',
        'thành lập': '2018',
        'mã số thuế': 'PQR567XYZ',
        'website': 'https://www.pqr-company.com',
        'danh sách sản phẩm': ['Sản phẩm J', 'Sản phẩm K', 'Sản phẩm L'],
        'đối tác kinh doanh': [
          {
            'tên': 'Công ty UVW',
            'ngành nghề': 'Đối tác sản xuất',
            'hình ảnh': 'https://example.com/images/company_uvw.jpg'
          },
          {
            'tên': 'Công ty XYZ',
            'ngành nghề': 'Đối tác cung ứng',
            'hình ảnh': 'https://example.com/images/company_xyz.jpg'
          },
        ],
        'đánh giá': {
          'chất lượng': 4.7,
          'dịch vụ': 4.3,
          'thời gian giao hàng': 4.5,
        },
        'giao dịch gần đây': [
          {
            'mã giao dịch': 'GD0009',
            'số tiền': '1,200,000 đ',
            'ngày': '27/9/2023',
            'sản phẩm': 'Sản phẩm dưa hấu'
          },
          {
            'mã giao dịch': 'GD0010',
            'số tiền': '1,700,000 đ',
            'ngày': '29/9/2023',
            'sản phẩm': 'Sản phẩm cà phê'
          },
        ],
        'lịch sử mua hàng': [
          {
            'mã hóa đơn': 'HD0009',
            'số tiền': '2,000,000 đ',
            'ngày': '24/9/2023',
            'sản phẩm': ['Sản phẩm dưa hấu', 'Sản phẩm cà phê']
          },
          {
            'mã hóa đơn': 'HD0010',
            'số tiền': '1,800,000 đ',
            'ngày': '25/9/2023',
            'sản phẩm': 'Sản phẩm dưa hấu'
          },
        ],
        'hình ảnh công ty': 'https://example.com/images/company_pqr_logo.jpg',
      },
      {
        'name': 'Công ty STU',
        'k': 'BH00012',
        't': '2,200,000 đ',
        'y': '30/9/2023',
        'd': 'Chưa xuất hàng',
        'l': 'Chưa thanh toán',
        'cây trồng': 'Cây lúa mạch',
        'số lượng': '45 kg',
        'khu vực': 'Đồng bằng sông Tháp Mười',
        'ngày thu hoạch': '28/9/2023',
        'tình trạng cây trồng': 'Trạng thái khá',
        'địa chỉ công ty': '345 Đường STU, Thành phố GHI',
        'người liên hệ': 'Nguyễn Thị F',
        'email': 'nguyenthif@example.com',
        'số điện thoại': '0123 789 012',
        'loại hình doanh nghiệp': 'Công ty Cổ phần',
        'thành lập': '2014',
        'mã số thuế': 'STU345XYZ',
        'website': 'https://www.stu-company.com',
        'danh sách sản phẩm': ['Sản phẩm M', 'Sản phẩm N', 'Sản phẩm O'],
        'đối tác kinh doanh': [
          {
            'tên': 'Công ty KI',
            'ngành nghề': 'Đối tác sản xuất',
            'hình ảnh': 'https://example.com/images/company_abc.jpg'
          },
          {
            'tên': 'Công ty DEF',
            'ngành nghề': 'Đối tác cung ứng',
            'hình ảnh': 'https://example.com/images/company_def.jpg'
          },
        ],
        'đánh giá': {
          'chất lượng': 4.5,
          'dịch vụ': 4.2,
          'thời gian giao hàng': 4.7,
        },
        'giao dịch gần đây': [
          {
            'mã giao dịch': 'GD0011',
            'số tiền': '1,500,000 đ',
            'ngày': '29/9/2023',
            'sản phẩm': 'Sản phẩm M'
          },
          {
            'mã giao dịch': 'GD0012',
            'số tiền': '1,900,000 đ',
            'ngày': '1/10/2023',
            'sản phẩm': 'Sản phẩm O'
          },
        ],
        'lịch sử mua hàng': [
          {
            'mã hóa đơn': 'HD0011',
            'số tiền': '2,200,000 đ',
            'ngày': '26/9/2023',
            'sản phẩm': ['Sản phẩm M', 'Sản phẩm N']
          },
          {
            'mã hóa đơn': 'HD0012',
            'số tiền': '2,000,000 đ',
            'ngày': '28/9/2023',
            'sản phẩm': 'Sản phẩm O'
          },
        ],
        'hình ảnh công ty': 'https://example.com/images/company_stu_logo.jpg',
      },
      {
        'name': 'Công ty GHI',
        'k': 'BH00010',
        't': '1,800,000 đ',
        'y': '25/9/2023',
        'd': 'Chưa xuất hàng',
        'l': 'Chưa thanh toán',
        'cây trồng': 'Rau củ',
        'số lượng': '25 kg',
        'khu vực': 'Đồng bằng sông Hồng',
        'ngày thu hoạch': '23/9/2023',
        'tình trạng cây trồng': 'Trạng thái khá',
        'địa chỉ công ty': '567 Đường DEF, Thành phố GHI',
        'người liên hệ': 'Lê Văn D',
        'email': 'levand@example.com',
        'số điện thoại': '0987 987 654',
        'loại hình doanh nghiệp': 'Công ty TNHH',
        'thành lập': '2015',
        'mã số thuế': 'GHI789XYZ',
        'website': 'https://www.ghi-company.com',
        'danh sách sản phẩm': ['Sản phẩm G', 'Sản phẩm H', 'Sản phẩm I'],
        'đối tác kinh doanh': [
          {
            'tên': 'Công ty JKL',
            'ngành nghề': 'Đối tác sản xuất',
            'hình ảnh': 'https://example.com/images/company_jkl.jpg'
          },
          {
            'tên': 'Công ty MNO',
            'ngành nghề': 'Đối tác cung ứng',
            'hình ảnh': 'https://example.com/images/company_mno.jpg'
          },
        ],
        'đánh giá': {
          'chất lượng': 4.2,
          'dịch vụ': 4.6,
          'thời gian giao hàng': 4.3,
        },
        'giao dịch gần đây': [
          {
            'mã giao dịch': 'GD0007',
            'số tiền': '900,000 đ',
            'ngày': '24/9/2023',
            'sản phẩm': 'Sản phẩm G'
          },
          {
            'mã giao dịch': 'GD0008',
            'số tiền': '1,200,000 đ',
            'ngày': '26/9/2023',
            'sản phẩm': 'Sản phẩm H'
          },
        ],
        'lịch sử mua hàng': [
          {
            'mã hóa đơn': 'HD0007',
            'số tiền': '1,800,000 đ',
            'ngày': '22/9/2023',
            'sản phẩm': ['Sản phẩm G', 'Sản phẩm I']
          },
          {
            'mã hóa đơn': 'HD0008',
            'số tiền': '1,500,000 đ',
            'ngày': '23/9/2023',
            'sản phẩm': 'Sản phẩm H'
          },
        ],
        'hình ảnh công ty': 'https://example.com/images/company_ghi_logo.jpg',
      },
      {
        'name': 'Công ty JKL',
        'k': 'BH00011',
        't': '2,300,000 đ',
        'y': '28/9/2023',
        'd': 'Đã xuất hàng',
        'l': 'Đã thanh toán',
        'cây trồng': 'Cây ăn quả',
        'số lượng': '35 kg',
        'khu vực': 'Đồng bằng sông Mekong',
        'ngày thu hoạch': '26/9/2023',
        'tình trạng cây trồng': 'Trạng thái tốt',
        'địa chỉ công ty': '789 Đường JKL, Thành phố JKL',
        'người liên hệ': 'Trần Thị E',
        'email': 'tranthe@example.com',
        'số điện thoại': '0987 456 789',
        'loại hình doanh nghiệp': 'Công ty Cổ phần',
        'thành lập': '2013',
        'mã số thuế': 'JKL123XYZ',
        'website': 'https://www.jkl-company.com',
        'danh sách sản phẩm': ['Sản phẩm J', 'Sản phẩm K', 'Sản phẩm L'],
        'đối tác kinh doanh': [
          {
            'tên': 'Công ty MNO',
            'ngành nghề': 'Đối tác sản xuất',
            'hình ảnh': 'https://example.com/images/company_mno.jpg'
          },
          {
            'tên': 'Công ty PQR',
            'ngành nghề': 'Đối tác cung ứng',
            'hình ảnh': 'https://example.com/images/company_pqr.jpg'
          },
        ],
        'đánh giá': {
          'chất lượng': 4.6,
          'dịch vụ': 4.8,
          'thời gian giao hàng': 4.7,
        },
        'giao dịch gần đây': [
          {
            'mã giao dịch': 'GD0009',
            'số tiền': '1,500,000 đ',
            'ngày': '27/9/2023',
            'sản phẩm': 'Sản phẩm J'
          },
          {
            'mã giao dịch': 'GD0010',
            'số tiền': '2,000,000 đ',
            'ngày': '29/9/2023',
            'sản phẩm': 'Sản phẩm K'
          },
        ],
        'lịch sử mua hàng': [
          {
            'mã hóa đơn': 'HD0009',
            'số tiền': '2,300,000 đ',
            'ngày': '25/9/2023',
            'sản phẩm': ['Sản phẩm J', 'Sản phẩm L']
          },
          {
            'mã hóa đơn': 'HD0010',
            'số tiền': '1,800,000 đ',
            'ngày': '26/9/2023',
            'sản phẩm': 'Sản phẩm K'
          },
        ],
        'hình ảnh công ty': 'https://example.com/images/company_jkl_logo.jpg',
      },

      {
        'name': 'Công ty Hương Giang',
        'k': 'BH00007',
        't': '1,200,000 đ',
        'y': '18/9/2023',
        'd': 'Đã xuất hàng',
        'l': 'Đã thanh toán',
        'cây trồng': 'Lúa',
        'số lượng': '50 kg',
        'khu vực': 'Đồng bằng sông Cửu Long',
        'ngày thu hoạch': '15/9/2023',
        'tình trạng cây trồng': 'Trạng thái tốt',
        'địa chỉ công ty': '123 Đường ABC, Thành phố XYZ',
        'người liên hệ': 'Nguyễn Văn A',
        'email': 'nguyenvana@example.com',
        'số điện thoại': '0123 456 789',
        'loại hình doanh nghiệp': 'Công ty TNHH',
        'thành lập': '2005',
        'mã số thuế': 'ABC123XYZ',
        'website': 'https://www.example.com',
        'danh sách sản phẩm': ['Sản phẩm A', 'Sản phẩm B', 'Sản phẩm C'],
        'đối tác kinh doanh': [
          {
            'tên': 'Công ty Thành Long',
            'ngành nghề': 'Đối tác sản xuất',
            'hình ảnh': 'https://example.com/images/company_abc.jpg'
          },
          {
            'tên': 'Không tiết lộ',
            'ngành nghề': 'Đối tác cung ứng',
            'hình ảnh': 'https://example.com/images/company_xyz.jpg'
          },
        ],
        'đánh giá': {
          'chất lượng': 4.5,
          'dịch vụ': 4.2,
          'thời gian giao hàng': 4.7,
        },
        'giao dịch gần đây': [
          {
            'mã giao dịch': 'GD0001',
            'số tiền': '500,000 đ',
            'ngày': '15/9/2023',
            'sản phẩm': 'Sản phẩm A'
          },
          {
            'mã giao dịch': 'GD0002',
            'số tiền': '700,000 đ',
            'ngày': '16/9/2023',
            'sản phẩm': 'Sản phẩm B'
          },
        ],
        'lịch sử mua hàng': [
          {
            'mã hóa đơn': 'HD0001',
            'số tiền': '1,200,000 đ',
            'ngày': '10/9/2023',
            'sản phẩm': ['Sản phẩm A', 'Sản phẩm C']
          },
          {
            'mã hóa đơn': 'HD0002',
            'số tiền': '900,000 đ',
            'ngày': '12/9/2023',
            'sản phẩm': 'Sản phẩm B'
          },
        ],
        'hình ảnh công ty': 'https://example.com/images/company_xyz_logo.jpg',
      },
      // Thêm dữ liệu mới ở đây...
      {
        'name': 'Công ty rượu Thành Long',
        'k': 'BH00008',
        't': '800,000 đ',
        'y': '20/9/2023',
        'd': 'Chưa xuất hàng',
        'l': 'Chưa thanh toán',
        'cây trồng': 'Rau củ',
        'số lượng': '30 kg',
        'khu vực': 'Đồng bằng sông Hồng',
        'ngày thu hoạch': '17/9/2023',
        'tình trạng cây trồng': 'Trạng thái khá',
        'địa chỉ công ty': '456 Đường XYZ, Thành phố ABC',
        'người liên hệ': 'Trần Văn B',
        'email': 'tranvanb@example.com',
        'số điện thoại': '0987 654 321',
        'loại hình doanh nghiệp': 'Công ty Cổ phần',
        'thành lập': '2010',
        'mã số thuế': 'XYZ789ABC',
        'website': 'https://www.abc-company.com',
        'danh sách sản phẩm': ['Sản phẩm ổi', 'Sản phẩm bưởi', 'Sản phẩm lúa'],
        'đối tác kinh doanh': [
          {
            'tên': 'Công ty DEF',
            'ngành nghề': 'Đối tác sản xuất',
            'hình ảnh': 'https://example.com/images/company_def.jpg'
          },
          {
            'tên': 'Công ty GHI',
            'ngành nghề': 'Đối tác cung ứng',
            'hình ảnh': 'https://example.com/images/company_ghi.jpg'
          },
        ],
        'đánh giá': {
          'chất lượng': 4.0,
          'dịch vụ': 4.8,
          'thời gian giao hàng': 4.5,
        },
        'giao dịch gần đây': [
          {
            'mã giao dịch': 'GD0003',
            'số tiền': '600,000 đ',
            'ngày': '18/9/2023',
            'sản phẩm': 'Sản phẩm X'
          },
          {
            'mã giao dịch': 'GD0004',
            'số tiền': '850,000 đ',
            'ngày': '19/9/2023',
            'sản phẩm': 'Sản phẩm Y'
          },
        ],
        'lịch sử mua hàng': [
          {
            'mã hóa đơn': 'HD0003',
            'số tiền': '800,000 đ',
            'ngày': '14/9/2023',
            'sản phẩm': ['Sản phẩm X', 'Sản phẩm Z']
          },
          {
            'mã hóa đơn': 'HD0004',
            'số tiền': '950,000 đ',
            'ngày': '16/9/2023',
            'sản phẩm': 'Sản phẩm Y'
          },
        ],
        'hình ảnh công ty': 'https://example.com/images/company_abc_logo.jpg',
      },
    ];

    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Expanded(
                    flex: 16,
                    child: Center(
                      child: Text(
                        'Danh sách bán hàng',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Đơn bán 5/5 ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Image(
                              image: AssetImage("assets/icons/filtration.png"),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return const ShowBottomShop();
                                },
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
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
                      controller.setSelectedItem(item);
                      Get.to(() => CompanyDetailsScreen(companyData: item));
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
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mã hàng : " + item['k'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 170,
                                  color: Colors.blue,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset("assets/icons/money.png"),
                                      const SizedBox(
                                        width: 10,
                                      ),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 170,
                                  color: Colors.grey,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset("assets/icons/truck.png"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        item['d'],
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
                                    item["y"],
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item["t"],
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
