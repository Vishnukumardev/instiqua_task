import '../../utils/path_provider.dart';

class DashboardApi {
  final Apihelper apihelper = Get.put(Apihelper());

  Future<StudentCountModel> fetchStudentCount() async {
    final response = await apihelper.getRequest(studentCount);
    return StudentCountModel.fromJson(response);
  }

  Future<CoachUpcomingEventListModel> fetchCoachUpcomingEventList() async {
    final response = await apihelper.getRequest(upcomingEventList);
    return CoachUpcomingEventListModel.fromJson(response);
  }

  Future<LeaderBoardMenisListModel> fetchLeaderBoardMenisList() async {
    final response = await apihelper.getRequest(leaderBoardMinis);
    return LeaderBoardMenisListModel.fromJson(response);
  }

  Future<LeaderBoardMenisListModel> fetchLeaderBoardJuniorsList() async {
    final response = await apihelper.getRequest(leaderBoardJuniors);
    return LeaderBoardMenisListModel.fromJson(response);
  }
}
