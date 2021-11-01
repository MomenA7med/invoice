import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice/view_model/company_state.dart';

class CompanyCubit extends Cubit<CompanyState>{
  CompanyCubit() : super(CompanyInitState());

  static CompanyCubit get(context) => BlocProvider.of(context);
  
  File? companyImage;
  Future<void> pickCompanyImage() async{
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      companyImage = File(pickedFile.path);
      emit(CompanySuccessPickImage());
    }
    emit(CompanyFailedPickImage());
  }

}