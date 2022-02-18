// class MeetingModel {
//   final String id;
//   final String title;
//   final String description;
//   final String startDate;
//   final String endDate;
//   final String local;
//   final List sessions;

//   MeetingModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.startDate,
//     required this.endDate,
//     required this.local,
//     required this.sessions

//   });

//   factory MeetingModel.fromJson(Map<String, dynamic> json) {
//     return MeetingModel(
//         id: json['id'],
//         title: json['title'],
//         description: json['description'],
//         startDate: json['startDate'],
//         endDate: json['endDate'],
//         local: json['local'],
//         sessions: json['sessions']
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "description": description,
//     "startDate": startDate,
//     "endDate": endDate,
//     "local": local,
//     "sessions" : sessions
//   };

// }

// class Sessions{
//   final String id;
//   final String meetingId;
//   final String name;
//   final String startDate;
//   final String description;
//   final String local;

//   Sessions({
//     required this.id,
//     required this.meetingId,
//     required this.name,
//     required this.startDate,
//     required this.description,
//     required this.local
//   });

// }

class MeetingModel {
  String? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? local;
  List<Sessions>? sessions;

  MeetingModel(
      {this.id,
      this.title,
      this.description,
      this.startDate,
      this.endDate,
      this.local,
      this.sessions});

  MeetingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    local = json['local'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['local'] = this.local;
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  String? id;
  String? meetingId;
  String? name;
  String? description;
  List<Columns>? columns;
  String? highlight;
  List<Stickies>? stickies;

  Sessions(
      {this.id,
      this.meetingId,
      this.name,
      this.description,
      this.columns,
      this.highlight,
      this.stickies});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingId = json['meetingId'];
    name = json['name'];
    description = json['description'];
    if (json['columns'] != null) {
      columns = <Columns>[];
      json['columns'].forEach((v) {
        columns!.add(new Columns.fromJson(v));
      });
    }
    highlight = json['highlight'];
    if (json['stickies'] != null) {
      stickies = <Stickies>[];
      json['stickies'].forEach((v) {
        stickies!.add(new Stickies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meetingId'] = this.meetingId;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.columns != null) {
      data['columns'] = this.columns!.map((v) => v.toJson()).toList();
    }
    data['highlight'] = this.highlight;
    if (this.stickies != null) {
      data['stickies'] = this.stickies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Columns {
  String? name;
  String? color;

  Columns({this.name, this.color});

  Columns.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color'] = this.color;
    return data;
  }
}

class Stickies {
  String? id;
  String? content;
  String? columnName;
  String? userName;
  String? sessionId;

  Stickies(
      {this.id, this.content, this.columnName, this.userName, this.sessionId});

  Stickies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    columnName = json['columnName'];
    userName = json['userName'];
    sessionId = json['sessionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['columnName'] = this.columnName;
    data['userName'] = this.userName;
    data['sessionId'] = this.sessionId;
    return data;
  }
}
