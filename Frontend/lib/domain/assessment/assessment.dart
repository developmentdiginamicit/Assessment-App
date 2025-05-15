import 'package:assessili_assement_app/constants/end_points.dart';
import 'package:assessili_assement_app/data/api_client.dart';
import 'package:assessili_assement_app/data/api_response.dart';
import '../../presentation/assessment/model/get_all_assessment.dart';
import '../../presentation/assessment/model/intro_model.dart';
import '../../presentation/assessment/model/question_model.dart';

class AssessmentRepo {
  final _apiClient = ApiClient();
  Future<ApiResponse<AssessmentResponse>> getAllAssement() async {
    final res = await _apiClient.getRequest(
        endPoint: EndPoints.getAllAssement,
        fromJson: (data) => AssessmentResponse.fromJson(data));

    return ApiResponse<AssessmentResponse>(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }

  /// question repo
  Future<ApiResponse<QuestionsModel>> getQuestionRepo({required String assessmentId}) async {
    final res = await _apiClient.getRequest(
        endPoint: EndPoints.questionList,
        queryParameters: {"assessment_id":assessmentId},
        fromJson: (data) => QuestionsModel.fromJson(data));

    return ApiResponse<QuestionsModel>(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }

  /// submmit exam 
    /// question repo
  Future<ApiResponse> submmitExam({required Map<String,dynamic> reqModel}) async {
    final res = await _apiClient.postRequest(
        endPoint: EndPoints.submmitExam,
        reqModel: reqModel,
        fromJson: (data) => data);

    return ApiResponse(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }

     /// review
  Future<ApiResponse> reviewRepo({required Map<String,dynamic> reqModel}) async {
    final res = await _apiClient.postRequest(
        endPoint: EndPoints.review,
        reqModel: reqModel,
        fromJson: (data) => data);

    return ApiResponse(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }

  Future<ApiResponse<AssessmentIntroModel>> getAssessmentIntro(
      {required Map<String, dynamic> reqModel}) async {
    final res = await _apiClient.getRequest(
        queryParameters: reqModel,
        endPoint: EndPoints.assessmentIntro,
        fromJson: (data) => AssessmentIntroModel.fromJson(data));

    return ApiResponse(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }
}
