import 'package:assessili_assement_app/constants/end_points.dart';
import 'package:assessili_assement_app/data/api_client.dart';
import 'package:assessili_assement_app/data/api_response.dart';
import 'package:assessili_assement_app/presentation/analytics/model/bright_traits.dart';
import 'package:assessili_assement_app/presentation/analytics/model/dark_traits.dart';
import 'package:assessili_assement_app/presentation/analytics/model/topic_model.dart';

import '../../presentation/trait_info/model/trait_info_model.dart';

class AnalyticsRepo {
  final _apiClient = ApiClient();

  ///get Bright Traits
  Future<ApiResponse<BrightTraitsResponse>> getBrightTraits() async {
    final res = await _apiClient.getRequest(
        endPoint: EndPoints.brightTraits,
        queryParameters: {"student_id": "abc123"},
        fromJson: (data) => BrightTraitsResponse.fromJson(data));

    return ApiResponse<BrightTraitsResponse>(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }

  ///get Dark Traits
  Future<ApiResponse<DartTraitResponse>> getDarkTraits() async {
    final res = await _apiClient.getRequest(
        endPoint: EndPoints.darkTrait,
        queryParameters: {"student_id": "abc123"},
        fromJson: (data) => DartTraitResponse.fromJson(data));

    return ApiResponse<DartTraitResponse>(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }

  ///get Dark Traits
  Future<ApiResponse<TraitInfoModel>> getTraitInfo() async {
    final res = await _apiClient.getRequest(
        endPoint: EndPoints.traitInfo,
        fromJson: (data) => TraitInfoModel.fromJson(data));

    return ApiResponse<TraitInfoModel>(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }

  ///get Topic wise recomandation 
  Future<ApiResponse<TopicModel>> getTopicRecomandationRepo() async {
    final res = await _apiClient.getRequest(
        endPoint: EndPoints.getTopicRecomandation,
        fromJson: (data) => TopicModel.fromJson(data));

    return ApiResponse<TopicModel>(
      statusCode: res.statusCode,
      data: res.data,
      errorMessage: res.errorMessage,
    );
  }
}
