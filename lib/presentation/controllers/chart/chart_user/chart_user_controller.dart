import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/presentation/page/chart/chart_user/chart_user_view.dart';

class ChartUserController extends BaseController {
  //TODO: Implement ChartUserController
  late EmployeeDataSource employeeDataSource;

  List<Employee> employees = <Employee>[];

  @override

  List<Employee> getEmployeeData() {
    return [
      Employee(1, 'Đặng Văn Huy', 'Admin', 'admin1@gmail.com', 0337686846),
      Employee(2, 'Nguyễn Văn Nhơn', 'Admin','admin2@gmail.com', 0337785674),
      Employee(3, 'Nguyễn Đức Thiên', 'Admin', 'admin3@gmail.com',0344568994),
      Employee(4, 'Nguyên Thiên Ân', 'Admin', 'admin4@gmail.com',0994375945),
      Employee(5, 'Hoàng Hải Dương', 'Admin','admin5@gmail.com', 0892342293),
      Employee(6, 'Võ Đình Việt', 'Admin','admin6@gmail.com', 0337686846),
      Employee(7, 'Nguyễn Thị Vy', 'user','vythinguyen@gmail.com', 0934234932),
      Employee(8, 'Nguyễn Minh Phúc', 'user','phuclhu@gmail.com', 0394284981),
      Employee(9, 'Võ Đình Phương', 'user', 'phuonglhu@gmail.com',0923419011),
      Employee(10, 'Nguyễn Mạnh Hùng', 'user','hunglhu@gmail.com', 0912034192)
    ];
  }
  final count = 0.obs;
  @override
  void onInit() {
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeDataa: employees);
    super.onInit();
  }



  void increment() => count.value++;
}
