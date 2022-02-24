class MeetingsTable {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String local;

  MeetingsTable({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.local

    });

  factory MeetingsTable.fromJson(Map<String, dynamic> json) {
    return MeetingsTable(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      local: json['local']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "startDate": startDate,
    "endDate": endDate,
    "local": local
  };
}

class SessionsTable {
  final String id;
  final String meetingId;
  final String name;
  final String description;
  final String highlight;


  SessionsTable({
    required this.id,
    required this.meetingId,
    required this.name,
    required this.description,
    required this.highlight,
  });

  factory SessionsTable.fromJson(Map<String, dynamic> json) {
    return SessionsTable(
      id: json['id'],
      meetingId: json['meetingId'],
      name: json['name'],
      description: json['description'],
      highlight: json['highlight']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "meetingId": meetingId,
    "name": name,
    "description": description,
    "highlight": highlight
  };
}

class ColumnsTable {
  final String name;
  final String color;

  ColumnsTable({required this.name, required this.color});

  factory ColumnsTable.fromJson(Map<String, dynamic> json) {
    return ColumnsTable(
      name: json['name'],
      color: json['color']
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color
  };
}

class StickiesTable {
  final String id;
  final String content;
  final String columnName;
  final String userName;
  final String sessionId;

  StickiesTable(
      {required this.id, required this.content, required this.columnName, required this.userName, required this.sessionId});

  factory StickiesTable.fromJson(Map<String, dynamic> json) {
    return StickiesTable(
      id: json['id'],
      content: json['content'],
      columnName: json['columnName'],
      userName: json['userName'],
      sessionId: json['sessionId']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "columnName": columnName,
    "userName": userName,
    "sessionId": sessionId
  };
}
