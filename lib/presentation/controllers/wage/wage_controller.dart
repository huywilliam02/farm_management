import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';

class WageController extends BaseController {
  //TODO: Implement WageController

  final count = 0.obs;

  final List<WageModel> wageList = [
    WageModel(
      period: '8/1/2023 - 8/31/2023',
      workers: 5,
      status: 'Chưa hoàn thành',
      totalSalary: '50,800,000 đ',
      bonus: '2,000,000 đ',
      deductions: '1,000,000 đ',
      netSalary: '51,800,000 đ',
      notes: 'Chưa thanh toán',
    ),
    WageModel(
      period: '7/1/2023 - 7/31/2023',
      workers: 5,
      status: 'Đã hoàn thành',
      totalSalary: '40,800,000 đ',
      bonus: '1,500,000 đ',
      deductions: '800,000 đ',
      netSalary: '41,500,000 đ',
      notes: 'Đã thanh toán',
    ),
    // Thêm 10 dữ liệu mới
    WageModel(
      period: '6/1/2023 - 6/30/2023',
      workers: 5,
      status: 'Chưa hoàn thành',
      totalSalary: '55,800,000 đ',
      bonus: '2,500,000 đ',
      deductions: '1,200,000 đ',
      netSalary: '56,100,000 đ',
      notes: 'Chưa thanh toán',
    ),
    WageModel(
      period: '5/1/2023 - 5/31/2023',
      workers: 4,
      status: 'Đã hoàn thành',
      totalSalary: '31,300,000 đ',
      bonus: '1,000,000 đ',
      deductions: '500,000 đ',
      netSalary: '31,800,000 đ',
      notes: 'Chưa thanh toán',
    ),
    WageModel(
      period: '4/1/2023 - 4/30/2023',
      workers: 6,
      status: 'Chưa hoàn thành',
      totalSalary: '60,000,000 đ',
      bonus: '2,000,000 đ',
      deductions: '1,500,000 đ',
      netSalary: '60,500,000 đ',
      notes: 'Đã thanh toán',
    ),
    WageModel(
      period: '3/1/2023 - 3/31/2023',
      workers: 5,
      status: 'Đã hoàn thành',
      totalSalary: '45,800,000 đ',
      bonus: '1,800,000 đ',
      deductions: '900,000 đ',
      netSalary: '46,700,000 đ',
      notes: 'Chưa thanh toán',
    ),
    WageModel(
      period: '2/1/2023 - 2/28/2023',
      workers: 4,
      status: 'Chưa hoàn thành',
      totalSalary: '40,000,000 đ',
      bonus: '1,500,000 đ',
      deductions: '800,000 đ',
      netSalary: '40,700,000 đ',
      notes: 'Chưa thanh toán',
    ),
    WageModel(
      period: '1/1/2023 - 1/31/2023',
      workers: 6,
      status: 'Đã hoàn thành',
      totalSalary: '55,000,000 đ',
      bonus: '2,500,000 đ',
      deductions: '1,200,000 đ',
      netSalary: '55,300,000 đ',
      notes: 'Đã thanh toán',
    ),
    WageModel(
      period: '12/1/2022 - 12/31/2022',
      workers: 5,
      status: 'Chưa hoàn thành',
      totalSalary: '50,800,000 đ',
      bonus: '2,000,000 đ',
      deductions: '1,000,000 đ',
      netSalary: '51,800,000 đ',
      notes: 'Chưa thanh toán',
    ),
    WageModel(
      period: '11/1/2022 - 11/30/2022',
      workers: 4,
      status: 'Đã hoàn thành',
      totalSalary: '40,000,000 đ',
      bonus: '1,500,000 đ',
      deductions: '800,000 đ',
      netSalary: '40,700,000 đ',
      notes: 'Chưa thanh toán',
    ),
    // Thêm 10 dữ liệu mới ở đây
  ];

  final selectedWage = Rx<WageModel?>(null);

  void selectWage(WageModel wage) {
    selectedWage.value = wage;
  }

  void increment() => count.value++;
}

class WageModel {
  final String period;
  final int workers;
  final String status;
  final String totalSalary;
  final String bonus;
  final String deductions;
  final String netSalary;
  final String notes;

  WageModel({
    required this.period,
    required this.workers,
    required this.status,
    required this.totalSalary,
    required this.bonus,
    required this.deductions,
    required this.netSalary,
    required this.notes,
  });
}
