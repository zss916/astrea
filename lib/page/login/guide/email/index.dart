import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/components/common_app_bar.dart';
import 'package:astrea/core/enum/app_enum.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/api/account.dart';
import 'package:astrea/net/api/auth.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/bean/auth_entity.dart';
import 'package:astrea/page/login/guide/email/widget/input_login.dart';

part 'binding.dart';
part 'logic.dart';
part 'view.dart';
