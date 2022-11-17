//helpdesk
const String baseUrl = "https://ifazility.com/idate_restapi/api/";

const String secureKeyApi = "getSecurityKey";
const String loginApi = "GetLoginDetails";
const String logoutApi = "Logout";
const String checkLeaveApi = "CheckForLeave";
const String onlineCheckApi = "CheckinsertionV1";
//downloads
const String departmentApi = "GetAssignedDepartments";
const String barcodeApi = "getlogsheetbybarcode";
const String questionApi = "GetQuestionbyuserid";
const String scoreApi = "getallscore";
const String templateApi = "getlogsheetbyequipmenttemplate";
const String templateDetailApi = "getlogsheetbyequipmenttemplatedetails";
const String parameterApi = "getequipmentparameterdetails";
const String subParameterApi = "getlogsheetbyequipmentsubparamdetails";

//dashboard
const String companyApi = "GetCompanybyuserid";
const String locationApi = "GetLocationbyuserid";
const String buildingApi = "GetBuildingByLocation";
const String floorApi = "GetFloorByBuilding";
const String wingApi = "GetWingByFloor";

//dashboard
const String dashboardChecklistApi = "GetDashboardDetailsWithTime";
const String dashboardChecklistDetailApi = "getDashboardDataWithTime";
const String dashboardChecklistPdfApi = "GetCheckTransactionDashboard4PDF";

const String dashboardLogsheetApi = "GetLogsheetDetailsWithTime";
const String dashboardLogsheetDetailApi = "getLogsheetDataWithTime";
const String dashboardLogsheetPdfApi = "GetLogSheetDashboard4PDF";

//todo
const String todoChecklistApi = "GetMissingSlotsbycurrenttimeV1";
const String todoLogsheetApi = "GetMissingSlotsbycurrenttime4LogsheetV1";

//sync
const String submitChecklistApi = "InsertChecklistTransactionV2";
const String submitLogsheetApi = "InsertLogsheetTransactionV1";

//helpdesk
const String myTicketApi =
    "GetServiceEngineerTickets_Company_V3";
const String helpdeskDetailApi =
    "gcl/GetCompanyDetails";
