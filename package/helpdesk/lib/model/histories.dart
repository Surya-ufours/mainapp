import 'all_tickets_response.dart';

class HistoryResponse {
  HistoryResponse(
    this.status,
    this.message,
    this.ticketdetails,
  );

  HistoryResponse.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];

    if (json['ticketdetails'] != null) {
      ticketdetails = Ticketdetails.fromJson(json['ticketdetails']);
    }
  }

  late bool status;
  late String message;
  late Ticketdetails ticketdetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (ticketdetails != null) {
      map['ticketdetails'] = ticketdetails;
    }
    return map;
  }
}

/// Username : ""
/// location : "Bangalore"
/// description : "UPS 40KVA-Load Current R[0-60] - 70.0"
/// StatusTime : "5:53PM"
/// StatusDate : "15/12/2021"
/// Status : "Open"
/// Colorcode : "Lite Red - #D33F49"
/// Building : "i2i Tower A"
/// Floor : "2nd Floor"
/// Wing : "East Wing"
/// imagelink : "http://ifazidesk.ifazig.com//UploadImages/0"

class Histories {
  Histories(
    this.username,
    this.location,
    this.description,
    this.statusTime,
    this.statusDate,
    this.status,
    this.colorcode,
    this.building,
    this.floor,
    this.wing,
    this.imagelink,
  );

  Histories.fromJson(dynamic json) {
    username = json['Username'];
    location = json['location'];
    description = json['description'];
    statusTime = json['StatusTime'];
    statusDate = json['StatusDate'];
    status = json['Status'];
    colorcode = json['Colorcode'];
    building = json['Building'];
    floor = json['Floor'];
    wing = json['Wing'];
    imagelink = json['imagelink'];
  }

  late String username;
  late String location;
  late String description;
  late String statusTime;
  late String statusDate;
  late String status;
  late String colorcode;
  late String building;
  late String floor;
  late String wing;
  late String imagelink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Username'] = username;
    map['location'] = location;
    map['description'] = description;
    map['StatusTime'] = statusTime;
    map['StatusDate'] = statusDate;
    map['Status'] = status;
    map['Colorcode'] = colorcode;
    map['Building'] = building;
    map['Floor'] = floor;
    map['Wing'] = wing;
    map['imagelink'] = imagelink;
    return map;
  }
}
