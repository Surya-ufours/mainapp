import 'package:get/get.dart';

class FeedbackTicketsResponse {
  FeedbackTicketsResponse(
    this.status,
    this.message,
    this.returnData,
  );

  FeedbackTicketsResponse.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    returnData = FeedbackTicketData.fromJson(json['ReturnData']);
  }

  late bool status;
  late String message;
  late FeedbackTicketData returnData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    map['ReturnData'] = returnData.toJson();
    return map;
  }
}

class FeedbackTicketData {
  FeedbackTicketData({
    this.feedbackdetails,
    this.feedbackScoredetails,
  });

  FeedbackTicketData.fromJson(dynamic json) {
    if (json['Feedbackdetails'] != null) {
      feedbackdetails = [];
      json['Feedbackdetails'].forEach((v) {
        feedbackdetails?.add(Feedbackdetails.fromJson(v));
      });
    }
    if (json['Feedback Score details'] != null) {
      feedbackScoredetails = [];
      json['Feedback Score details'].forEach((v) {
        feedbackScoredetails?.add(FeedbackScoreDetails.fromJson(v));
      });
    }
  }

  List<Feedbackdetails>? feedbackdetails;
  List<FeedbackScoreDetails>? feedbackScoredetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (feedbackdetails != null) {
      map['Feedbackdetails'] = feedbackdetails?.map((v) => v.toJson()).toList();
    }
    if (feedbackScoredetails != null) {
      map['Feedback Score details'] =
          feedbackScoredetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class FeedbackScoreDetails {
  FeedbackScoreDetails(
    this.scoreID,
    this.scoreName,
    this.sortOrder,
    this.isComment,
    this.scoreImageGray,
    this.scoreImage,
  );

  FeedbackScoreDetails.fromJson(dynamic json) {
    scoreID = json['ScoreID'];
    scoreName = json['ScoreName'];
    sortOrder = json['SortOrder'];
    isComment = json['IsComment'];
    scoreImageGray = json['ScoreImageGray'];
    scoreImage = json['ScoreImage'];
  }

  late int scoreID;
  late String scoreName;
  late int sortOrder;
  late bool isComment;
  late String scoreImageGray;
  late String scoreImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ScoreID'] = scoreID;
    map['ScoreName'] = scoreName;
    map['SortOrder'] = sortOrder;
    map['IsComment'] = isComment;
    map['ScoreImageGray'] = scoreImageGray;
    map['ScoreImage'] = scoreImage;
    return map;
  }
}

class Feedbackdetails {
  Feedbackdetails(
    this.compliantID,
    this.ticketNo,
    this.locationName,
    this.buildingName,
    this.floorName,
    this.wingName,
    this.departmentName,
    this.categoryName,
    this.statusName,
    this.responsible,
    this.reqTime,
    this.priorityName,
    this.closedTime,
    this.imagelink,
    this.rating,
    this.scoreImage,
    this.clientname,
    this.clientcode,
    this.visitDatetime,
  );

  Feedbackdetails.fromJson(dynamic json) {
    compliantID = json['CompliantID'];
    ticketNo = json['TicketNo'];
    locationName = json['LocationName'];
    buildingName = json['BuildingName'];
    floorName = json['FloorName'];
    wingName = json['WingName'];
    departmentName = json['DepartmentName'];
    categoryName = json['CategoryName'];
    statusName = json['StatusName'];
    responsible = json['Responsible'];
    reqTime = json['ReqTime'];
    priorityName = json['PriorityName'];
    closedTime = json['ClosedTime'];
    imagelink = json['imagelink'];
    rating = json['rating'];
    scoreImage = json['ScoreImage'];
    clientname = json['clientname'];
    clientcode = json['clientcode'];
    visitDatetime = json['VisitDatetime'];
  }

  late int compliantID;
  late String ticketNo;
  late String locationName;
  late String buildingName;
  late String floorName;
  late String wingName;
  late String departmentName;
  late String categoryName;
  late String statusName;
  late String responsible;
  late String reqTime;
  late String priorityName;
  late String? closedTime;
  late String imagelink;
  late int rating;
  late String scoreImage;
  late String? clientname;
  late String? clientcode;
  late String? visitDatetime;

  RxInt selectedId = 0.obs;
  RxBool isComment = false.obs;
  String comment = '';

  // RxList<FeedbackScoreDetails> feedbackScoredetails=RxList();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CompliantID'] = compliantID;
    map['TicketNo'] = ticketNo;
    map['LocationName'] = locationName;
    map['BuildingName'] = buildingName;
    map['FloorName'] = floorName;
    map['WingName'] = wingName;
    map['DepartmentName'] = departmentName;
    map['CategoryName'] = categoryName;
    map['StatusName'] = statusName;
    map['Responsible'] = responsible;
    map['ReqTime'] = reqTime;
    map['PriorityName'] = priorityName;
    map['ClosedTime'] = closedTime;
    map['imagelink'] = imagelink;
    map['rating'] = rating;
    map['ScoreImage'] = scoreImage;
    map['clientname'] = clientname;
    map['clientcode'] = clientcode;
    map['VisitDatetime'] = visitDatetime;
    return map;
  }
}
