// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'submit_order_bloc.dart';

@immutable
sealed class SubmitOrderEvent {}
// ignore: must_be_immutable
class sendInfo extends SubmitOrderEvent {
  OrderShow body;
  sendInfo({
    required this.body,
  });
}
