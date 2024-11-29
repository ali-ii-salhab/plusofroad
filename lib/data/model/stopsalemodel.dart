class StopsaleModel {
  int? id;
  Room? room;
  String? startdate;
  String? enddate;
  int? hotel;

  StopsaleModel({this.id, this.room, this.startdate, this.enddate, this.hotel});

  StopsaleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    startdate = json['startdate'];
    enddate = json['enddate'];
    hotel = json['hotel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['hotel'] = this.hotel;
    return data;
  }
}

class Room {
  int? id;
  String? main;
  String? namear;
  String? nameen;

  Room({this.id, this.main, this.namear, this.nameen});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    namear = json['namear'];
    nameen = json['nameen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['namear'] = this.namear;
    data['nameen'] = this.nameen;
    return data;
  }
}
