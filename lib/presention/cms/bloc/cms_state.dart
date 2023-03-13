part of 'cms_bloc.dart';

class CmsState extends Equatable {
  final List<CmsResponse> cms;
  final BlocProgress blocProgress;
  final String failureMessage;
  final CmsResponse selectedModule;
  final List<String> moduleNamesList;
  final String selectModuleName;
  final List<Lesson> lessonsList;

  const CmsState({
    required this.cms,
    required this.blocProgress,
    required this.failureMessage,
    required this.selectedModule,
    required this.moduleNamesList,
    required this.selectModuleName,
    required this.lessonsList,
  });

  factory CmsState.initial() {
    return CmsState(
      cms: const [],
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
      selectedModule: CmsResponse(lessons: [], module: ''),
      moduleNamesList: const [],
      selectModuleName: '',
      lessonsList: const [],
    );
  }

  CmsState copyWith({
    List<CmsResponse>? cms,
    BlocProgress? blocProgress,
    String? failureMessage,
    CmsResponse? selectedModule,
    List<String>? moduleNamesList,
    String? selectModuleName,
    List<Lesson>? lessonsList,
  }) {
    return CmsState(
      cms: cms ?? this.cms,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
      selectedModule: selectedModule ?? this.selectedModule,
      moduleNamesList: moduleNamesList ?? this.moduleNamesList,
      selectModuleName: selectModuleName ?? this.selectModuleName,
      lessonsList: lessonsList ?? this.lessonsList,
    );
  }

  @override
  List<Object?> get props => [
        cms,
        blocProgress,
        failureMessage,
        selectedModule,
        moduleNamesList,
        selectModuleName,
        lessonsList,
      ];
}
