import 'package:dio/dio.dart';
import 'package:herry_up/core/data/service/base_service.dart';
class orderBringer extends BaseService{
  Future getOrder() async {
    try{
          Response response= await dio.get(ordersList);
    if(response.statusCode == 200){
      return response.data;
    }
    else {
      return 'Error';
    }
    }
    catch (e){
      throw e;
    }
  }
  }
