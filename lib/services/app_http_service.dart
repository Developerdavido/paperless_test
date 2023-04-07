

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paparless_tech_test/constants/strings.dart';
import 'package:paparless_tech_test/services/http_service.dart';

class AppHttpService extends HttpService {
  ImagePicker imagePicker = ImagePicker();

  Future<XFile> selectImage(ImageSource imageSource) async {
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: imageSource, maxWidth: 400, maxHeight: 400, imageQuality: 70);
    return pickedFile!;
  }


  uploadImage(MultipartFile? image) async {
    var formData = FormData.fromMap({
      "upload_preset" : "ix8u70vl",
      "file": image
    });
    var response = await post(AppStrings.uploadImage, formData);
    return response;
  }


  getDogImages() async {
    var response = await get(AppStrings.getDogImages);
    return response;
  }

}