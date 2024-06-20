import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:prixity_ecommerce_app/core/constants/app_contants.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_snackbar.dart';
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
  bool isPaginating = false;
  String? error;
  List<Product> products = [];
  FilterParams filterParams = FilterParams();
  int pageSize = 20;
  late ScrollController scrollController;

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
    filterParams.rangeValues = AppConstants.defaultRangeValues;
    scrollController = ScrollController();
    _getData();
  }

  Future<void> retry() async {
    await _getData();
  }

  Future<void> onRefresh() async {
    await _getData(refresh: false, isPullDown: true);
  }

  @override
  void onReady() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (filterParams.lastProductId != null && !isPaginating) {
          _getData(refresh: false);
        }
      }
    });
    super.onReady();
  }

  Future<void> _getData({
    bool refresh = true,
    bool isPullDown = false,
  }) async {
    isLoading = refresh;
    isPaginating = true;
    error = null;
    update();
    if (refresh) {
      filterParams.lastProductId = null;
    }

    final response = await _getProductsUsecase.call(filterParams);
    response.fold((left) {
      if (!refresh) {
        error = left.message;
      } else {
        CustomSnackbars.errorSnackbar(message: left.message);
      }
      log("in left: ${left.message}");
    }, (right) {
      // if (right.length >= 20) {
      //   filterParams.lastProductId = right.last.id;
      // } else {
      //   filterParams.lastProductId = null;
      // }
      if (refresh || isPullDown) {
        products = right;
      } else {
        products = [...products, ...right];
      }
    });
    isLoading = false;
    isPaginating = false;
    update();
  }

  void setBrand(Brand value) {
    selectedBrand = value;
    if (value.name == "All") {
      filterParams.brand = null;
    } else {
      filterParams.brand = value;
    }
    update();
    _getData();
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
        selectedBrand = brands.first;
        _getData();
      }
    }
  }

  bool get hasFiltersApplied => filterParams.hasNonRangeValues;
}
