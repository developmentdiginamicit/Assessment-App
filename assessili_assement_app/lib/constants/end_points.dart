class EndPoints {
  
  static const String baseUrl = "http://ec2-3-110-46-142.ap-south-1.compute.amazonaws.com:6000/api/";


  //AUTHENTICATION
  static const String login = "/auth/login";
  static const String registration = "/auth/register";
  static const String sendOtp = "/sendotp";
  static const String forgetPassword = "/auth/forgot-password";
  static const String verifyOtp = "/verifyotp";
  static const String getProfile = "/auth/profile";

  // assessment 
  static const String getAllAssement = "assessments";
  static const String assessmentIntro = "instructions";
  static const String questionList = "questions";
  static const String submmitExam = "submit-exam";
  static const String review = "reviews";


/// analytics 
/// 
static const String brightTraits = "/analytics/bright-traits";
static const String darkTrait = "/analytics/dark-traits";
static const String traitInfo = "/traitinfos";
static const String getTopicRecomandation = "/topicwise-recommendations";




}
