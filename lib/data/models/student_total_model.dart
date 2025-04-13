class StudentCountModel {
  String status;
  StudentTotalModel data;

  StudentCountModel({required this.status, required this.data});

  factory StudentCountModel.fromJson(Map<String, dynamic> json) {
    return StudentCountModel(
      status: json["status"],
      data: StudentTotalModel.fromJson(json["data"]),
    );
  }
  static StudentCountModel empty() {
    return StudentCountModel(status: "", data: StudentTotalModel.empty());
  }
}

class StudentTotalModel {
  int totalStudents;

  StudentTotalModel({required this.totalStudents});

  factory StudentTotalModel.fromJson(Map<String, dynamic> json) {
    return StudentTotalModel(totalStudents: json["total_students"]);
  }

  static StudentTotalModel empty() {
    return StudentTotalModel(totalStudents: 0);
  }
}
