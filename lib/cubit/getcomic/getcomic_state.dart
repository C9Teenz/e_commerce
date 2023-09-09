part of 'getcomic_cubit.dart';

@freezed
class GetcomicState with _$GetcomicState {
  const factory GetcomicState.initial() = _Initial;
  const factory GetcomicState.loading() = _Loading;
  const factory GetcomicState.loaded(List<ComicModelDatum> model,int page,bool isNext) = _Loaded;
  const factory GetcomicState.error(String error) = _Error;

}
