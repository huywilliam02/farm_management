import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/presentation/page/cropseason/showbottomcrops.dart';

import '../login/login.dart';

class Crop {
  final String name;
  Crop({required this.name});
}

class Location {
  final double latitude;
  final double longitude;
  Location({required this.latitude, required this.longitude});
}

class Land {
  final String name;
  Land({required this.name});
}

class HarvestSeason {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final Crop crop;
  final Land land;
  final String farmer;
  final double totalHarvest;
  final String weatherConditions;
  final String soilConditions;

  // Thêm các thông tin mới khác tại đây
  final String pestControlMethod;
  final String irrigationMethod;
  final String notes;
  final String marketConditions;
  final String storageMethod;
  final String harvestingEquipment;

  // Thêm các trường dữ liệu mới khác tại đây
  final String fertilizationMethod;
  final String diseaseControlMethod;
  final String maturityIndex;
  final bool isCertifiedOrganic;

  // Thêm các trường dữ liệu mới khác tại đây
  final String postHarvestTreatment;
  final String packagingMethod;
  final String transportationMethod;
  final String salesChannel;
  final String additionalInformation;

  // Thêm các trường dữ liệu mới khác tại đây
  final double averageTemperature;
  final int hoursOfSunlight;
  final String cultivationPractices;
  final String fieldPreparationMethod;
  final String monitoringAndManagement;
  final String trainingAndSupport;
  final String fieldConditions;

  HarvestSeason({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.crop,
    required this.land,
    required this.farmer,
    required this.totalHarvest,
    required this.weatherConditions,
    required this.soilConditions,
    required this.pestControlMethod,
    required this.irrigationMethod,
    required this.notes,
    required this.marketConditions,
    required this.storageMethod,
    required this.harvestingEquipment,
    required this.fertilizationMethod,
    required this.diseaseControlMethod,
    required this.maturityIndex,
    required this.isCertifiedOrganic,
    required this.postHarvestTreatment,
    required this.packagingMethod,
    required this.transportationMethod,
    required this.salesChannel,
    required this.additionalInformation,
    required this.averageTemperature,
    required this.hoursOfSunlight,
    required this.cultivationPractices,
    required this.fieldPreparationMethod,
    required this.monitoringAndManagement,
    required this.trainingAndSupport,
    required this.fieldConditions,
  });
}

class HarvestSeasonListScreen extends StatelessWidget {
  HarvestSeasonListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<HarvestSeason> harvestSeasons = [
      HarvestSeason(
        name: 'Mùa thu hoạch Dưa lưới',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 1, 31),
        crop: Crop(name: 'Dưa lưới'),
        land: Land(name: 'Khu nhà kính'),
        farmer: 'Nguyễn Văn Bình',
        totalHarvest: 500.0,
        weatherConditions: 'Nắng và mát',
        soilConditions: 'Đất đỏ, giàu dưỡng',
        pestControlMethod: 'Sử dụng thuốc trừ sâu hữu cơ',
        irrigationMethod: 'Tưới nhỏ giọt',
        notes: 'Ghi chú mùa vụ Dưa lưới',
        marketConditions: 'Thị trường tốt',
        storageMethod: 'Bảo quản trong kho lạnh',
        harvestingEquipment: 'Máy gặt cỏ',
        fertilizationMethod: 'Sử dụng phân hữu cơ',
        diseaseControlMethod: 'Kiểm soát bệnh bằng vi khuẩn',
        maturityIndex: 'Chỉ số chín muồi: 90%',
        isCertifiedOrganic: true,
        postHarvestTreatment: 'Xử lý sau thu hoạch bằng nước nóng',
        packagingMethod: 'Đóng gói sản phẩm trong túi hữu cơ',
        transportationMethod: 'Vận chuyển bằng xe tải đặc chủng',
        salesChannel: 'Bán hàng trực tuyến và tại chợ địa phương',
        additionalInformation: 'Thông tin thêm mùa vụ Dưa lưới',
        averageTemperature: 28.0,
        hoursOfSunlight: 12,
        cultivationPractices: 'Tuân thủ phương pháp canh tác hữu cơ',
        fieldPreparationMethod: 'Làm đất bằng máy',
        monitoringAndManagement: 'Giám sát và quản lý đều đặn',
        trainingAndSupport: 'Đào tạo nông dân về phương pháp canh tác mới',
        fieldConditions: 'Đất mềm, thoát nước tốt',
      ),
      HarvestSeason(
        name: 'Mùa thu hoạch Rau củ',
        startDate: DateTime(2023, 2, 1),
        endDate: DateTime(2023, 2, 28),
        crop: Crop(name: 'Rau củ'),
        land: Land(name: 'Vườn rau'),
        farmer: 'Người nông dân ',
        totalHarvest: 300.0,
        weatherConditions: 'Mưa nhiều',
        soilConditions: 'Đất pha cát',
        pestControlMethod: 'Sử dụng thuốc trừ sâu tổng hợp',
        irrigationMethod: 'Tưới đều',
        notes: 'Ghi chú mùa vụ Rau củ',
        marketConditions: 'Thị trường ổn định',
        storageMethod: 'Bảo quản tại kho lạnh',
        harvestingEquipment: 'Công cụ cầm tay',
        fertilizationMethod: 'Sử dụng phân hóa học',
        diseaseControlMethod: 'Phòng trừ bệnh bằng thuốc phun',
        maturityIndex: 'Chỉ số chín muồi: 80%',
        isCertifiedOrganic: false,
        postHarvestTreatment: 'Làm sạch và đóng gói trước khi xuất bán',
        packagingMethod: 'Đóng gói bằng túi nylon',
        transportationMethod: 'Vận chuyển bằng xe tải thường',
        salesChannel: 'Bán tại cửa hàng và chợ địa phương',
        additionalInformation: 'Thông tin thêm mùa vụ Rau củ',
        averageTemperature: 25.0,
        hoursOfSunlight: 10,
        cultivationPractices: 'Sử dụng phương pháp trồng đồng đều',
        fieldPreparationMethod: 'Làm đất bằng máy cày',
        monitoringAndManagement: 'Quan sát và quản lý từ xa',
        trainingAndSupport: 'Chia sẻ kinh nghiệm với nông dân khác',
        fieldConditions: 'Đất ẩm, thoát nước tốt',
      ),
      HarvestSeason(
        name: 'Mùa thu hoạch Cà chua',
        startDate: DateTime(2023, 3, 1),
        endDate: DateTime(2023, 3, 31),
        crop: Crop(name: 'Cà chua'),
        land: Land(name: 'Vườn rau'),
        farmer: 'Người nông dân ',
        totalHarvest: 200.0,
        weatherConditions: 'Nắng nhiều',
        soilConditions: 'Đất pha cát',
        pestControlMethod: 'Sử dụng thuốc trừ sâu tổng hợp',
        irrigationMethod: 'Tưới đều',
        notes: 'Ghi chú mùa vụ Cà chua',
        marketConditions: 'Thị trường ổn định',
        storageMethod: 'Bảo quản tại kho lạnh',
        harvestingEquipment: 'Công cụ cầm tay',
        fertilizationMethod: 'Sử dụng phân hóa học',
        diseaseControlMethod: 'Phòng trừ bệnh bằng thuốc phun',
        maturityIndex: 'Chỉ số chín muồi: 85%',
        isCertifiedOrganic: false,
        postHarvestTreatment: 'Làm sạch và đóng gói trước khi xuất bán',
        packagingMethod: 'Đóng gói bằng túi nylon',
        transportationMethod: 'Vận chuyển bằng xe tải thường',
        salesChannel: 'Bán tại cửa hàng và chợ địa phương',
        additionalInformation: 'Thông tin thêm mùa vụ Cà chua',
        averageTemperature: 26.0,
        hoursOfSunlight: 9,
        cultivationPractices: 'Sử dụng phương pháp trồng đồng đều',
        fieldPreparationMethod: 'Làm đất bằng máy cày',
        monitoringAndManagement: 'Quan sát và quản lý từ xa',
        trainingAndSupport: 'Chia sẻ kinh nghiệm với nông dân khác',
        fieldConditions: 'Đất ẩm, thoát nước tốt',
      ),
      HarvestSeason(
        name: 'Mùa thu hoạch Bắp cải',
        startDate: DateTime(2023, 4, 1),
        endDate: DateTime(2023, 4, 30),
        crop: Crop(name: 'Bắp cải'),
        land: Land(name: 'Vườn rau'),
        farmer: 'Người nông dân ',
        totalHarvest: 150.0,
        weatherConditions: 'Nắng nhiều',
        soilConditions: 'Đất pha cát',
        pestControlMethod: 'Sử dụng thuốc trừ sâu tổng hợp',
        irrigationMethod: 'Tưới đều',
        notes: 'Ghi chú mùa vụ Bắp cải',
        marketConditions: 'Thị trường ổn định',
        storageMethod: 'Bảo quản tại kho lạnh',
        harvestingEquipment: 'Công cụ cầm tay',
        fertilizationMethod: 'Sử dụng phân hóa học',
        diseaseControlMethod: 'Phòng trừ bệnh bằng thuốc phun',
        maturityIndex: 'Chỉ số chín muồi: 80%',
        isCertifiedOrganic: false,
        postHarvestTreatment: 'Làm sạch và đóng gói trước khi xuất bán',
        packagingMethod: 'Đóng gói bằng túi nylon',
        transportationMethod: 'Vận chuyển bằng xe tải thường',
        salesChannel: 'Bán tại cửa hàng và chợ địa phương',
        additionalInformation: 'Thông tin thêm mùa vụ Bắp cải',
        averageTemperature: 26.5,
        hoursOfSunlight: 9,
        cultivationPractices: 'Sử dụng phương pháp trồng đồng đều',
        fieldPreparationMethod: 'Làm đất bằng máy cày',
        monitoringAndManagement: 'Quan sát và quản lý từ xa',
        trainingAndSupport: 'Chia sẻ kinh nghiệm với nông dân khác',
        fieldConditions: 'Đất ẩm, thoát nước tốt',
      ),
      HarvestSeason(
        name: 'Mùa thu hoạch Dưa hấu',
        startDate: DateTime(2023, 5, 1),
        endDate: DateTime(2023, 5, 31),
        crop: Crop(name: 'Dưa hấu'),
        land: Land(name: 'Khu vườn'),
        farmer: 'Người nông dân khác',
        totalHarvest: 100.0,
        weatherConditions: 'Nắng nhiều',
        soilConditions: 'Đất pha cát',
        pestControlMethod: 'Sử dụng thuốc trừ sâu tổng hợp',
        irrigationMethod: 'Tưới đều',
        notes: 'Ghi chú mùa vụ Dưa hấu',
        marketConditions: 'Thị trường ổn định',
        storageMethod: 'Bảo quản tại kho lạnh',
        harvestingEquipment: 'Công cụ cầm tay',
        fertilizationMethod: 'Sử dụng phân hóa học',
        diseaseControlMethod: 'Phòng trừ bệnh bằng thuốc phun',
        maturityIndex: 'Chỉ số chín muồi: 85%',
        isCertifiedOrganic: false,
        postHarvestTreatment: 'Làm sạch và đóng gói trước khi xuất bán',
        packagingMethod: 'Đóng gói bằng túi nylon',
        transportationMethod: 'Vận chuyển bằng xe tải thường',
        salesChannel: 'Bán tại cửa hàng và chợ địa phương',
        additionalInformation: 'Thông tin thêm mùa vụ Dưa hấu',
        averageTemperature: 27.0,
        hoursOfSunlight: 10,
        cultivationPractices: 'Sử dụng phương pháp trồng đồng đều',
        fieldPreparationMethod: 'Làm đất bằng máy cày',
        monitoringAndManagement: 'Quan sát và quản lý từ xa',
        trainingAndSupport: 'Chia sẻ kinh nghiệm với nông dân khác',
        fieldConditions: 'Đất ẩm, thoát nước tốt',
      ),
    ];
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Thu hoạch',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        builder: (context) {
                          return const Showbottomcrops();
                        },
                      );
                    },
                    child: const Text(
                      'Tạo mới',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.separated(
                separatorBuilder: (context, index) => const CommonDivider(),
                itemCount: harvestSeasons.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      MaterialPageRoute(
                        builder: (context) => HarvestSeasonDetailScreen(
                          harvestSeason: harvestSeasons[index],
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                    harvestSeasons[index].crop.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset("assets/icons/pen.png",
                                    width: 20),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset("assets/icons/add.png",
                                    width: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 90,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        harvestSeasons[index].name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        harvestSeasons[index].marketConditions,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 140,
                                  color: Colors.green,
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Đang tiến hành",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/icons/next.png",
                                  height: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
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

class HarvestSeasonDetailScreen extends StatelessWidget {
  final HarvestSeason harvestSeason;

  HarvestSeasonDetailScreen({required this.harvestSeason});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết mùa vụ",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên mùa vụ: ${harvestSeason.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Ngày bắt đầu: ${harvestSeason.startDate}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Ngày kết thúc: ${harvestSeason.endDate}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Người nông dân: ${harvestSeason.farmer}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Tổng lượng thu hoạch: ${harvestSeason.totalHarvest}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Điều kiện thời tiết: ${harvestSeason.weatherConditions}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Điều kiện đất: ${harvestSeason.soilConditions}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Phương pháp kiểm soát sâu bệnh: ${harvestSeason.pestControlMethod}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Phương pháp tưới tiêu: ${harvestSeason.irrigationMethod}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              // ... (hiển thị các thông tin mới khác)
              SizedBox(height: 10),
              Text(
                'Ghi chú: ${harvestSeason.notes}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Điều kiện thị trường: ${harvestSeason.marketConditions}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Phương pháp bảo quản: ${harvestSeason.storageMethod}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Thiết bị thu hoạch: ${harvestSeason.harvestingEquipment}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              // ... (hiển thị các thông tin mới khác)
              SizedBox(height: 10),
              Text(
                'Thông tin hữu cơ: ${harvestSeason.isCertifiedOrganic ? 'Có' : 'Không'}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Xử lý sau thu hoạch: ${harvestSeason.postHarvestTreatment}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Phương pháp đóng gói: ${harvestSeason.packagingMethod}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Phương tiện vận chuyển: ${harvestSeason.transportationMethod}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Kênh bán hàng: ${harvestSeason.salesChannel}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Thông tin thêm: ${harvestSeason.additionalInformation}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              // ... (hiển thị các thông tin mới khác)
              SizedBox(height: 10),
              Text(
                'Nhiệt độ trung bình: ${harvestSeason.averageTemperature} °C',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Số giờ nắng: ${harvestSeason.hoursOfSunlight} giờ',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Phương pháp canh tác: ${harvestSeason.cultivationPractices}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Phương pháp chuẩn bị đất: ${harvestSeason.fieldPreparationMethod}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Quản lý và giám sát: ${harvestSeason.monitoringAndManagement}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Đào tạo và hỗ trợ: ${harvestSeason.trainingAndSupport}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Điều kiện đất: ${harvestSeason.fieldConditions}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              // ... (hiển thị các thông tin mới khác)
            ],
          ),
        ),
      ),
    );
  }
}
