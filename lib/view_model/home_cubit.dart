import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/models/GetClientsResponse.dart';
import 'package:invoice/models/GetInvoicesRespnse.dart';
import 'package:invoice/models/OrderIdModel.dart';
import 'package:invoice/models/ProductsModel.dart';
import 'package:invoice/utils/NetworkHelper/networking_helper.dart';
import 'package:invoice/view_model/home_state.dart';

import '../constants/singleton/UserSingleton.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool productIsLoading = false;
  bool clientIsLoading = false;

  Products? productsResponse;
  GetClientsResponse? clientsResponse;
  GetInvoicesResponse? invoicesResponse;
  InvoiceByIdResponse? invoiceByIdResponse;

  void getProducts({
    required String id,
  }) async {
    productIsLoading = true;
    emit(GetProductsStateLoading());
    await NetworkingHelper(endPoint: kGetProducts + id).getData().then((value) {
      productIsLoading = false;
      print(value.toString());
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(GetProductsStateFailed());
      } else {
        productsResponse = Products.fromJson(value);
        emit(GetProductsStateSuccess());
      }
    }).catchError((onError) {
      print('error : ' + onError.toString());
      emit(GetProductsStateFailed());
    });
  }

  void getClients({
    required String id,
  }) async {
    clientIsLoading = true;
    emit(GetClientsStateLoading());
    await NetworkingHelper(endPoint: kGetClients + id + '?limit=100')
        .getData()
        .then((value) {
      clientIsLoading = false;
      print(value.toString());
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(GetClientsStateFailed());
      } else {
        clientsResponse = GetClientsResponse.fromJson(value);
        print('client : ' + clientsResponse!.toJson().toString());
        emit(GetClientsStateSuccess());
      }
    }).catchError((onError) {
      print('error in client: ' + onError.toString());
      emit(GetClientsStateFailed());
    });
  }

  void getInvoices() async {
    emit(GetInvoicesStateLoading());
    await NetworkingHelper(endPoint: kGetInvoices).getData().then((value) {
      print(value.toString());
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(GetInvoicesStateFailed());
      } else {
        invoicesResponse = GetInvoicesResponse.fromJson(value);
        emit(GetInvoicesStateSuccess());
      }
    }).catchError((onError) {
      print('error : ' + onError.toString());
      emit(GetInvoicesStateFailed());
    });
  }

  void addClient({
    required String name,
    required String phone,
    required String address,
    required String email,
    required String fax,
    required int type,
    int? vat,
    String? cr,
  }) async {
    emit(AddClientStateLoading());
    await NetworkingHelper(endPoint: kAddClient).postData(postRequest: {
      "name": name,
      "phone": phone,
      "email": email,
      "address": address,
      "fax": fax,
      "type": type,
      "VAT": vat,
      "CR": cr,
    }).then((value) {
      print(value.toString());
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(AddClientStateFailed());
      } else {
        getClients(id: value['companyId'].toString());
        emit(AddClientStateSuccess());
      }
    }).catchError((onError) {
      emit(AddClientStateFailed());
      print('error : ' + onError.toString());
    });
  }

  File? productImage;
  XFile? imagePicked;
  Future<void> pickProductImage() async {
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      //productImages.add(File(value!.path));
      imagePicked = value;
      productImage = File(value!.path);
      emit(AppSuccessPickProductImages());
    }).catchError((onError) {
      emit(AppFailedPickProductImages());
    });
  }

  void addProduct({
    required String name,
    required String price,
    required String code,
    required String desc,
    XFile? image,
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
    print('request : ' + patchRequestData.toString());
    await NetworkingHelper(endPoint: kAddProduct)
        .postData(postRequest: data)
        .then((value) {
      print(value.toString());
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(AddProductStateFailed());
      } else {
        getProducts(id: value['companyId'].toString());
        emit(AddProductStateSuccess());
      }
    }).catchError((onError) {
      emit(AddProductStateFailed());
      print('error : ' + onError.toString());
    });
  }

  void createInvoice({
    required List<Product> products,
    required String note,
    required int clientId,
    required int status,
    required String title,
    required double net,
  }) async {
    emit(CreateInvoiceStateLoading());
    List<int> productsId = [];
    products.forEach((element) {
      productsId.add(element.id!);
    });
    Map<String, dynamic> patchRequestData = {
      "title": title,
      "notes": note,
      "net": net,
      "status": status,
      "clientId": clientId,
      "products": productsId,
    };
    print('request : ' + patchRequestData.toString());
    await NetworkingHelper(endPoint: kCreateInvoice)
        .postData(postRequest: patchRequestData)
        .then((value) {
      print(value.toString());
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(CreateInvoiceStateFailed());
      } else {
        getInvoices();
        emit(CreateInvoiceStateSuccess());
      }
    }).catchError((onError) {
      emit(CreateInvoiceStateFailed());
      print('error : ' + onError.toString());
    });
  }

  void getInvoiceById(int invoiceId) async {
    emit(GetInvoiceStateLoading());
    await NetworkingHelper(endPoint: kGetInvoiceId + '/${invoiceId.toString()}')
        .getData()
        .then((value) {
      invoiceByIdResponse = InvoiceByIdResponse.fromJson(value);
      emit(GetInvoiceStateSuccess());
    }).catchError((onError) {
      emit(GetInvoiceStateFailed());
    });
  }

  Future<bool> deleteClient(String clientId) async {
    emit(DeleteClientStateLoading());
    await NetworkingHelper(endPoint: kDeleteClient + '$clientId')
        .deleteData()
        .then((value) {
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(DeleteClientStateFailed());
        return false;
      } else {
        getClients(id: UserSingleton().user!.company!.id.toString());
        emit(DeleteClientStateSuccess());
      }
      return true;
    }).catchError((onError) {
      emit(DeleteClientStateFailed());
      return false;
    });
    return false;
  }

  Future<bool> deleteProduct(String productId) async {
    emit(DeleteProductStateLoading());
    await NetworkingHelper(endPoint: kDeleteProduct + '$productId')
        .deleteData()
        .then((value) {
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(DeleteProductStateFailed());
        return false;
      } else {
        getProducts(id: UserSingleton().user!.company!.id.toString());
        emit(DeleteProductStateSuccess());
      }
      return true;
    }).catchError((onError) {
      emit(DeleteProductStateFailed());
      return false;
    });
    return false;
  }

  Future<bool> deleteInvoice(String invoiceId) async {
    emit(DeleteInvoiceStateLoading());
    await NetworkingHelper(endPoint: kDeleteInvoice + '$invoiceId')
        .deleteData()
        .then((value) {
      if (value['statusCode'] != 200 && value['statusCode'] != null) {
        print(value['message']);
        emit(DeleteInvoiceStateFailed());
        return false;
      } else {
        getInvoices();
        emit(DeleteInvoiceStateSuccess());
      }
      return true;
    }).catchError((onError) {
      emit(DeleteInvoiceStateFailed());
      return false;
    });
    return false;
  }
}
