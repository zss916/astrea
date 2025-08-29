import 'package:astrea/generated/assets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AppStarIcon {
  static String? selectSign(String signName) {
    return signName.isNotEmpty
        ? [
            Assets.imageAries,
            Assets.imageTaurus,
            Assets.imageGemini,
            Assets.imageCancer,
            Assets.imageLeo,
            Assets.imageVirgo,
            Assets.imageLibra,
            Assets.imageScorpio,
            Assets.imageSagittarius,
            Assets.imageCapricorn,
            Assets.imageAquarius,
            Assets.imagePisces,
          ].firstWhereOrNull(
            (element) => element.contains(signName.trim().toLowerCase()),
          )
        : "";
  }

  static String? select(String name) {
    return name.isNotEmpty
        ? [
            ///月亮
            Assets.imageMoon,

            ///太阳
            Assets.imageSun,

            ///水星
            Assets.imageMercury,

            ///金星
            Assets.imageVenus,

            ///冥王星
            Assets.imagePluto,

            ///木星
            Assets.imageJupiter,

            ///土星
            Assets.imageSaturn,

            ///天王星
            Assets.imageUranus,

            ///海王星
            Assets.imageNeptune,

            ///火星
            Assets.imageMars,

            ///金星
            Assets.imageVenus,

            ///水星
            Assets.imageMercury,
          ].firstWhereOrNull(
            (element) => element.contains(name.trim().toLowerCase()),
          )
        : "";
  }

  ///白羊座  3月21日 - 4月19日
  static Widget get aries => Image.asset(
    Assets.imageAries,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///巨蟹座  6月21日 - 7月22日
  static Widget get cancer => Image.asset(
    Assets.imageCancer,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///狮子座 7月23日 - 8月22日
  static Widget get leo => Image.asset(
    Assets.imageLeo,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///处女座 8月23日 - 9月22日
  static Widget get virgo => Image.asset(
    Assets.imageVirgo,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///天秤座 9月23日 - 10月22日
  static Widget get libra => Image.asset(
    Assets.imageLibra,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///天蝎座 10月23日 - 11月21日
  static Widget get scorpio => Image.asset(
    Assets.imageScorpio,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///射手座 11月22日 - 12月21日
  static Widget get sagittarius => Image.asset(
    Assets.imageSagittarius,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///摩羯座 12月22日 - 1月19日
  static Widget get capricorn => Image.asset(
    Assets.imageCapricorn,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///双鱼座 2月19日 - 3月20日
  static Widget get pisces => Image.asset(
    Assets.imagePisces,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///水瓶座 1月20日 - 2月18日
  static Widget get aquarius => Image.asset(
    Assets.imageAquarius,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///金牛座 4月20日 - 5月20日
  static Widget get taurus => Image.asset(
    Assets.imageTaurus,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///双子座 5月21日 - 6月20日
  static Widget get gemini => Image.asset(
    Assets.imageGemini,
    width: 14,
    height: 14,
    matchTextDirection: true,
  );

  ///imgAries
  static Widget get imgAries => Image.asset(
    Assets.imageImgAries,
    width: 44.8,
    height: 44.8,
    matchTextDirection: true,
  );

  //Assets.imageImgGemini,
  //Assets.imageImgTaurus
}
