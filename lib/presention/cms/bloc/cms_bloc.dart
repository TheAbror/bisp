import 'package:eduninjav2/core/api/api_provider.dart';
import 'package:eduninjav2/core/constants/bloc_progress.dart';
import 'package:eduninjav2/core/constants/error/error.dart';
import 'package:eduninjav2/core/constants/string_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'cms_state.dart';

class CmsBloc extends Cubit<CmsState> {
  CmsBloc() : super(CmsState.initial());

  // void getUserInfo() async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.userService.getUserInfo();

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         emit(state.copyWith(data: data, blocProgress: BlocProgress.IS_SUCCESS));
  //       }
  //     } else {
  //       final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

  //       emit(state.copyWith(
  //         blocProgress: BlocProgress.FAILED,
  //         failureMessage: error.message,
  //       ));
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }
}
