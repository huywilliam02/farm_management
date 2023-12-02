import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/presentation/page/workinday/more_workinday.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../presentation/controllers/workinday/workinday_controller.dart';

class CalendarWorkindayView extends BaseView<WorkindayController> {
  const CalendarWorkindayView({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        await Get.find<WorkindayController>().refeshData();
      },
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: "Lịch công việc",
          titleType: AppBarTitle.text,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          leadingIcon: const Icon(Icons.arrow_back_ios_new),
          onLeadingPressed: () {
            Get.back();
          },
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.refeshForm();
                Get.to(() => MoreWorkInDayView());
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const CommonDivider(),
              Expanded(
                flex: 6,
                child: SfCalendar(
                  todayHighlightColor: Colors.green,
                  showNavigationArrow: true,
                  view: CalendarView.month,
                  showWeekNumber: true,
                  selectionDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                  ),
                  firstDayOfWeek: 1,
                  dataSource: _getDataSource(),
                  monthViewSettings: const MonthViewSettings(
                    dayFormat: "E",
                    showAgenda: true,
                    agendaViewHeight: 200,
                    // hiện thể tap
                    // appointmentDisplayMode:
                    //     MonthAppointmentDisplayMode.appointment,
                  ),
                  scheduleViewSettings: const ScheduleViewSettings(
                    appointmentItemHeight: 70,
                  ),
                  resourceViewSettings: const ResourceViewSettings(
                    visibleResourceCount: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_DataSource _getDataSource() {
  final List<Appointment> meetings = <Appointment>[];
  // return meetings;
  meetings.add(
    Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
      endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
      subject: 'Tưới rau',
      color: Colors.lightBlueAccent,
    ),
  );
  meetings.add(
    Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
      endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
      subject: 'Đi họp với doanh nghiệp',
      color: Colors.green,
    ),
  );
  meetings.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 2, days: -2)),
    endTime: DateTime.now().add(const Duration(hours: 4, days: -2)),
    subject: 'Cho vật nuôi ăn',
    color: Colors.amber,
  ));
  meetings.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 6, days: -3)),
    endTime: DateTime.now().add(const Duration(hours: 7, days: -3)),
    subject: 'Lắp ráp thiết bị',
    color: Colors.green,
  ));
  meetings.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
    endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
    subject: 'Dọn dẹp kho thực phẩm',
    color: Colors.purple,
  ));
  return _DataSource(meetings);
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }
//
//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }
//
//   @override
//   String getSubject(int index) {
//     return appointments![index].eventName;
//   }
//
//   @override
//   Color getColor(int index) {
//     return appointments![index].background;
//   }
//
//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }
//

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Appointment> shiftCollection,
//       List<CalendarResource> employeeCalendarResource) {
//     appointments = shiftCollection;
//     resources = employeeCalendarResource;
//   }
// }
