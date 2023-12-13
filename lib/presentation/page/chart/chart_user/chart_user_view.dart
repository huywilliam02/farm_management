import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../controllers/chart/chart_user/chart_user_controller.dart';

class ChartUserView extends BaseView<ChartUserController> {
  const ChartUserView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstant.background_color,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () async {
                          Get.back();
                        },
                      )),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        'Thống kê người dùng',
                        style: GoogleFonts.roboto(
                          // textStyle: Theme.of(context).textTheme.displayLarge,
                          textStyle: TextStyleConstant.black22RobotoBold,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            ),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            Expanded(
              flex: 9,
              child: SfDataGrid(
                source: controller.employeeDataSource,
                columnWidthMode: ColumnWidthMode.auto,
                columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
                tableSummaryRows: [
                  GridTableSummaryRow(
                      showSummaryInRow: true,
                      title: 'Tổng người dùng: 2000 người dùng',
                      columns: [
                        const GridSummaryColumn(
                            name: 'Sum',
                            columnName: 'salary',
                            summaryType: GridSummaryType.sum)
                      ],
                      position: GridTableSummaryRowPosition.bottom)
                ],
                columns: [
                  GridColumn(
                      columnName: 'id',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'ID',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'name',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Họ và tên',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'email',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Gmail',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'designation',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Phân quyền',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'salary',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Số điện thoại',
                            overflow: TextOverflow.ellipsis,
                          ))),
                ],
                selectionMode: SelectionMode.multiple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Employee {
  Employee(this.id, this.name, this.designation,this.gmail, this.salary);
  final int id;
  final String name;
  final String gmail;
  final String designation;
  final int salary;
}
class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employeeDataa}) {
    employeeData = employeeDataa
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(columnName: 'gmail', value: e.gmail),
      DataGridCell<String>(
          columnName: 'designation', value: e.designation),
      DataGridCell<int>(columnName: 'salary', value: e.salary),
    ]))
        .toList();
  }

  List<DataGridRow> employeeData = [];

  @override
  List<DataGridRow> get rows => employeeData;

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Text(summaryValue),
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}