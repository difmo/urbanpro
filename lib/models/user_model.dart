class UserModel {
  final String branchID;
  final String parentId;
  final String studentId;
  final String studentName;
  final String dob;
  final String classStructureId;
  final String fatherName;
  final String motherName;
  final String rollNo;
  final String clientId;
  final String classId;
  final String className;
  final String sectionName;
  final String fatherMobileNo;
  final String motherMobileNo;
  final String sessionId;
  final String emailId;
  final String branchName;
  final String branchLogo;
  final String currentSessionYear;
  final String errorMessage;
  final String? otp; // Nullable as it can be null in the JSON.

  UserModel({
    required this.branchID,
    required this.parentId,
    required this.studentId,
    required this.studentName,
    required this.dob,
    required this.classStructureId,
    required this.fatherName,
    required this.motherName,
    required this.rollNo,
    required this.clientId,
    required this.classId,
    required this.className,
    required this.sectionName,
    required this.fatherMobileNo,
    required this.motherMobileNo,
    required this.sessionId,
    required this.emailId,
    required this.branchName,
    required this.branchLogo,
    required this.currentSessionYear,
    required this.errorMessage,
    this.otp,
  });

  /// Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      branchID: json['branchID'] ?? '',
      parentId: json['parentId'] ?? '',
      studentId: json['studentid'] ?? '',
      studentName: json['studentname'] ?? '',
      dob: json['dob'] ?? '',
      classStructureId: json['clsstrucidFK'] ?? '',
      fatherName: json['fathername'] ?? '',
      motherName: json['mothername'] ?? '',
      rollNo: json['rollno'] ?? '',
      clientId: json['clientid'] ?? '',
      classId: json['classID'] ?? '',
      className: json['classNm'] ?? '',
      sectionName: json['secname'] ?? '',
      fatherMobileNo: json['fatherMobileNo'] ?? '',
      motherMobileNo: json['motherMobileNo'] ?? '',
      sessionId: json['f_SessionId'] ?? '',
      emailId: json['emailID'] ?? '',
      branchName: json['branchName'] ?? '',
      branchLogo: json['branchLogo'] ?? '',
      currentSessionYear: json['cur_Sessionyr'] ?? '',
      errorMessage: json['errormessage'] ?? '',
      otp: json['otp'],
    );
  }

  /// Converts the UserModel instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'branchID': branchID,
      'parentId': parentId,
      'studentid': studentId,
      'studentname': studentName,
      'dob': dob,
      'clsstrucidFK': classStructureId,
      'fathername': fatherName,
      'mothername': motherName,
      'rollno': rollNo,
      'clientid': clientId,
      'classID': classId,
      'classNm': className,
      'secname': sectionName,
      'fatherMobileNo': fatherMobileNo,
      'motherMobileNo': motherMobileNo,
      'f_SessionId': sessionId,
      'emailID': emailId,
      'branchName': branchName,
      'branchLogo': branchLogo,
      'cur_Sessionyr': currentSessionYear,
      'errormessage': errorMessage,
      'otp': otp,
    };
  }
}
