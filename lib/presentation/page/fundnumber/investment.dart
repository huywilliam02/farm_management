import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/app/util/number_format_utils.dart';

import '../../controllers/agricultural_products/agricultural_products_constant.dart';

class InvestmentProject {
  final String title;
  final String description;
  final double investmentAmount;
  final DateTime startDate;

  InvestmentProject({
    required this.title,
    required this.description,
    required this.investmentAmount,
    required this.startDate,
  });
}

class InvestmentPage extends StatelessWidget {
  final List<InvestmentProject> projects = [
    InvestmentProject(
      title: 'Dự án Nâng cấp cơ sở hạ tầng nông nghiệp',
      description:
          'Dự án này nhằm nâng cấp cơ sở hạ tầng nông nghiệp, bao gồm đường giao thông, hệ thống thủy lợi và các tiện ích hỗ trợ khác để tối ưu hóa sản xuất và vận chuyển nông sản.',
      investmentAmount: 180000000,
      startDate: DateTime(2023, 12, 1),
    ),
    InvestmentProject(
      title: 'Dự án Mua sắm máy móc nông nghiệp hiện đại',
      description:
          'Dự án Mua sắm máy móc nông nghiệp hiện đại nhằm đổi mới và nâng cao hiệu suất trong quy trình sản xuất nông nghiệp, từ máy cày đến máy gặt và các thiết bị khác.',
      investmentAmount: 250000000,
      startDate: DateTime(2024, 1, 1),
    ),
    InvestmentProject(
      title: 'Dự án Nghiên cứu và ứng dụng công nghệ IoT trong nông nghiệp',
      description:
          'Dự án này tập trung vào nghiên cứu và triển khai ứng dụng công nghệ Internet of Things (IoT) để theo dõi và quản lý các hoạt động nông nghiệp, từ giám sát thời tiết đến quản lý thú y.',
      investmentAmount: 350000000,
      startDate: DateTime(2024, 2, 1),
    ),
    InvestmentProject(
      title: 'Dự án Mô hình trang trại tự chủ năng lượng',
      description:
          'Dự án Mô hình trang trại tự chủ năng lượng nhằm sử dụng các nguồn năng lượng tái tạo như năng lượng mặt trời và gió để cung cấp năng lượng cho hoạt động sản xuất nông nghiệp.',
      investmentAmount: 300000000,
      startDate: DateTime(2024, 3, 1),
    ),
    InvestmentProject(
      title: 'Dự án Mua sắm hệ thống giống cây mới',
      description:
          'Dự án Mua sắm hệ thống giống cây mới nhằm đầu tư vào nghiên cứu và phát triển giống cây mới, chất lượng cao để cải thiện năng suất và chất lượng sản phẩm.',
      investmentAmount: 200000000,
      startDate: DateTime(2024, 4, 1),
    ),
    InvestmentProject(
      title: 'Dự án Mô hình chăn nuôi ổn định',
      description:
          'Dự án Mô hình chăn nuôi ổn định tập trung vào việc phát triển mô hình chăn nuôi bền vững, từ chăn nuôi gia cầm đến chăn nuôi gia súc, với quy trình an toàn và hiệu quả.',
      investmentAmount: 280000000,
      startDate: DateTime(2024, 5, 1),
    ),
    InvestmentProject(
      title: 'Dự án Mô hình trồng cây lúa mới',
      description:
          'Dự án Mô hình trồng cây lúa mới nhằm đổi mới phương pháp canh tác và chăm sóc cây lúa, áp dụng các kỹ thuật mới để tối ưu hóa năng suất.',
      investmentAmount: 230000000,
      startDate: DateTime(2024, 6, 1),
    ),
    InvestmentProject(
      title: 'Dự án Mua sắm thiết bị giữ lạnh và bảo quản nông sản',
      description:
          'Dự án Mua sắm thiết bị giữ lạnh và bảo quản nông sản nhằm cải thiện quy trình bảo quản và vận chuyển nông sản từ nông trại đến thị trường.',
      investmentAmount: 320000000,
      startDate: DateTime(2024, 7, 1),
    ),
    // Thêm các dự án khác tương tự
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Danh sách đầu tư",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.offNamed(Routes.MAIN_TABVIEW);
        },
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => CommonDivider(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToProjectDetail(context, projects[index]);
            },
            child: Card(
              elevation: 0,
              color: ColorConstant.background_color,
              // margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projects[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Mô tả: ${projects[index].description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Số tiền đầu tư:${NumberFormatUtils.formatDong(
                              projects[index].investmentAmount.toString())}",
                      // style: AppTextStyle.textPriceData,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ngày bắt đầu: ${projects[index].startDate.day}/${projects[index].startDate.month}/${projects[index].startDate.year}',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToProjectDetail(
      BuildContext context, InvestmentProject project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailPage(project: project),
      ),
    );
  }
}

class ProjectDetailPage extends StatelessWidget {
  final InvestmentProject project;

  ProjectDetailPage({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết dự án'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('Mô tả: ${project.description}'),
            SizedBox(height: 16),
            Text(
              NumberFormatUtils.formatDong(project.investmentAmount.toString()),
              // style: AppTextStyle.textPriceData,
            ),
            SizedBox(height: 16),
            Text(
              'Ngày bắt đầu: ${project.startDate.day}/${project.startDate.month}/${project.startDate.year}',
            ),
          ],
        ),
      ),
    );
  }
}
