class ApiPath {
  static const String baseUrl = "https://$testHost.com";

  static const String testHost = "api-test.theappastro";

  ///获取国家列表 GET
  static const String getCountryList = "/v1/locations/countries";

  ///获取省列表 GET
  static const String getStateList = "/v1/locations/states";

  ///获取城市列表 GET
  static const String getCityList = "/v1/locations/cities";

  ///基于邮箱的账号登录 POST
  static const String emailLogin = "/v1/auth/login";

  ///Apple三方登录 POST
  static const String appleLogin = "/v1/auth/third/apple";

  ///Google三方登录 POST
  static const String googleLogin = "/v1/auth/third/google";

  ///登出 POST
  static const String logout = "/v1/auth/logout";

  ///刷新登录token POST
  static const String refreshToken = "/v1/auth/refresh-token";

  ///获取账号信息GET
  static const String getAccount = "/v1/account/me";

  ///更新账号信息 PAT
  static const String updateAccount = "/v1/account/me";

  ///删除账号信息 DELETE
  static const String deleteAccount = "/v1/account/me";

  ///根据设备ID查询用户
  static const String postDevice = "/v1/account/by-device-id";

  ///获取文件上传地址 GET
  static const String getUploadUrl = "/v1/global/uploadurl";

  ///清除推送badge DELETE
  static const String cleanPushBadge = "/v1/push/pushbadge";

  ///更新推送token POST
  static const String refreshPushToken = "/v1/push/pushtoken";

  ///查询出生星盘分析报告 GET (header add auth)
  static const String getNatalReport = "/v1/astro/natal-report";

  ///查询朋友列表 GET (header add auth)
  static const String getFriends = "/v1/account/friend";

  ///查询朋友列表 POST (header add auth)
  static const String addFriend = "/v1/account/friend";

  ///删除朋友 DELETE (header add auth)
  static const String deleteFriend = "/v1/account/friend";

  ///删除朋友 PUT (header add auth)
  static const String putFriend = "/v1/account/friend";

  ///合盘分析（查询列表）GET
  static const String getAnalysisList = "/v1/synastry/analysis";

  ///更新合盘分析（添加记录并分析）POST
  static const String updateAnalysis = "/v1/synastry/analysis";

  ///合盘分析（查询详情））GET
  static const String getAnalysis = "/v1/synastry/analysis";

  ///合盘收藏 POST
  static const String postCollection = "/v1/synastry/collection";

  ///合盘取消收藏 DELETE
  static const String deleteCollection = "/v1/synastry/collection";
}
