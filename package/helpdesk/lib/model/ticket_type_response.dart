class TicketTypeResponse {
  late List<RequestType> requestType;
  late bool status;
  late String message;

  TicketTypeResponse(this.requestType, this.status, this.message);

  TicketTypeResponse.fromJson(dynamic json) {
    if (json["RequestType"] != null) {
      requestType = [];
      json["RequestType"].forEach((v) {
        requestType.add(RequestType.fromJson(v));
      });
    }
    status = json["Status"];
    message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (requestType != null) {
      map["RequestType"] = requestType.map((v) => v.toJson()).toList();
    }
    map["Status"] = status;
    map["Message"] = message;
    return map;
  }
}

class RequestType {
  late int ticketTypeId;
  late String type;
  late String ticketTypeShortName;

  RequestType(this.ticketTypeId, this.type, this.ticketTypeShortName);

  RequestType.fromJson(dynamic json) {
    ticketTypeId = json["TicketTypeId"];
    type = json["Type"];
    ticketTypeShortName = json["TicketTypeShortName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["TicketTypeId"] = ticketTypeId;
    map["Type"] = type;
    map["TicketTypeShortName"] = ticketTypeShortName;
    return map;
  }
}
