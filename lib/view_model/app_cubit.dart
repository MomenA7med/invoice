import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);
  
  List<File> productImages = [];
  List<File> finalProductImages = [];
  Future<void> pickProductImage() async{
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      productImages.add(File(value!.path));
      emit(AppSuccessPickProductImages());
    }).catchError((onError){
      emit(AppFailedPickProductImages());
    });
  }

  void addImages(List<File> images){
    finalProductImages = [];
    finalProductImages.addAll(images);
  }

  void deleteProductImage(int index) {
    productImages.removeAt(index);
    emit(AppDeleteProductImage());
  }

  void getImages(){
    productImages = finalProductImages;
    emit(AppGetProductImage());
  }

}