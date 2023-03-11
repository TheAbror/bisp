part of 'cms_bloc.dart';

class CmsState extends Equatable {
  final BlocProgress blocProgress;
  final String failureMessage;

  const CmsState({
    required this.blocProgress,
    required this.failureMessage,
  });

  factory CmsState.initial() {
    return const CmsState(
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  CmsState copyWith({
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return CmsState(
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [blocProgress, failureMessage];
}
