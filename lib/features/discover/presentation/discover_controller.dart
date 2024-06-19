import 'dart:developer';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/features/discover/data/models/filter_params.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/usecases/get_products_usecase.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';

class DiscoverController extends BaseController {
  final GetProductsUsecase _getProductsUsecase;
  DiscoverController(
      {required super.navigator,
      required GetProductsUsecase getProductsUsecase})
      : _getProductsUsecase = getProductsUsecase;

  bool isLoading = false;
  String? error;
  List<Product> products = [];
  FilterParams filterParams = FilterParams();

  // brands
  final List<Brand> brands = [
    Brand(name: "All", iconPath: ""),
    Brand(name: "NIKE", iconPath: KImages.nike),
    Brand(name: "Puma", iconPath: KImages.puma),
    Brand(name: "Adidas", iconPath: KImages.adidas),
    Brand(name: "Reebok", iconPath: KImages.reebok),
  ];

  // selected brand
  late Brand selectedBrand;

  @override
  void onInit() {
    super.onInit();
    selectedBrand = brands.first;
    _getData();
  }

  Future<void> _getData({bool refresh = false}) async {
    isLoading = true;
    error = null;
    update();

    final response = await _getProductsUsecase.call(filterParams);
    response.fold((left) {
      if (!refresh) {
        error = left.message;
      } else {
        // raise the error via snackbar
      }
      log("in left: ${left.message}");
    }, (right) {
      if (refresh) {
        products = right;
      } else {
        products = [...right, ...products];
      }
    });
    isLoading = false;
    update();
  }

  void setBrand(Brand value) {
    selectedBrand = value;
    filterParams.brand = value;
    _getData();
    update();
  }

  void onProductTap(Product product) {
    navigator.pushNamed(RoutePaths.productDetail, arguments: product);
  }

  void onCartTap() async {
    navigator.pushNamed(RoutePaths.cart);
  }

  void onFiltersTap() async {
    var result =
        await navigator.pushNamed(RoutePaths.filters, arguments: filterParams);
    if (result != null && result is FilterParams) {
      filterParams = result;
      if (filterParams.brand != null) {
        setBrand(filterParams.brand!);
      } else {
        _getData(refresh: true);
      }
    }
  }
}
