import 'package:astrea/page/account/accountInfo/balance/index.dart';
import 'package:astrea/page/account/accountInfo/details/index.dart';
import 'package:astrea/page/account/accountInfo/payment/index.dart';
import 'package:astrea/page/account/accountInfo/price/index.dart';
import 'package:astrea/page/account/accountInfo/realName/index.dart';
import 'package:astrea/page/account/accountInfo/redeem/index.dart';
import 'package:astrea/page/account/accountInfo/setPassword/index.dart';
import 'package:astrea/page/account/index/index.dart';
import 'package:astrea/page/account/person/certified/direction/index.dart';
import 'package:astrea/page/account/person/certified/gender/index.dart';
import 'package:astrea/page/account/person/certified/index.dart';
import 'package:astrea/page/account/person/certified/introduction/index.dart';
import 'package:astrea/page/account/person/certified/link/index.dart';
import 'package:astrea/page/account/person/certified/name/index.dart';
import 'package:astrea/page/account/person/certified/preference/index.dart';
import 'package:astrea/page/account/person/certified/uploadVideo/index.dart';
import 'package:astrea/page/account/person/info/index.dart';
import 'package:astrea/page/account/person/personalData/index.dart';
import 'package:astrea/page/account/person/personalData/telephone/index.dart';
import 'package:astrea/page/home/account/feedback/index.dart';
import 'package:astrea/page/home/account/noticeSetting/index.dart';
import 'package:astrea/page/home/chatroom/background/index.dart';
import 'package:astrea/page/home/chatroom/chat/index.dart';
import 'package:astrea/page/home/chatroom/evaluation/index.dart';
import 'package:astrea/page/home/chatroom/report/index.dart';
import 'package:astrea/page/home/horoscope/detail/index.dart';
import 'package:astrea/page/home/index.dart';
import 'package:astrea/page/home/spiritual/collection/index.dart';
import 'package:astrea/page/home/spiritual/detail/index.dart';
import 'package:astrea/page/home/spiritual/technician%20/index.dart';
import 'package:astrea/page/home/synastry/addFile/index.dart';
import 'package:astrea/page/home/synastry/record/index.dart';
import 'package:astrea/page/home/synastry/report/index.dart';
import 'package:astrea/page/home/synastry/starLog/index.dart';
import 'package:astrea/page/login/guide/birthChart/index.dart';
import 'package:astrea/page/login/guide/dateOfBirth/index.dart';
import 'package:astrea/page/login/guide/email/index.dart';
import 'package:astrea/page/login/guide/gender/index.dart';
import 'package:astrea/page/login/guide/interests/index.dart';
import 'package:astrea/page/login/guide/name/index.dart';
import 'package:astrea/page/login/guide/placeOfBirth/index.dart';
import 'package:astrea/page/login/guide/result/index.dart';
import 'package:astrea/page/login/guide/timeOfBirth/index.dart';
import 'package:astrea/page/login/guide/welcome/index.dart';
import 'package:astrea/page/login/start/index.dart';
import 'package:astrea/page/splash/index.dart';
import 'package:astrea/page/subscribe/index.dart';
import 'package:astrea/page/web/web_page.dart';
import 'package:get/get.dart';

class APages {
  static const start = '/start';
  static const guide = '/guide';
  static const home = '/home';
  static const dateOfBirth = '/dateOfBirth';
  static const timeOfBirth = '/timeOfBirth';
  static const placeOfBirth = '/placeOfBirth';
  static const gender = '/gender';
  static const editName = '/editName';
  static const interests = '/interests';
  static const notifySetting = '/notifySetting';
  static const welcome = '/welcome';
  static const email = '/email';
  static const result = '/result';
  static const starChartAnalysis = '/star_chart_analysis';
  static const spiritualList = '/spiritual_list';
  static const myCollection = '/my_collection';
  static const technician = '/technician';
  static const record = '/record';
  static const addFile = '/add_file';
  static const starLog = '/star_log';
  static const starReport = '/star_report';
  static const account = '/account';
  static const feedback = '/feedback';
  static const accountInformation = '/account_information';
  static const personalData = '/personal_data';
  static const telephone = '/telephone_number';
  static const certifiedDiviner = '/certified_diviner';
  static const certifiedName = '/certified_name';
  static const certifiedGender = '/certified_gender';
  static const certifiedPreference = '/certified_preference';
  static const certifiedIntroduction = '/certified_introduction';
  static const certifiedLink = '/certified_link';
  static const astrologicalDirection = '/astrological_direction';
  static const uploadVideo = '/upload_video';
  static const realName = '/real_name';
  static const payment = '/payment';
  static const balance = '/balance';
  static const individualPrice = '/individual_price';
  static const rewardDetails = '/reward_details';
  static const redeem = '/redeem';
  static const setPassword = '/set_password';
  static const chat = '/chat';
  static const report = '/report';
  static const evaluation = '/evaluation';
  static const chooseBackground = '/choose_background';
  static const subscribe = '/subscribe';
  static const splash = '/splash';
  static const noticeSetting = '/notice_setting';
  static const webview = '/webview';

  static final List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: start, page: () => StartPage(), binding: StartBinding()),
    GetPage(name: guide, page: () => GuidePage(), binding: GuideBinding()),
    GetPage(
      name: dateOfBirth,
      page: () => DateOfBirthPage(),
      binding: DateOfBirthBinding(),
    ),
    GetPage(name: timeOfBirth, page: () => TimeOfBirthPage()),
    GetPage(
      name: placeOfBirth,
      page: () => PlaceOfBirthPage(),
      binding: PlaceOfBirthBinding(),
    ),
    GetPage(name: gender, page: () => GenderPage()),
    GetPage(name: editName, page: () => EditNamePage()),
    GetPage(name: interests, page: () => InterestsPage()),
    GetPage(
      name: welcome,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(name: email, page: () => EmailPage(), binding: EmailBinding()),
    GetPage(name: result, page: () => ResultPage(), binding: ResultBinding()),
    GetPage(name: home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
      name: starChartAnalysis,
      page: () => AnalysisPage(),
      binding: AnalysisBinding(),
    ),
    GetPage(name: spiritualList, page: () => SpiritualListPage()),
    GetPage(name: myCollection, page: () => CollectionPage()),
    GetPage(name: technician, page: () => TechnicianPage()),
    GetPage(name: record, page: () => FileManagementPage()),
    GetPage(name: addFile, page: () => AddFilePage()),
    GetPage(name: starLog, page: () => LogsPage()),
    GetPage(name: starReport, page: () => StarReportPage()),
    GetPage(name: account, page: () => AccountPage()),
    GetPage(name: feedback, page: () => FeedbackPage()),
    GetPage(name: webview, page: () => WebPage()),
    GetPage(
      name: accountInformation,
      page: () => AccountInfoPage(),
      binding: AccountInfoBinding(),
    ),
    GetPage(
      name: personalData,
      page: () => PersonalDataPage(),
      binding: PersonalDataBinding(),
    ),
    GetPage(name: telephone, page: () => TelephonePage()),
    GetPage(name: certifiedDiviner, page: () => CertifiedDivinerPage()),
    GetPage(name: certifiedName, page: () => CertifiedNamePage()),
    GetPage(name: certifiedGender, page: () => CertifiedGenderPage()),
    GetPage(name: certifiedPreference, page: () => CertifiedPreferencePage()),
    GetPage(
      name: certifiedIntroduction,
      page: () => CertifiedIntroductionPage(),
    ),
    GetPage(name: certifiedLink, page: () => CertifiedLinkPage()),
    GetPage(
      name: astrologicalDirection,
      page: () => AstrologicalDirectionPage(),
    ),
    GetPage(name: uploadVideo, page: () => UploadVideoPage()),
    GetPage(name: realName, page: () => RealNamePage()),
    GetPage(name: payment, page: () => PaymentPage()),
    GetPage(name: balance, page: () => BalancePage()),
    GetPage(name: individualPrice, page: () => IndividualPricePage()),
    GetPage(name: rewardDetails, page: () => RewardDetailsPage()),
    GetPage(name: redeem, page: () => RedeemPage()),
    GetPage(name: setPassword, page: () => SetPassword()),
    GetPage(name: chat, page: () => ChatPage(), binding: ChatBinding()),
    GetPage(name: report, page: () => ReportPage()),
    GetPage(name: evaluation, page: () => EvaluationPage()),
    GetPage(name: chooseBackground, page: () => BackgroundPage()),
    GetPage(name: subscribe, page: () => SubscribePage()),
    GetPage(name: noticeSetting, page: () => NotificationSetting()),
  ];

  static const countryCodeSheet = 'CountryCodeSheet';
  static const selectTimeSheet = 'SelectTimeSheet';
  static const selectRelationshipSheet = 'SelectRelationshipSheet';
  static const selectInterestsSheet = 'SelectInterestsSheet';
  static const shareSheet = 'ShareSheet';
  static const chatMoreSheet = 'ChatMoreSheet';
  static const setLoginPasswordSheet = 'LoginPasswordSheet';
  static const timeOfBirthTipDialog = 'TimeOfBirthTipDialog';
  static const logoutDialog = 'LogOutDialog';
  static const passwordDialog = 'PasswordDialog';
  static const freeChatTipDialog = 'FreeChatTipDialog';
  static const openVipSheet = 'OpenVipSheet';
  static const chartReportDialog = 'chartReportDialog';
  static const deletePeopleFileDialog = 'deletePeopleFileDialog';
  static const gdprDialog = 'GDPRDialog';
  static const attDialog = 'ATTDialog';
  static const noticeCloseDialog = 'noticeCloseDialog';
  static const noticeTipDialog = 'noticeTipDialog';
  static const noticeSelectTimeDialog = 'noticeSelectTimeDialog';
  static const deleteAccountDialog = 'deleteAccountDialog';
  static const loginFailedDialog = 'loginFailedDialog';
  static const loginFailedDialog2 = 'loginFailedDialog2';
}
