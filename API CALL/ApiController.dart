import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/DialogHelper.dart';
import '../network_services/api_services.dart';

class ApiController extends GetxController {

  List<ApiModel.Data> dataList= [];

  getApiData(BuildContext context) async {

    var serverResponse =
        await ApiServices.get(loginURL).catchError(handleError);
    debugPrint("server response $serverResponse");
    if (serverResponse == null) {
      DialogHelper.showCustomDialog(
          description: "Something went wrong. Try after sometimes");
      return null;
    } else {
      hideLoading();
      var data = json.decode(serverResponse.toString());
      if (data["status"]) {

        ApiModel apiModel = ApiModel.fromJson(data);
        dataList.addAll(apiModel.data);
        return dataList;
        //Using dataList we can retrieve the needed data like Author, Content, date, etc.,
      } else {
        var msg = data["message"];
        DialogHelper.showCustomDialog(description: msg);
        return "error";
      }
    }
  }
}
