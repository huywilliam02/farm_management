import 'package:get/get.dart';

import '../../presentation/controllers/account/bindings/account_binding.dart';
import '../../presentation/controllers/agricultural_products/agricultural_products_binding.dart';
import '../../presentation/controllers/area/view_area_binding.dart';
import '../../presentation/controllers/bill_farm/bill_farm_binding.dart';
import '../../presentation/controllers/chart/chart_quanlity/chart_quanlity_binding.dart';
import '../../presentation/controllers/chart/chart_resources/chart_resources_binding.dart';
import '../../presentation/controllers/chart/chart_user/chart_user_binding.dart';
import '../../presentation/controllers/chart/chart_warehouse/chart_warehouse_binding.dart';
import '../../presentation/controllers/chat_ai/chat_ai_binding.dart';
import '../../presentation/controllers/choose_language/choose_language_binding.dart';
import '../../presentation/controllers/client_farm/client_farm_binding.dart';
import '../../presentation/controllers/contract/contact_binding.dart';
import '../../presentation/controllers/crops_farm/crops_farm_binding.dart';
import '../../presentation/controllers/cropseason/cropseason_binding.dart';
import '../../presentation/controllers/customer/customer_binding.dart';
import '../../presentation/controllers/document/document_binding.dart';
import '../../presentation/controllers/edit_profile/edit_profile_binding.dart';
import '../../presentation/controllers/farm/farm_binding.dart';
import '../../presentation/controllers/farming_calendar/farming_calendar_binding.dart';
import '../../presentation/controllers/fundnumber/fundnumber_binding.dart';
import '../../presentation/controllers/harvestdiary/harvestdiary_binding.dart';
import '../../presentation/controllers/home/home_binding.dart';
import '../../presentation/controllers/ingredients/ingredients_binding.dart';
import '../../presentation/controllers/library_image/library_image_binding.dart';
import '../../presentation/controllers/login/login_binding.dart';
import '../../presentation/controllers/main_tabview/main_tabview_binding.dart';
import '../../presentation/controllers/material/material_binding.dart';
import '../../presentation/controllers/otherobject/otherobject_binding.dart';
import '../../presentation/controllers/planttracking/planttracking_binding.dart';
import '../../presentation/controllers/requestform/requestform_binding.dart';
import '../../presentation/controllers/setting_language/setting_language_binding.dart';
import '../../presentation/controllers/shoppings/shoppings_binding.dart';
import '../../presentation/controllers/sign_up/sign_up_binding.dart';
import '../../presentation/controllers/start_app/start_app_binding.dart';
import '../../presentation/controllers/supplier/supplier_binding.dart';
import '../../presentation/controllers/unitfarm/unitfarm_binding.dart';
import '../../presentation/controllers/view_landfull/view_landfull_binding.dart';
import '../../presentation/controllers/viewfull/view_full_binding.dart';
import '../../presentation/controllers/wage/wage_binding.dart';
import '../../presentation/controllers/warehouse/storewarehouse/storewarehouse_binding.dart';
import '../../presentation/controllers/warehouse/warehouse_binding.dart';
import '../../presentation/controllers/workinday/workinday_binding.dart';
import '../../presentation/page/account/account_view.dart';
import '../../presentation/page/agricultural_products/agricultural_products_view.dart';
import '../../presentation/page/area/more_area/more_land_view.dart';
import '../../presentation/page/area/view_area/view_area_view.dart';
import '../../presentation/page/area/view_more_area/view_more_land_view.dart';
import '../../presentation/page/bill_farm/bill_farm_view.dart';
import '../../presentation/page/chart/chart_quanlity/chart_quanlity_view.dart';
import '../../presentation/page/chart/chart_resources/chart_resources_view.dart';
import '../../presentation/page/chart/chart_user/chart_user_view.dart';
import '../../presentation/page/chart/chart_warehouse/chart_warehouse_view.dart';
import '../../presentation/page/chat_ai/chat_ai_view.dart';
import '../../presentation/page/choose_language/choose_language_view.dart';
import '../../presentation/page/client_farm/client_farm_view.dart';
import '../../presentation/page/contract/contact_view.dart';
import '../../presentation/page/crops_farm/crops_farm_view.dart';
import '../../presentation/page/cropseason/cropseason_view.dart';
import '../../presentation/page/customer/customer_view.dart';
import '../../presentation/page/document/document_view.dart';
import '../../presentation/page/edit_profile/edit_profile_view.dart';
import '../../presentation/page/farm/farm_view.dart';
import '../../presentation/page/farming_calendar/view-all-schedule.dart';
import '../../presentation/page/fundnumber/fundnumber_view.dart';
import '../../presentation/page/harvestdiary/harvestdiary_view.dart';
import '../../presentation/page/home/home_view.dart';
import '../../presentation/page/ingredients/ingredients_view.dart';
import '../../presentation/page/library_image/library_image_view.dart';
import '../../presentation/page/login/login_page.dart';
import '../../presentation/page/main_tabview/main_tabview_view.dart';
import '../../presentation/page/material/material_view.dart';
import '../../presentation/page/otherobject/otherobject_view.dart';
import '../../presentation/page/planttracking/planttracking_view.dart';
import '../../presentation/page/requestform/requestform_page.dart';
import '../../presentation/page/setting_language/setting_language_view.dart';
import '../../presentation/page/shoppings/shoppings_view.dart';
import '../../presentation/page/sign_up/sign_up_view.dart';
import '../../presentation/page/start_app/start_app_view.dart';
import '../../presentation/page/supplier/supplier_view.dart';
import '../../presentation/page/unitfarm/unitfarm_view.dart';
import '../../presentation/page/viewfull/view_full_view.dart';
import '../../presentation/page/viewlandfull/more_landdivision/land_division_view.dart';
import '../../presentation/page/viewlandfull/tab_viewland/view_land_view.dart';
import '../../presentation/page/viewlandfull/tab_viewlandfull/view_landfull_view.dart';
import '../../presentation/page/wage/wage_view.dart';
import '../../presentation/page/wage/workersalaryviews/workersalary_view.dart';
import '../../presentation/page/warehouse/pages/warehouse_view.dart';
import '../../presentation/page/warehouse/storewarehouse/views/storewarehouse_view.dart';
import '../../presentation/page/workinday/workinday_view.dart';
import '../../presentation/controllers/news/news_binding.dart';
import '../../presentation/page/news/news_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.START_APP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_TABVIEW,
      page: () => MainTabView(),
      binding: MainTabviewBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.MORE_LAND,
      page: () => const MoreLandView(),
      binding: ViewAreaBinding(),
    ),
    GetPage(
      name: _Paths.LAND_DIVISION,
      page: () => const LandDivisionView(),
      binding: ViewLandfullBinding(),
    ),
    GetPage(
      name: _Paths.START_APP,
      page: () => const StartAppView(),
      binding: StartAppBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LANGUAGE,
      page: () => const ChooseLanguageView(),
      binding: ChooseLanguageBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_MORE_LAND,
      page: () => const ViewMoreLandView(),
      binding: ViewAreaBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_FULL,
      page: () => const ViewFullView(),
      binding: ViewFullBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_LANDFULL,
      page: () => const ViewLandfullView(),
      binding: ViewLandfullBinding(),
    ),
    GetPage(
      name: _Paths.FARMING_CALENDAR,
      page: () => const ViewAllSchedule(),
      binding: FarmingCalendarBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_LAND,
      page: () => const ViewLandView(),
      binding: ViewLandfullBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_AREA,
      page: () => const ViewAreaView(),
      binding: ViewAreaBinding(),
    ),
    GetPage(
      name: _Paths.FARM,
      page: () => const FarmView(),
      binding: FarmBinding(),
    ),
    GetPage(
      name: _Paths.WAGE,
      page: () => const WageView(),
      binding: WageBinding(),
    ),
    GetPage(
      name: _Paths.WORKERSALARY,
      page: () => const WorkersalaryView(),
      binding: WageBinding(),
    ),
    GetPage(
      name: _Paths.FUNDNUMBER,
      page: () => const FundnumberView(),
      binding: FundnumberBinding(),
    ),
    GetPage(
      name: _Paths.WAREHOUSE,
      page: () => const WarehouseView(),
      binding: WarehouseBinding(),
    ),
    GetPage(
      name: _Paths.STOREWAREHOUSE,
      page: () => const StorewarehouseView(),
      binding: StorewarehouseBinding(),
    ),
    GetPage(
      name: _Paths.SUPPLIER,
      page: () => SupplierView(),
      binding: SupplierBinding(),
    ),
    GetPage(
      name: _Paths.UNITFARM,
      page: () => const UnitfarmView(),
      binding: UnitfarmBinding(),
    ),
    GetPage(
      name: _Paths.CROPS_FARM,
      page: () => const CropsFarmView(),
      binding: CropsFarmBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPINGS,
      page: () => const ShoppingsView(),
      binding: ShoppingsBinding(),
    ),
    GetPage(
      name: _Paths.REQUESTFORM,
      page: () => const RequestformViewAll(),
      binding: RequestformBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER,
      page: () => const CustomerView(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: _Paths.PLANTTRACKING,
      page: () => const PlanttrackingView(),
      binding: PlanttrackingBinding(),
    ),
    GetPage(
      name: _Paths.HARVESTDIARY,
      page: () => const HarvestdiaryView(),
      binding: HarvestdiaryBinding(),
    ),
    GetPage(
      name: _Paths.CROPSEASON,
      page: () => const CropseasonView(),
      binding: CropseasonBinding(),
    ),
    GetPage(
      name: _Paths.BILL_FARM,
      page: () => const BillFarmView(),
      binding: BillFarmBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT_FARM,
      page: () => const ClientFarmView(),
      binding: ClientFarmBinding(),
    ),
    GetPage(
      name: _Paths.OTHEROBJECT,
      page: () => const OtherobjectView(),
      binding: OtherobjectBinding(),
    ),
    GetPage(
      name: _Paths.WORKINDAY,
      page: () => const WorkindayView(),
      binding: WorkindayBinding(),
    ),
    GetPage(
      name: _Paths.MATERIAL,
      page: () => const MaterialView(),
      binding: MaterialBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY_IMAGE,
      page: () => const LibraryImageView(),
      binding: LibraryImageBinding(),
    ),
    GetPage(
      name: _Paths.INGREDIENTS,
      page: () => const IngredientsView(),
      binding: IngredientsBinding(),
    ),
    GetPage(
      name: _Paths.AGRICULTURAL_PRODUCTS,
      page: () => const AgriculturalProductsView(),
      binding: AgriculturalProductsBinding(),
    ),
    GetPage(
      name: _Paths.CHART_RESOURCES,
      page: () => const ChartResourcesView(),
      binding: ChartResourcesBinding(),
    ),
    GetPage(
      name: _Paths.CHART_QUANLITY,
      page: () => const ChartQuanlityView(),
      binding: ChartQuanlityBinding(),
    ),
    GetPage(
      name: _Paths.CHART_USER,
      page: () => const ChartUserView(),
      binding: ChartUserBinding(),
    ),
    GetPage(
      name: _Paths.CHART_WAREHOUSE,
      page: () => const ChartWarehouseView(),
      binding: ChartWarehouseBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT,
      page: () => const DocumentView(),
      binding: DocumentBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_LANGUAGE,
      page: () => const SettingLanguageView(),
      binding: SettingLanguageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_AI,
      page: () => const ChatAiView(),
      binding: ChatAiBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
  ];
}
