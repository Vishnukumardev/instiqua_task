import '../../utils/path_provider.dart';

class DashboardApi {
  final Apihelper apihelper = Get.put(Apihelper());

  Future<StudentCountModel> fetchStudentCount() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await apihelper.getRequest(studentCount);
    return StudentCountModel.fromJson(response);
  }

  Future<CoachUpcomingEventListModel> fetchCoachUpcomingEventList() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await apihelper.getRequest(upcomingEventList);
    return CoachUpcomingEventListModel.fromJson(response);
  }

  Future<LeaderBoardMenisListModel> fetchLeaderBoardMenisList() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await apihelper.getRequest(leaderBoardMinis);
    return LeaderBoardMenisListModel.fromJson(response);
  }

  Future<LeaderBoardMenisListModel> fetchLeaderBoardJuniorsList() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await apihelper.getRequest(leaderBoardJuniors);
    return LeaderBoardMenisListModel.fromJson(response);
  }
}
