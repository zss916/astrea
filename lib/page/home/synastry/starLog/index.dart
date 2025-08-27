import 'dart:async';

import 'package:astrea/components/common_app_bar.dart';
import 'package:astrea/components/loading_widget.dart';
import 'package:astrea/core/bus/app_event_bus.dart';
import 'package:astrea/core/enum/app_enum.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/net/api/synastry.dart';
import 'package:astrea/net/bean/analysis_entity.dart';
import 'package:astrea/page/home/synastry/starLog/log_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

part 'binding.dart';
part 'logic.dart';
part 'view.dart';
