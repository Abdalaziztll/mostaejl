// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'submit_order_bloc.dart';

@immutable
sealed class SubmitOrderState {}

final class SubmitOrderInitial extends SubmitOrderState {}

// ignore: must_be_immutable
class succes extends SubmitOrderState {
  String token;
  succes({
    required this.token,
  });
}
class error extends SubmitOrderState {}
class loading extends SubmitOrderState {}
