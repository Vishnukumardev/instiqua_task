import '../../utils/path_provider.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ///------Controllers------///]
  late TabController tabController;

  ///------Api------///
  final DashboardApi dashboardApi = Get.put(DashboardApi());

  ///------Variables------///
  int counter = 5;
  int navIndex = 0;
  bool isLoading = false;

  ///------Models------///
  StudentCountModel studentCount = StudentCountModel.empty();
  CoachUpcomingEventListModel coachUpcomingEventList =
      CoachUpcomingEventListModel.empty();
  LeaderBoardMenisListModel leaderBoardMenisList =
      LeaderBoardMenisListModel.empty();
  LeaderBoardMenisListModel leaderBoardJuniorsList =
      LeaderBoardMenisListModel.empty();

  ///------Functions------///
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    studentCount = StudentCountModel.empty();
    coachUpcomingEventList = CoachUpcomingEventListModel.empty();
    leaderBoardMenisList = LeaderBoardMenisListModel.empty();
    leaderBoardJuniorsList = LeaderBoardMenisListModel.empty();
    await fetchApi();
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> fetchApi() async {
    isLoading = true;
    update();
    studentCount = await dashboardApi.fetchStudentCount();
    coachUpcomingEventList = await dashboardApi.fetchCoachUpcomingEventList();
    leaderBoardMenisList = await dashboardApi.fetchLeaderBoardMenisList();
    leaderBoardJuniorsList = await dashboardApi.fetchLeaderBoardJuniorsList();
    isLoading = false;
    update();
  }

  void switchIndex(int index) {
    navIndex = index;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
}
