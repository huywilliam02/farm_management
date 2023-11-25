import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/data/model/crops/crop.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:itfsd/data/model/workinday/workindayDetail.dart';
import 'package:itfsd/data/model/workinday/workinday_model.dart';
import 'package:itfsd/data/network/api/Workinday/workinday_api.dart';
import 'package:itfsd/presentation/page/workinday/more_workinday.dart';
import 'package:itfsd/presentation/page/workinday/workinday_view.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class WorkindayController extends BaseController {
  Rx<String> landId = ''.obs;
  Rx<String> cropId = ''.obs;
  Rx<String> implementat = ''.obs;
  Rx<String> completedat = ''.obs;
  Rx<String> job = ''.obs;
  Rx<String> description = ''.obs;

  TextEditingController landIdController = TextEditingController();
  TextEditingController cropIdController = TextEditingController();
  TextEditingController implementatController = TextEditingController();
  TextEditingController completedatController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Rx<DateTime> dateStartChoose = DateTime.now().obs;

  RxList<LandDivision> listLand = <LandDivision>[].obs;
  RxList<CropsDetail> listCropsFarm = <CropsDetail>[].obs;
  Rx<LandDivision> landChoose = LandDivision().obs;
  Rx<CropsDetail> cropsDetailChoose = CropsDetail().obs;
  final count = 0.obs;

  RxList<WorkindayDetail> listWorkinday = <WorkindayDetail>[].obs;
  RxList<WorkindayDetail> listToView = <WorkindayDetail>[].obs;

  TextEditingController searchController = TextEditingController(text: '');
  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController workinDayScrollController = ScrollController();

  late List<Appointment> _shiftCollection;
  late List<CalendarResource> _employeeCalendarResource;
  late List<TimeRegion> specialTimeRegions;

  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      await getAllCropsFarm();
      await refeshData();
      await getAllLandapi();
      addResourceDetails();
      addAppointments();
      addSpecialRegions();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("SomeThingWrong", e.toString());

      log(e.toString());
    }
    workinDayScrollController.addListener(_scrollListener);
    super.onInit();
  }

  void addAppointments() {
    var subjectCollection = [
      'General Meeting',
      'Plan Execution',
      'Project Plan',
      'Consulting',
      'Support',
      'Development Meeting',
      'Scrum',
      'Project Completion',
      'Release updates',
      'Performance Check'
    ];

    var colorCollection = [
      const Color(0xFF0F8644),
      const Color(0xFF8B1FA9),
      const Color(0xFFD20100),
      const Color(0xFFFC571D),
      const Color(0xFF85461E),
      const Color(0xFF36B37B),
      const Color(0xFF3D4FB5),
      const Color(0xFFE47C73),
      const Color(0xFF636363)
    ];

    _shiftCollection = <Appointment>[];
    for (var calendarResource in _employeeCalendarResource) {
      var employeeIds = [calendarResource.id];
      for (int j = 0; j < 365; j++) {
        for (int k = 0; k < 2; k++) {
          final DateTime date = DateTime.now().add(Duration(days: j + k));
          int startHour = 9;
          startHour =
              startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
          final DateTime shiftStartTime =
              DateTime(date.year, date.month, date.day, startHour, 0, 0);
          _shiftCollection.add(
            Appointment(
              startTime: shiftStartTime,
              endTime: shiftStartTime.add(const Duration(hours: 1)),
              subject: subjectCollection[2],
              color: colorCollection[8],
              startTimeZone: '',
              endTimeZone: '',
              resourceIds: employeeIds,
            ),
          );
        }
      }
    }
  }

  void addResourceDetails() {
    var nameCollection = [
      'John',
      'Bryan',
      'Robert',
      'Kenny',
      'Tia',
      'Theresa',
      'Edith',
      'Brooklyn',
      'James William',
      'Sophia',
      'Elena',
      'Stephen',
      'Zoey Addison',
      'Daniel',
      'Emilia',
      'Kinsley Elena',
      'Danieals',
      'William',
      'Addison',
      'Ruby'
    ];

    var userImages = [
      'images/People_Circle5.png',
      'images/People_Circle8.png',
      'images/People_Circle18.png',
      'images/People_Circle23.png',
      'images/People_Circle25.png',
      'images/People_Circle20.png',
      'images/People_Circle13.png',
      'images/People_Circle11.png',
      'images/People_Circle27.png',
      'images/People_Circle26.png',
      'images/People_Circle24.png',
      'images/People_Circle15.png',
    ];

    _employeeCalendarResource = <CalendarResource>[];
    for (var i = 0; i < nameCollection.length; i++) {
      _employeeCalendarResource.add(CalendarResource(
        id: '000$i',
        displayName: nameCollection[i],
        image: i < userImages.length ? ExactAssetImage(userImages[i]) : null,
      ));
    }
  }

  void addSpecialRegions() {
    final DateTime date = DateTime.now();
    specialTimeRegions = [
      TimeRegion(
        startTime: DateTime(date.year, date.month, date.day, 13, 0, 0),
        endTime: DateTime(date.year, date.month, date.day, 14, 0, 0),
        text: 'Lunch',
        resourceIds: _employeeCalendarResource.map((e) => e.id).toList(),
        recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
        enablePointerInteraction: false,
      )
    ];
  }

  void _scrollListener() async {
    if (workinDayScrollController.position.pixels ==
        workinDayScrollController.position.maxScrollExtent) {
      await fetchMoreData();
    }
  }

  fetchMoreData() async {
    try {
      if (noMoreRecord.value) {
      } else {
        indexPage += 1;
        lazyLoading(true);
        await Future.delayed(const Duration(seconds: 1));
        List<WorkindayDetail> listTmp =
            await WorkInDayApi.getAllWorkinday(indexPage);
        if (listTmp.isEmpty) {
          noMoreRecord(true);
        } else {
          listWorkinday.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  chooseLand(LandDivision model) {
    landId(model.id);
    landIdController.text = model.name!;
  }

  chooseCropsFarm(CropsDetail model) {
    cropId(model.id);
    cropIdController.text = model.name!;
  }

  setValueCompletedat(String value) {
    completedat.value = value;
  }

  setValuejob(String value) {
    job.value = value;
  }

  setValueDescription(String value) {
    description.value = value;
  }

  getAllLandapi() async {
    listLand.value = await WorkInDayApi.getAllLand();
    landChoose(listLand.value.first);
    landId(listLand.first.id);
  }

  getAllCropsFarm() async {
    listCropsFarm.value = await WorkInDayApi.getAllCropsFarm();
    cropsDetailChoose(listCropsFarm.value.first);
    cropId(listCropsFarm.first.id);
  }

  showData(WorkindayDetail workindayDetail) {
    refeshForm();
    log(landId(workindayDetail.land!.id));
    log(cropId(workindayDetail.crop!.id));
    landIdController.text = workindayDetail.land!.name.toString();
    cropIdController.text = workindayDetail.crop!.name.toString();
    landId(workindayDetail.land!.id);
    cropId(workindayDetail.crop!.id);
    dateStartChoose.value = workindayDetail.implementAt!;
    completedatController.text = workindayDetail.completedAt!;
    jobController.text = workindayDetail.job!;
    descriptionController.text = workindayDetail.description!;
    Get.to(() => MoreWorkInDayView(idWorkInDay: workindayDetail.id));
  }

  refeshForm() {
    landIdController.text = "";
    cropIdController.text = " ";

    implementatController.text = dateFormat.format(DateTime.now());
    completedatController.text = "";
    jobController.text = "";
    descriptionController.text = "";
  }

  refeshData() async {
    isLoading(true);
    indexPage = 1;
    noMoreRecord(false);
    listWorkinday.value = await WorkInDayApi.getAllWorkinday(indexPage);
    showAll();
    isLoading(false);
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listWorkinday);
  }

  createWorkInDay(String? idWorkInDay) async {
    log(landId.value.toString());
    log(cropId.value.toString());
    log(implementatController.text.toString());
    log(completedatController.text);
    log(jobController.text);
    log(descriptionController.text);

    WorkindayModel formData = WorkindayModel(
      implementAt: DateFormat('yyyy-MM-dd').format(dateStartChoose.value),
      completedAt: completedatController.text,
      job: jobController.text,
      description: descriptionController.text,
      land: landId.value,
      crop: cropId.value,
    );
    bool check = idWorkInDay != null
        ? await WorkInDayApi.updateWorkInday(idWorkInDay, formData)
        : await WorkInDayApi.createWorkInday(
            landId.value, cropId.value, formData);
    if (check) {
      Get.back();
      refeshData();
      Get.snackbar('Thông báo', 'Tạo nhà cung cấp thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo nhà cung cấp không thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  chooseDate(bool isStart) async {
    DateTime dateTime = isStart
        ? dateStartChoose.value
        : dateStartChoose.value.add(const Duration(days: 0));
    await Get.dialog(
      barrierDismissible: true,
      Scaffold(
        backgroundColor: Colors.black.withOpacity(0.4),
        body: SafeArea(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: UtilsReponsive.height(Get.context!, 300),
              width: UtilsReponsive.width(Get.context!, 300),
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  currentDate: DateTime.now(),
                  firstDate: dateTime,
                  calendarType: CalendarDatePicker2Type.single,
                  centerAlignModePicker: true,
                  selectedDayTextStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                  selectedDayHighlightColor: ColorConstant.primary,
                ),
                onValueChanged: (dates) {
                  if (isStart) {
                    dateStartChoose(dates[0]);
                    implementatController.text = dateFormat.format(dates[0]!);
                  }
                  Get.back();
                },
                value: [dateStartChoose.value],
              ),
            ),
          ),
        ),
      ),
    );
  }

  deleteData(String idWorkInDay) async {
    try {
      bool check = await WorkInDayApi.deleteWorkInday(idWorkInDay);
      if (check) {
        refeshData();
        Get.to(() => const WorkindayView());
        Get.snackbar('Thông báo', 'Xóa công việc thành công',
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar('Thông báo', 'Xóa công việc không thành công',
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e){
      
      Get.back();
      Get.snackbar("Lỗi", "Có gì đó không đúng");
    }
  }

  onTypingSearchWorkInDay(String value) async {
    if (value.isNotEmpty) {
      noMoreRecord(true);
      listWorkinday.value = await WorkInDayApi.searchlistWorkindayDetail(value);
    } else {
      refeshData();
    }
  }

  void increment() => count.value++;
}
