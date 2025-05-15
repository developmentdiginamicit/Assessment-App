import '../../../data/api_client.dart';
import '../../../data/api_response.dart';
import '../../constants/end_points.dart';

class AuthRepo {
  final _apiClient = ApiClient();

//USER REGISTER API
  Future<ApiResponse<Map<String, dynamic>>> userRegister(
      Map<String, dynamic>? reqModel) async {
    final response = await _apiClient.postRequest(
        endPoint: EndPoints.registration,
        fromJson: (data) => data,
        reqModel: reqModel);
    return ApiResponse<Map<String, dynamic>>(
        statusCode: response.statusCode,
        data: response.data,
        errorMessage: response.errorMessage);
  }

  //USER LOGIN
  Future<ApiResponse<Map<String, dynamic>>> userLogin(
      {required Map<String, dynamic> reqModel}) async {
    final response = await _apiClient.postRequest(
        endPoint: EndPoints.login,
        fromJson: (data) => data,
        reqModel: reqModel);
    return ApiResponse(
        statusCode: response.statusCode,
        errorMessage: response.errorMessage,
        data: response.data);
  }
  //SEND OTP API
  Future<ApiResponse<Map<String, dynamic>>> sendOtpForLogin(
      {required Map<String, dynamic> reqModel}) async {
    final res = await _apiClient.postRequest(
        endPoint: EndPoints.forgetPassword,
        fromJson: (data) => data,
        reqModel: reqModel);
    return ApiResponse(
        statusCode: res.statusCode,
        data: res.data,
        errorMessage: res.errorMessage);
  }

  //VERIFY OTP API
  Future<ApiResponse<Map<String, dynamic>>> verifyOtp(
      {required Map<String, dynamic> reqModel}) async {
    final res = await _apiClient.postRequest(
        endPoint: EndPoints.verifyOtp,
        fromJson: (data) => data,
        reqModel: reqModel);
    return ApiResponse(
        statusCode: res.statusCode,
        data: res.data,
        errorMessage: res.errorMessage);
  }


    //GET PROFILE 
  Future<ApiResponse<Map<String, dynamic>>> getProfile(
      ) async {
    final res = await _apiClient.getRequest(
        endPoint: EndPoints.getProfile,
        fromJson: (data) => data,
        );
    return ApiResponse(
        statusCode: res.statusCode,
        data: res.data,
        errorMessage: res.errorMessage);
  }

}
