import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:generic_network_layer/data_layer/remote/target_type.dart';

import '../../dto/base_response.dart';
import '../../dto/codable.dart';
import '../../dto/message_type.dart';

class BaseApi<T extends TargetTypeBase> {
  final String baseUrl = "";
  final Dio _dio = Dio();

  Future<BaseResponse<M>> fetchData<M extends Codable>(T targetType,M Function() data) async {

    RequestOptions requestOptions = RequestOptions(
        method: targetType.method?.value,
        headers: targetType.headers ?? {},
        path: targetType.path ?? "",
        baseUrl: baseUrl,
        responseType: ResponseType.json,
        receiveDataWhenStatusError:true,
        validateStatus: (code) => true,
        data: const JsonEncoder().convert(targetType.requestParameters ?? {}));

    try{
      var  response = await _dio.fetch(requestOptions);
      return BaseResponse<M>(data(), responseHandler(response.statusMessage, statusCode: response.statusCode)).fromJson(response.data);
    } on DioError catch (e){
      return BaseResponse<M>(data(), responseHandler(e.error.toString(), statusCode: e.response?.statusCode)).fromJson(e.response?.data);
    }
  }

  MessageType responseHandler(String? message,{required int? statusCode}) {
    if (message.toString().contains("SocketException")) {
      return MessageType.noConnection;
    }
    if(statusCode == 200 || statusCode == 201 || statusCode == 400 ){
      return MessageType.success;
    }
    if(statusCode == 500){
      return MessageType.serverError;
    }
    return MessageType.failed;
  }
}