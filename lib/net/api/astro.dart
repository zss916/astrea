import 'package:astrea/core/storage/astrology_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

///Astrology
abstract class AstrologyAPI {
  ///查询出生星盘分析报告
  static Future<(bool, NatalReportEntity)> getAstrologyReport({
    required String id,
    CancelToken? cancelToken,
  }) async {
    /* Map<String, dynamic> d = {
      "code": 0,
      "msg": "",
      "data": {
        "natal_chart_img":
            "https://s3.ap-south-1.amazonaws.com/western-chart/d8180400-686a-11f0-adca-076716a67041.svg",
        "natal_chart_result": {
          "sun_sign": "Cancer",
          "moon_sign": "Capricorn",
          "ascendant_sign": "Sagittarius",
          "element": "Water",
          "form": "Cardinal",
          "ruler": "Jupiter",
          "luck_color": "Blue",
          "luck_number": "3",
          "luck_gemstone": "amethyst",
        },
        "natal_chart_report": {
          "three_main_stars": {
            "sun": {
              "sign": "Capricorn",
              "house": 12,
              "zodiac_degree": 15.0526,
              "absolute_degree": 285.0526,
              "interpretation":
                  "The Sun in Capricorn at 15°05' in the 12th house suggests a strong inner drive for achievement and recognition. You are ambitious yet private, often working behind the scenes to accomplish your goals. Money and career are linked to your inner discipline.",
            },
            "moon": {
              "sign": "Capricorn",
              "house": 12,
              "zodiac_degree": 7.8235,
              "absolute_degree": 277.8235,
              "interpretation":
                  "The Moon at 7°49' Capricorn in the 12th house indicates a reserved emotional nature. You seek security and comfort through solitude or spiritual pursuits. Family and loved ones may be private, and emotional fulfillment comes from inner stability.",
            },
            "ascendant": {
              "sign": "Capricorn",
              "degree": 291.1791,
              "interpretation":
                  "Your Capricorn Ascendant at approximately 21°11' gives you a responsible and disciplined outward demeanor. You appear serious, reliable, and goal-oriented, which influences how others perceive you in career and social settings.",
            },
          },
          "planets": [
            {
              "mercury": {
                "sign": "Cancer",
                "house": 8,
                "zodiac_degree": 10.5743,
                "absolute_degree": 100.5743,
                "is_retrograde": true,
                "interpretation":
                    "Mercury retrograde in Cancer in the 8th house indicates introspective thinking about emotional and financial matters. Communication may be cautious or delayed, but deep insights can be gained. Money and family discussions require patience.",
              },
              "venus": {
                "sign": "Leo",
                "house": 8,
                "zodiac_degree": 2.644,
                "absolute_degree": 122.644,
                "is_retrograde": false,
                "interpretation":
                    "Venus in Leo in the 8th house indicates a passionate approach to love and shared resources. You seek admiration and warmth in relationships, and your generosity attracts others. Money matters are influenced by your desire for luxury and recognition.",
              },
              "mars": {
                "sign": "Cancer",
                "house": 8,
                "zodiac_degree": 19.2056,
                "absolute_degree": 109.2056,
                "is_retrograde": false,
                "interpretation":
                    "Mars in Cancer in the 8th house fuels your emotional intensity and drive in shared resources, intimacy, and transformation. You pursue financial stability and are protective of loved ones. Be cautious of emotional impulsiveness affecting family and business relationships.",
              },
              "jupiter": {
                "sign": "Gemini",
                "house": 6,
                "zodiac_degree": 3.0296,
                "absolute_degree": 63.0296,
                "is_retrograde": false,
                "interpretation":
                    "Jupiter in Gemini in the 6th house expands your interest in learning and communication within work and health routines. You seek growth through practical knowledge, which benefits your career and daily life. Money can come from multiple sources, and your social skills help in business and friendships.",
              },
              "saturn": {
                "sign": "Taurus",
                "house": 6,
                "zodiac_degree": 28.0765,
                "absolute_degree": 58.0765,
                "is_retrograde": true,
                "interpretation":
                    "Saturn retrograde in Taurus in the 6th house emphasizes disciplined work routines and health habits. Challenges may arise in daily responsibilities, but perseverance leads to stability. Family and friends value your reliability.",
              },
              "uranus": {
                "sign": "Aquarius",
                "house": 3,
                "zodiac_degree": 19.8615,
                "absolute_degree": 319.8615,
                "is_retrograde": true,
                "interpretation":
                    "Uranus in Aquarius in the 3rd house brings innovative ideas and unconventional thinking. You communicate uniquely, which can benefit business and friendships. Expect sudden insights or changes in your mental environment.",
              },
              "neptune": {
                "sign": "Aquarius",
                "house": 2,
                "zodiac_degree": 5.5136,
                "absolute_degree": 305.5136,
                "is_retrograde": true,
                "interpretation":
                    "Neptune in Aquarius in the 2nd house suggests idealism about money and possessions. You may have creative or spiritual approaches to finances, but should watch for illusions or misunderstandings regarding material resources.",
              },
              "pluto": {
                "sign": "Sagittarius",
                "house": 1,
                "zodiac_degree": 10.4937,
                "absolute_degree": 250.4937,
                "is_retrograde": true,
                "interpretation":
                    "Pluto in Sagittarius in the 1st house signifies profound personal transformation and a powerful presence. You are driven to reinvent yourself and influence others, with a focus on personal growth, which impacts your career and relationships.",
              },
            },
          ],
        },
        "predication_analysis_result": {
          "yesterday": {
            "summary":
                "Today, your dependable and practical nature shines, making it an ideal time to focus on building trust in your relationships and making steady career advancements. Your cautious approach will serve you well, and small acts of kindness can deepen bonds. Financially, prudent decisions will bring stability. Stay grounded and patient, as your efforts will pay off gradually.",
            "love":
                "Open communication will strengthen your romantic bonds today.",
            "relationship":
                "Sharing your feelings honestly will enhance your connection.",
            "career":
                "Your practical approach will help you make steady progress today.",
            "wealth":
                "Your cautious attitude will help you avoid unnecessary risks and maintain financial stability.",
            "score": {"love": 70, "career": 75, "wealth": 65},
            "do": "Carry a green aventurine to attract opportunities.",
            "avoid": "Overcommitting yourself in work projects.",
            "luck-boosting-tip": "Chant ‘OM’ facing east at dawn for clarity.",
          },
          "today": {
            "summary":
                "Tomorrow promises steady progress in your career through attention to detail. Your dependable nature will help resolve misunderstandings in relationships. Financial matters should be handled with care, avoiding impulsive spending. Trust your instincts and maintain your practical approach for continued stability.",
            "love": "A gentle gesture can bring warmth to your relationship.",
            "relationship": "Express appreciation to strengthen your bond.",
            "career":
                "Attention to detail will lead to recognition and progress.",
            "wealth":
                "Focusing on saving and avoiding impulsive purchases will sustain your financial health.",
            "score": {"love": 72, "career": 78, "wealth": 66},
            "do": "Face south while visualizing success to boost confidence.",
            "avoid": "Neglecting important details in work tasks.",
            "luck-boosting-tip": "Wear a rose quartz bracelet for love.",
          },
          "tomorrow": {
            "summary": "",
            "love": "",
            "relationship": "",
            "career": "",
            "wealth": "",
            "score": null,
            "do": "",
            "avoid": "",
          },
          "week": {
            "luck-boosting-tip":
                "Face east and chant ‘OM’ at sunrise for clarity.",
            "summary":
                "The week emphasizes steady progress and dependable efforts. Your practical approach will attract positive outcomes in both career and love. Be cautious of overextending yourself and prioritize clear communication. Trust in your stability to navigate challenges smoothly.",
            "love":
                "Open and honest communication will foster deeper intimacy. Be patient with your partner's needs.",
            "relationship":
                "Small acts of kindness will strengthen your bonds.",
            "career":
                "This week, your consistent effort and reliability will lead to recognition. Collaborate with trusted colleagues and avoid shortcuts.",
            "wealth":
                "Maintain a conservative approach to investments and focus on building savings.",
          },
          "month": {
            "summary":
                "This month encourages practical efforts and steady progress in your career and relationships. Stay grounded, and avoid rushing decisions. Your dependable nature will attract supportive connections, and small consistent actions will lead to meaningful achievements.",
            "decades": [
              {
                "range": "Days 1-10",
                "content":
                    "Days 1-10: Emphasize routine and stability; avoid impulsive decisions in work.",
              },
              {
                "range": "Days 11-20",
                "content":
                    "Days 11-20: Opportunities for collaboration arise; trust your dependable nature.",
              },
              {
                "range": "Days 21-end",
                "content":
                    "Days 21-end: Focus on consolidating gains and planning for future growth.",
              },
            ],
            "relationship_summary":
                "Relationships deepen through honest communication; patience will foster harmony.",
            "career_summary":
                "This month, your focus on practical and dependable pursuits will bring steady progress. Be open to new opportunities that align with your values and long-term goals.",
            "wealth_summary":
                "Financial stability is favored; focus on saving and prudent investments. Avoid risky ventures and trust your cautious instincts.",
          },
          "year": {
            "summary":
                "Throughout the year, your consistent efforts and practical mindset will bring steady progress in your career and relationships. Challenges may arise, but your dependable approach will help you navigate them successfully. Focus on building trust and maintaining stability. Financially, conservative strategies will serve you best, leading to gradual wealth accumulation.",
            "quarters": [
              {
                "range": "Q1",
                "content":
                    "Q1: Focus on establishing solid foundations; avoid rushing into new ventures.",
              },
              {
                "range": "Q2",
                "content":
                    "Q2: Opportunities for recognition; collaborate with trusted partners.",
              },
              {
                "range": "Q3",
                "content":
                    "Q3: Potential for financial stability; avoid risky investments.",
              },
              {
                "range": "Q4",
                "content":
                    "Q4: Reflect on achievements; plan for future growth.",
              },
            ],
            "relationship_summary":
                "Relationships flourish through patience and honest communication; trust your dependable nature.",
            "career_summary":
                "This year, your dependable and practical nature will lead to consistent growth. Opportunities for advancement will come through steady effort and reliability.",
            "wealth_summary":
                "Steady and cautious financial management will ensure long-term stability and growth.",
          },
        },
      },
    };*/
    // return (true, NatalReportEntity.fromJson(d["data"]));

    try {
      Map<String, dynamic> response = await Http.instance.get(
        ApiPath.getNatalReport,
        query: {"friend_id": id},
        cancelToken: cancelToken,
      );

      if (response["code"] == 0) {
        NatalReportEntity value = await compute(
          (dynamic jsonStr) => NatalReportEntity.fromJson(jsonStr),
          response["data"],
        );
        //NatalReportEntity value = NatalReportEntity.fromJson(response["data"]);
        AstrologyService.to.update(value);
        return (true, value);
      } else {
        AppLoading.toast(response["msg"]);
        return (false, NatalReportEntity());
      }
    } catch (error) {
      return (false, NatalReportEntity());
    }
  }

  ///轮询获取数据
  static Future<void> loopReport({
    required String id,
    required Function(NatalReportEntity data) onFinish,
    required Function() onError,
    CancelToken? cancelToken,
    int maxRetries = 100,
  }) async {
    debugPrint("loopReport start");
    try {
      bool isLoop = true;
      int attempt = 0;
      do {
        attempt++;
        debugPrint("loopReport attempt:$attempt");
        final (bool success, NatalReportEntity report) =
            await getAstrologyReport(id: id, cancelToken: cancelToken);
        isLoop = (report.done != true);
        debugPrint("loopReport isLoop:$isLoop");
        if (!isLoop) {
          debugPrint("loopReport successful");
          onFinish.call(report);
        } else {
          debugPrint("loopReport next");
          await Future.delayed(Duration(seconds: 2));
          /*if (attempt >= maxRetries) {
            debugPrint("loopReport maxRetries:$attempt");
            onError.call();
          }*/
        }
      } while (isLoop);
    } catch (error) {
      debugPrint("loopReport error");
      onError.call();
    }
  }

  // 添加一个标志来控制轮询
  static bool _shouldStopPolling = false;

  static void stopPolling() {
    _shouldStopPolling = true;
  }

  ///获取natal报告
  static Future<(bool isSuccessful, NatalReportEntity report)>
  loopAndReturnReport({
    required String id,
    CancelToken? cancelToken,
    int maxRetries = 1000,
  }) async {
    _shouldStopPolling = false; // 重置轮询标志
    debugPrint("loopReport start");
    try {
      bool isLoop = true;
      int attempt = 0;
      do {
        attempt++;
        debugPrint("loopReport attempt:$attempt");
        final (bool success, NatalReportEntity report) =
            await getAstrologyReport(id: id, cancelToken: cancelToken);
        if (_shouldStopPolling) {
          debugPrint("Analysis _shouldStopPolling:$_shouldStopPolling");
          return (false, NatalReportEntity());
        }
        isLoop = (report.done != true);
        debugPrint("loopReport isLoop:$isLoop");
        if (!isLoop) {
          debugPrint("loopReport successful");
          return (true, report); // 成功时返回true和报告
        } else {
          debugPrint("loopReport next");
          await Future.delayed(Duration(seconds: 2));
          /*if (attempt >= maxRetries) {
            debugPrint("loopReport maxRetries:$attempt");
            return (false, report); // 达到最大重试次数时返回false和最新报告
          }*/
        }
      } while (isLoop);
      // 理论上不会执行到这里，因为所有路径都已返回
      return (false, NatalReportEntity());
    } catch (e) {
      debugPrint("loopReport error: $e");
      return (false, NatalReportEntity()); // 错误时返回false和空报告
    }
  }
}
