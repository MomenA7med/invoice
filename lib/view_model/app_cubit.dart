import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/utils/NetworkHelper/networking_helper.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<File> productImages = [];
  List<File> finalProductImages = [];
  File? productImage;
  XFile? imagePicked;
  Future<void> pickProductImage() async {
    ImagePicker picker = ImagePicker();
    imagePicked =
        await picker.pickImage(source: ImageSource.gallery).then((value) {
      //productImages.add(File(value!.path));
      productImage = File(value!.path);
      emit(AppSuccessPickProductImages());
    }).catchError((onError) {
      emit(AppFailedPickProductImages());
    });
  }

  void addImages(List<File> images) {
    finalProductImages = [];
    finalProductImages.addAll(images);
  }

  void deleteProductImage(int index) {
    productImages.removeAt(index);
    emit(AppDeleteProductImage());
  }

  void getImages() {
    productImages = finalProductImages;
    emit(AppGetProductImage());
  }

  void addProduct({
    required String name,
    required String price,
    required String code,
    required String desc,
    required XFile image,
  }) async {
    emit(AddProductStateLoading());
    Map<String, dynamic> patchRequestData = {
      "name": name,
      "price": price,
      "code": code,
      "description": desc,
      "image": image != null
          ? await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last,
              contentType: MediaType("image", "jepg"))
          : null,
    };
    FormData data = FormData.fromMap(patchRequestData);
    await NetworkingHelper(endPoint: kAddProduct)
        .postData(postRequest: data)
        .then((value) {
      print(value.toString());
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(AddProductStateFailed());
      } else {
        emit(AddProductStateSuccess());
      }
    }).catchError((onError) {
      emit(AddProductStateFailed());
      print('error : ' + onError.toString());
    });
  }
}
