import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:generic_network_layer/data_layer/remote/target_type.dart';

import '../../dto/base_response.dart';
import '../../dto/codable.dart';

class BaseApi<T extends TargetTypeBase> {
  final String baseUrl = "https://e34f-156-200-245-47.eu.ngrok.io";
  final Dio _dio = Dio();

  Future<BaseResponse<M>> fetchData<M extends Codable>(T? targetType,M Function() data) async {

    RequestOptions requestOptions = RequestOptions(
        method: targetType?.method?.value,
        headers: targetType?.headers ?? {},
        path: targetType?.path ?? "",
        baseUrl: baseUrl,
        responseType: ResponseType.json,
        receiveDataWhenStatusError:true,
        validateStatus: (code) =>false,
        data: const JsonEncoder().convert(targetType?.requestParameters ?? {}));

    try{
      var  response = await _dio.fetch(requestOptions);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseResponse<M>(data()).fromJson(response.data);
      }else{
        return BaseResponse<M>(data()).fromJson(response.data);
      }
    } on DioError catch (e){
      var response = BaseResponse<M>(data()).fromJson(e.response?.data);
      return response;
    }
  }
}