import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/base_response_entity.dart';

BaseResponseEntity $BaseResponseEntityFromJson(Map<String, dynamic> json) {
  final BaseResponseEntity baseResponseEntity = BaseResponseEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    baseResponseEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    baseResponseEntity.msg = msg;
  }
  final dynamic data = json['data'];
  if (data != null) {
    baseResponseEntity.data = data;
  }
  return baseResponseEntity;
}

Map<String, dynamic> $BaseResponseEntityToJson(BaseResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data;
  return data;
}

extension BaseResponseEntityExtension on BaseResponseEntity {
  BaseResponseEntity copyWith({int? code, String? msg, dynamic data}) {
    return BaseResponseEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}

BaseResponseData $BaseResponseDataFromJson(Map<String, dynamic> json) {
  final BaseResponseData baseResponseData = BaseResponseData();
  return baseResponseData;
}

Map<String, dynamic> $BaseResponseDataToJson(BaseResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension BaseResponseDataExtension on BaseResponseData {}
