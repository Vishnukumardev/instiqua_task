class LeaderBoardMenisListModel {
  String status;
  List<ProfileListModel> data;

  LeaderBoardMenisListModel({required this.status, required this.data});

  factory LeaderBoardMenisListModel.fromJson(Map<String, dynamic> json) {
    return LeaderBoardMenisListModel(
      status: json["status"],
      data: List<ProfileListModel>.from(
        json["data"].map((x) => ProfileListModel.fromJson(x)),
      ),
    );
  }

  static LeaderBoardMenisListModel empty() {
    return LeaderBoardMenisListModel(
      status: "",
      data: List<ProfileListModel>.empty(),
    );
  }
}

class ProfileListModel {
  int rank;
  String studentName;
  int match;
  String profile;
  int percentage;

  ProfileListModel({
    required this.rank,
    required this.studentName,
    required this.match,
    required this.profile,
    required this.percentage,
  });

  factory ProfileListModel.fromJson(Map<String, dynamic> json) {
    return ProfileListModel(
      rank: json["rank"],
      studentName: json["student_name"],
      match: json["match"],
      profile: json["profile"],
      percentage: json["percentage"],
    );
  }
  static ProfileListModel empty() {
    return ProfileListModel(
      rank: 0,
      studentName: "",
      match: 0,
      profile: "",
      percentage: 0,
    );
  }
}
