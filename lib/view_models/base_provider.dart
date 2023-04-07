
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paparless_tech_test/config/locator.dart';
import 'package:image/image.dart' as img;
import 'package:paparless_tech_test/models/dog.dart';
import 'package:paparless_tech_test/services/app_http_service.dart';

class BaseProvider with ChangeNotifier {
TextEditingController emailCtrl  = TextEditingController();
TextEditingController passwordCtrl  = TextEditingController();
final service = locator<AppHttpService>();

//update ui
void updateUi(func){
  func();
  notifyListeners();
}

bool selectingImage = false;
bool uploadingImage = false;

 bool gettingImages = false;



  List<String> docTypes = ["ID Card", "Passport", "Driver's license"];

  XFile? frontImage;
  XFile? backImage;

  List<DogModel> dogs = [];


  String? docSelected = "Select Document";


  Future<bool> selectFrontImage(BuildContext context) async {
    //updateUi(selectingImage = true);
    try{

      var pickedImage = await service.selectImage(ImageSource.gallery);
      if (pickedImage != null) {
          frontImage = pickedImage;
       notifyListeners();
      }
      return true;
      //updateUi(selectingImage = false);
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cannot select image")));
      return false;
    }

  }


  //select the back image
  Future<bool> selectBackImage(BuildContext context) async {
    //updateUi(selectingImage = true);
    try{
      var pickedImage = await service.selectImage(ImageSource.gallery);
      if (pickedImage != null) {
          backImage = pickedImage;
          log(backImage!.path);
          notifyListeners();
      }

      return true;
      //updateUi(selectingImage = false);

    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cannot select image")));
      return false;
    }

  }

  //upload an image to the server using endpoint
  uploadImage (BuildContext context, {bool isWeb = false}) async {
    if (frontImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No image file has been selected")));
      return;
    }
     uploadingImage = true;
    try {
      var imgFile = File(frontImage!.path);
      var decodedImage = img.decodeImage(imgFile.readAsBytesSync());
      var encodedImage = img.encodeJpg(decodedImage!);
      var image = MultipartFile.fromBytes(encodedImage,
          filename: "image_$imgFile.jpg");
      Response response = await service.uploadImage(image);
      updateUi(()=> uploadingImage = false);
      log(response.data.toString());
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())));
      updateUi(()=> uploadingImage = false);
    }

  }


  //get the images from the api endpoint
  getImages() async {
    gettingImages = true;
    Response response = await service.getDogImages();
    dogs = response.data.map<DogModel>((json)=> DogModel.fromJson(json)).toList();
    updateUi(()=> gettingImages = false);
    log(dogs.length.toString());
  }

  getSelectedDocument(String value) {
    if (docSelected == null) {
      return docSelected = "Select Document";
    }
    docSelected = value;
    notifyListeners();
    return docSelected;
  }
}