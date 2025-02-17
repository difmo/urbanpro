class OtpGetResponse {
  final bool success;
  final String message;
  final OtpData otpData;
  final String smsApiResponse;

  OtpGetResponse({
    required this.success,
    required this.message,
    required this.otpData,
    required this.smsApiResponse,
  });

  factory OtpGetResponse.fromJson(Map<String, dynamic> json) {
    return OtpGetResponse(
      success: json['success'],
      message: json['message'],
      otpData: OtpData.fromJson(json['data']['otp_data']),
      smsApiResponse: json['data']['smsApiResponse'],
    );
  }
}

class OtpData {
  final int id;
  final int mobileOtp;
  final String emailOtp;
  final int mobileNumber;
  final String emailId;
  final String expireAt;

  OtpData({
    required this.id,
    required this.mobileOtp,
    required this.emailOtp,
    required this.mobileNumber,
    required this.emailId,
    required this.expireAt,
  });

  factory OtpData.fromJson(Map<String, dynamic> json) {
    return OtpData(
      id: json['id'],
      mobileOtp: json['mobile_otp'],
      emailOtp: json['email_otp'],
      mobileNumber: json['mobile_number'],
      emailId: json['email_id'],
      expireAt: json['expire_at'],
    );
  }
}
