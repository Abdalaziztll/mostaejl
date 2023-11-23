import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio =Dio();
 final String baseUrl = '';
  String ordersList ="55a1-82-137-245-189.ngrok-free.app/api/pending/orders";
  String OrderSend="https://jsonplaceholder.typicode.com/posts";
}