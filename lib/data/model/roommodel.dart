class RoomModel {
  int? id;
  int? hotel;
  String? nameen;
  String? namear;
  String? descar;
  String? descen;
  String? roomguests;
  String? roombeds;
  String? roomicons;
  String? main;
  String? firstImage;
  String? secondImage;
  String? thirdImage;
  List<Bedoptions>? bedoptions;
  List<Guestoptions>? guestoptions;

  RoomModel(
      {this.id,
      this.hotel,
      this.nameen,
      this.namear,
      this.descar,
      this.descen,
      this.roomguests,
      this.roombeds,
      this.roomicons,
      this.main,
      this.firstImage,
      this.secondImage,
      this.thirdImage,
      this.bedoptions,
      this.guestoptions});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotel = json['hotel'];
    nameen = json['nameen'];
    namear = json['namear'];
    descar = json['descar'];
    descen = json['descen'];
    roomguests = json['roomguests'];
    roombeds = json['roombeds'];
    roomicons = json['roomicons'];
    main = json['main'];
    firstImage = json['first_image'];
    secondImage = json['second_image'];
    thirdImage = json['third_image'];
    if (json['bedoptions'] != null) {
      bedoptions = <Bedoptions>[];
      json['bedoptions'].forEach((v) {
        bedoptions!.add(new Bedoptions.fromJson(v));
      });
    }
    if (json['guestoptions'] != null) {
      guestoptions = <Guestoptions>[];
      json['guestoptions'].forEach((v) {
        guestoptions!.add(new Guestoptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel'] = this.hotel;
    data['nameen'] = this.nameen;
    data['namear'] = this.namear;
    data['descar'] = this.descar;
    data['descen'] = this.descen;
    data['roomguests'] = this.roomguests;
    data['roombeds'] = this.roombeds;
    data['roomicons'] = this.roomicons;
    data['main'] = this.main;
    data['first_image'] = this.firstImage;
    data['second_image'] = this.secondImage;
    data['third_image'] = this.thirdImage;
    if (this.bedoptions != null) {
      data['bedoptions'] = this.bedoptions!.map((v) => v.toJson()).toList();
    }
    if (this.guestoptions != null) {
      data['guestoptions'] = this.guestoptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bedoptions {
  int? id;
  int? number;
  int? room;

  Bedoptions({this.id, this.number, this.room});

  Bedoptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    room = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['room'] = this.room;
    return data;
  }
}

class Guestoptions {
  int? id;
  int? number;
  int? room;

  Guestoptions({this.id, this.number, this.room});

  Guestoptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    room = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['room'] = this.room;
    return data;
  }
}
