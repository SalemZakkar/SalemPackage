import 'failure.dart';

enum BaseStatus { failure, loading, success, initial }

class BaseState<T> {
  final T? item;
  final BaseStatus state;
  final Failure? failure;
  const BaseState({this.state = BaseStatus.initial, this.failure, this.item});
  bool get progress => state == BaseStatus.loading;
  bool get fail => state == BaseStatus.failure;
  bool get success => state == BaseStatus.success;
  BaseState<T> setProgress() => BaseState<T>(state: BaseStatus.loading);
  BaseState<T> setFailure(Failure failure) =>
      BaseState<T>(state: BaseStatus.failure, failure: failure);
  BaseState<T> setSuccess(T item) =>
      BaseState<T>(state: BaseStatus.success, item: item);
}
