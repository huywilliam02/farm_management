import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';

class WorkersalaryController extends BaseController {
  //TODO: Implement WorkersalaryController

  final count = 0.obs;
  final List<WorkerModel> workerList = [
    WorkerModel(
      name: "Đặng Văn Huy",
      workingDays: 25,
      salary: "20,800,000 đ",
      totalEarnings: "28,800,000 đ",
      bonus: "2,000,000 đ",
      deductions: "1,000,000 đ",
      netSalary: "51,800,000 đ",
      notes: "Chưa thanh toán",
    ),
    // Thêm dữ liệu khác nếu cần
    WorkerModel(
      name: "Nguyễn Đức Thiên",
      workingDays: 25,
      salary: "20,800,000 đ",
      totalEarnings: "26,800,000 đ",
      bonus: "1,500,000 đ",
      deductions: "800,000 đ",
      netSalary: "47,500,000 đ",
      notes: "Đã thanh toán",
    ),
    // Thêm dữ liệu khác nếu cần
    WorkerModel(
      name: "Nguyễn Văn Nhơn",
      workingDays: 25,
      salary: "20,800,000 đ",
      totalEarnings: "25,800,000 đ",
      bonus: "1,200,000 đ",
      deductions: "500,000 đ",
      netSalary: "46,500,000 đ",
      notes: "Chưa thanh toán",
    ),
    // Thêm dữ liệu khác nếu cần
    WorkerModel(
      name: "Nguyễn Thiên Ân",
      workingDays: 25,
      salary: "20,800,000 đ",
      totalEarnings: "27,800,000 đ",
      bonus: "2,500,000 đ",
      deductions: "1,200,000 đ",
      netSalary: "54,100,000 đ",
      notes: "Chưa thanh toán",
    ),
    // Thêm dữ liệu khác nếu cần
  ];

  final selectedWorker = Rx<WorkerModel?>(null);

  void selectWorker(WorkerModel worker) {
    selectedWorker.value = worker;
  }
}

class WorkerModel {
  final String name;
  final int workingDays;
  final String salary;
  final String totalEarnings;
  final String bonus;
  final String deductions;
  final String netSalary;
  final String notes;

  WorkerModel({
    required this.name,
    required this.workingDays,
    required this.salary,
    required this.totalEarnings,
    required this.bonus,
    required this.deductions,
    required this.netSalary,
    required this.notes,
  });
}
