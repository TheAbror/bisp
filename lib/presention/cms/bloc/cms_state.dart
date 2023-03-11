part of 'cms_bloc.dart';

class CmsState extends Equatable {
  final GeneralResponse cms;
  final BlocProgress blocProgress;
  final String failureMessage;

  const CmsState({
    required this.cms,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory CmsState.initial() {
    return CmsState(
      cms: GeneralResponse(),
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  CmsState copyWith({
    GeneralResponse? cms,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return CmsState(
      cms: cms ?? this.cms,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [cms, blocProgress, failureMessage];
}
