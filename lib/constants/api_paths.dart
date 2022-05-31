part of 'constants.dart';

const int kApiResponseLimit = 9;
const double kVatPercentage = 0.15;
const String kGoogleUrl = "google.com";
const String kBaseUrl = "inpaid.ml";
// const String kBaseUrl = "perla-ecommerce.herokuapp.com";
const String kUrl = "https://$kBaseUrl/";
const String kBaseUrlApi = kUrl + "api/v1/";

const String kSliderImagesApi = kUrl + "imgs/slider/";
const String kCategoryImagesApi = kUrl + "imgs/category/";
const String kProductImagesApi = kUrl + "imgs/product/";
const String kDefaultImageApi = kProductImagesApi + "default.jpg";
const String kGetProducts = kUrl + "product/dashboard-get-for-one-company/";
const String kGetClients = kUrl + "client/dashboard-get-for-one-company/";
const String kGetInvoices = kUrl + "invoice?page=1&limit=9";
const String kAddClient = kUrl + "client";
const String kAddProduct = kUrl + "product";
const String kCreateInvoice = kUrl + "invoice";
const String kGetInvoiceId = kUrl + "invoice";
const String kDeleteClient = kUrl + "client/";
const String kDeleteProduct = kUrl + "product/";
const String kDeleteInvoice = kUrl + "invoice/";

const String kPerlaPoliciesApi = kBaseUrlApi + "policy";
const String kFacebookLoginApi = kBaseUrlApi + "auth/facebook/login";
const String kGoogleLoginApi = kBaseUrlApi + "auth/google/login";
const String kLoginApi = kUrl + "auth/login";
const String kSignUpApi = kUrl + "auth/signup";
const String kGetUser = kBaseUrlApi + "user/get-user";
const String kSliderApi = kBaseUrlApi + "slider";
const String kSearchApi = kBaseUrlApi + "product/search";
const String kGetAllCitiesApi = kBaseUrlApi + "city?limit=100";
const String kGetCartItemsApi = kBaseUrlApi + "cart/get-cart-items";
const String kApplyCouponApi = kBaseUrlApi + "coupon/apply-coupon";
const String kCreateNewAddressApi = kBaseUrlApi + "user/address/create";
const String kGetUserAddressApi = kBaseUrlApi + "user/address/get";
const String kGetWishListApi = kBaseUrlApi + "user/get/wishlist";
const String kGetArticleCategoryApi = kBaseUrlApi + "articleCategory";
const String kGetCompetitionsApi = kBaseUrlApi + "competition";
const String kAuthGoogleLogin = kBaseUrlApi + "auth/google/login";
const String kVerifyCode = kBaseUrlApi + "user/verify-password";

String kUpdateUserApi(String userId) {
  return kBaseUrlApi + "user/$userId";
}

String kGetUserCity(String cityId) {
  return kBaseUrlApi + "city/$cityId";
}

String kMainCategoriesApi({int? page}) {
  return kBaseUrlApi + "category/c/main?page=${page ?? 1}";
}

String kSubCategoriesApi(String mainCategoryId, {int? page}) {
  return kBaseUrlApi + "category/$mainCategoryId/subcategory?page=${page ?? 1}";
}

String kBestSellersApi({int? page}) {
  return kBaseUrlApi + "product/get-bestsellers?page=${page ?? 1}";
}

String kOffersApi({int? page}) {
  return kBaseUrlApi + "discount/offers?page=${page ?? 1}";
}

String kProductsInMainCategoryApi(String mainCategoryId, {int? page}) {
  return kBaseUrlApi +
      "category/main/$mainCategoryId/products?page=${page ?? 1}";
}

String kProductsInSubCategoryApi(String subCategoryId, {int? page}) {
  return kBaseUrlApi + "category/sub/$subCategoryId/products?page=${page ?? 1}";
}

String kGetProductBySaleCodeApi(String saleCode) {
  return kBaseUrlApi + "product/get-product-by-salecode/$saleCode";
}

String kShareProductApi(String saleCode) {
  return "https://perla-ksa.com/product-details/" + saleCode;
}

String kAddOrRemoveFromCartApi(
    {@required String? productId, bool addToCart = true}) {
  String endPoint = addToCart ? "add-to-cart" : "remove-from-cart";

  return kBaseUrlApi + "cart/$endPoint/$productId";
}

String kUpdateCartItemsApi(String productId) {
  return kBaseUrlApi + "cart/update-cart-items/$productId";
}

String kOrdersApi({int? page}) {
  return kBaseUrlApi + "user/get/orders?page=${page ?? 1}";
}

String kMakeOrderApi() {
  return kBaseUrlApi + "order";
}

String kAddOrDeleteFromWishListApi(String productId, {bool isAdd = false}) {
  String endpoint = isAdd ? "add" : "delete";

  return kBaseUrlApi + "user/wishlist/" + endpoint + "/$productId";
}

String kDeleteFromWishListApi(String productId) {
  String endpoint = "delete";

  return kBaseUrlApi + "user/wishlist/" + endpoint + "/$productId";
}

String kGetArticleDetailsByIdApi(String articleId) {
  return kBaseUrlApi + "article/Category/" + articleId;
}

String kAddCommentToAnArticleApi(
  String articleId, {
  String commentId = "",
  bool isLike = false,
}) {
  return kBaseUrlApi +
      "article/" +
      articleId +
      "/comment/" +
      commentId +
      (isLike ? "/like" : "");
}

String kGetCompetitionPointsApi(String competitionId) {
  return kBaseUrlApi + "user/competition/" + competitionId;
}

String kGetUserImage(String image) {
  return kUrl + "imgs/user/" + image;
}
