class CoachUpcomingEventListModel {
  String status;
  List<EventListModel> data;

  CoachUpcomingEventListModel({required this.status, required this.data});

  factory CoachUpcomingEventListModel.fromJson(Map<String, dynamic> json) {
    return CoachUpcomingEventListModel(
      status: json["status"],
      data: List<EventListModel>.from(
        json["data"].map((x) => EventListModel.fromJson(x)),
      ),
    );
  }

  static CoachUpcomingEventListModel empty() {
    return CoachUpcomingEventListModel(
      status: "",
      data: List<EventListModel>.empty(),
    );
  }
}

class EventListModel {
  int eventId;
  String eventName;
  String date;
  String time;
  String age;
  String ballColour;
  String venue;
  dynamic image;
  String entryLink;
  String publishDate;

  EventListModel({
    required this.eventId,
    required this.eventName,
    required this.date,
    required this.time,
    required this.age,
    required this.ballColour,
    required this.venue,
    required this.image,
    required this.entryLink,
    required this.publishDate,
  });

  factory EventListModel.fromJson(Map<String, dynamic> json) {
    return EventListModel(
      eventId: json["event_id"],
      eventName: json["event_name"],
      date: json["date"],
      time: json["time"],
      age: json["age"],
      ballColour: json["ball_colour"],
      venue: json["venue"],
      image: json["image"],
      entryLink: json["entry_link"],
      publishDate: json["publish_date"],
    );
  }

  static EventListModel empty() {
    return EventListModel(
      eventId: 0,
      eventName: "",
      date: "",
      time: "",
      age: "",
      ballColour: "",
      venue: "",
      image: "",
      entryLink: "",
      publishDate: "",
    );
  }
}
