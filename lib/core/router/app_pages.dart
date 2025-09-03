import 'package:astrea/page/account/person/info/index.dart';
import 'package:astrea/page/account/person/personalData/index.dart';
import 'package:astrea/page/home/account/feedback/index.dart';
import 'package:astrea/page/home/account/noticeSetting/index.dart';
import 'package:astrea/page/home/horoscope/detail/index.dart';
import 'package:astrea/page/home/index.dart';
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
  static const record = '/record';
  static const addFile = '/add_file';
  static const starLog = '/star_log';
  static const starReport = '/star_report';
  static const account = '/account';
  static const feedback = '/feedback';
  static const accountInformation = '/account_information';
  static const personalData = '/personal_data';
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
    GetPage(name: record, page: () => FileManagementPage()),
    GetPage(name: addFile, page: () => AddFilePage()),
    GetPage(name: starLog, page: () => LogsPage()),
    GetPage(name: starReport, page: () => StarReportPage()),
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
