//helpdesk
const String HELPDESK_MAIN_URL = "https://ifazig.com/"; //live
const String appVersionUrl = "https://ifazility.com/appversion.json"; //live
// const String HELPDESK_MAIN_URL = "https://fmservicemgmt.com/"; //test

const String loginApi = "HelpdeskAPI_RESTNew/api/Dashboard/GetLoginDetails";
const String logoutUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/DoLogOut"; //?userid=1
const String updateTokenUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/UpdateNotificationID"; //?userid=1&notificationid=0
const String settingApi = "HelpdeskAPI_RESTNew/api/Dashboard/GetUserDetails";
const String myTicketApi =
    "HelpdeskAPI_RESTNew/api/Dashboard/GetServiceEngineerTickets_Company_V3";
const String allTicketApi =
    "HelpdeskAPI_RESTNew/api/Dashboard/GetDashboardDetails_Company_V3";
const String ticketHistoryApi =
    "HelpdeskAPI_RESTNew/Api/Dashboard/GetTicketHistory";
const String assigneeApi =
    "HelpdeskAPI_RESTNew/api/Dashboard/GetAssigneeDetails";
const String statusListApi =
    "HelpdeskAPI_RESTNew/api/Dashboard/GetMappedStatus_RoleMapping";
const String ticketTypeUrl =
    "HelpdeskAPI_RESTNew/api/Dashboard/GetComplaintType";
const String departmentUrl =
    "HelpdeskAPI_RESTNew/api/Dashboard/GetDepartmentDetails_BI";
const String issueUrl = "HelpdeskAPI_RESTNew/api/Dashboard/GetIssueDetails_BI";
const String timingUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/GetVisitDatetimings"; //ComplaintID=1309258

// const String barcodeUrl = "HelpdeskAPI_RESTNew/api/Dashboard/GetBarCodeDetails_V2"; //?CompanyID=1014&Barcode=2157b165
const String barcodeUrl =
    "HelpdeskAPI_RESTNew/api/Dashboard/GetBarCodeDetails_V3"; //?CompanyID=1014&Barcode=2157b165
const String requestTypeUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/GetRequestType"; //?companyid=1015&roleid=50
const String createTicketUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/RaiseTicketAPI_v2";
const String updateAssigneeUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/UpdateReAssign_v1"; //?userid=1
const String updateTicketUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/UpdateComplaints_v2"; //?userid=1

const String complaintTypeUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/GetComplainTypeDetails"; //?userid=1
const String communicationTypeUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/GetModeofCommuication"; //?userid=1

//client helpdesk
const String forgotPasswordUrl = "ClientHelpdesk/api/ForgotPassword";
const String resetPasswordUrl = "ClientHelpdesk/api/ResetPassword";
const String getFeedbackUrl = "ClientHelpdesk/api/Get_FeedbackTickets_V1";
const String insertFeedbackUrl = "ClientHelpdesk/api/InsertFeedback";

const String domainCompanyUrl = "ClientHelpdesk/api/GetCompanyName_ByDomain";
const String locationListUrl = "ClientHelpdesk/api/GetDomainLocations";
const String buildingListUrl = "ClientHelpdesk/api/GetDomainBuildings";
const String floorListUrl = "ClientHelpdesk/api/GetDomainFloors";
const String signupUrl = "ClientHelpdesk/api/Insert_Users_Signup";

const String escalationUrl =
    "HelpdeskAPI_RESTNew/Api/Dashboard/SendNotificationOnly";
