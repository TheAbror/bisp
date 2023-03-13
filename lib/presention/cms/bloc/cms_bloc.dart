import 'dart:convert';

import 'package:eduninjav2/core/api/api_provider.dart';
import 'package:eduninjav2/core/constants/bloc_progress.dart';
import 'package:eduninjav2/core/constants/error/error.dart';
import 'package:eduninjav2/core/constants/string_constants.dart';
import 'package:eduninjav2/presention/cms/model/cms.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cms_state.dart';

class CmsBloc extends Cubit<CmsState> {
  CmsBloc() : super(CmsState.initial());

  void selectedModule(String? moduleName) {
    if (moduleName != null && moduleName.isNotEmpty) {
      final lessonsList =
          state.cms.where((element) => element.module.toLowerCase() == moduleName.toLowerCase()).toList();

      if (lessonsList.isNotEmpty) {
        emit(state.copyWith(selectModuleName: moduleName, lessonsList: lessonsList.first.lessons));
      }
    }
  }

  void getCms() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.cms.getCms();

      if (response.isSuccessful) {
        final cms = response.body;

        if (cms != null && cms.isNotEmpty) {
          final moduleNamesList = cms.map((e) => e.module).toList();

          emit(
            state.copyWith(
              cms: cms,
              moduleNamesList: moduleNamesList,
              selectModuleName: cms.first.module,
              lessonsList: cms.first.lessons,
              blocProgress: BlocProgress.IS_SUCCESS,
            ),
          );
        } else {
          emit(
            state.copyWith(blocProgress: BlocProgress.FAILED, failureMessage: 'List is empty'),
          );
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }
  }
}
