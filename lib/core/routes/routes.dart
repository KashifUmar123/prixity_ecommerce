import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/features/cart/cart_screen.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_bindings.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_screen.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_bindings.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_screen.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/order_summary_bindings.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/order_summary_screen.dart';
import 'package:prixity_ecommerce_app/features/product_detail/presentation/product_detail_bindings.dart';
import 'package:prixity_ecommerce_app/features/product_detail/presentation/product_detail_screen.dart';
import 'package:prixity_ecommerce_app/features/reviews/presentation/reviews_bindings.dart';
import 'package:prixity_ecommerce_app/features/reviews/presentation/reviews_screen.dart';
import 'package:prixity_ecommerce_app/features/splash/presentation/splash_bindings.dart';
import 'package:prixity_ecommerce_app/features/splash/presentation/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RoutePaths.splash,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: RoutePaths.discover,
      page: () => const DiscoverScreen(),
      bindings: [
        DiscoverBindings(),
        FiltersBindings(),
      ],
    ),
    GetPage(
      name: RoutePaths.productDetail,
      page: () => const ProductDetailScreen(),
      binding: ProductDetailBinings(),
    ),
    GetPage(
      name: RoutePaths.reviews,
      page: () => const ReviewsScreen(),
      binding: ReviewsBindings(),
    ),
    GetPage(
      name: RoutePaths.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: RoutePaths.orderSummary,
      page: () => const OrderSummaryScreen(),
      binding: OrderSummaryBindings(),
    ),
    GetPage(
      name: RoutePaths.filters,
      page: () => const FiltersScreen(),
    ),
  ];

  static GetPage getPage({
    required String name,
    required Widget page,
    Bindings? binding,
    List<Bindings>? bindings,
    dynamic arguments,
    Transition transition = Transition.fadeIn,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return GetPage(
      name: name,
      page: () => page,
      binding: binding,
      bindings: bindings ?? [],
      transition: transition,
      transitionDuration: transitionDuration,
    );
  }
}
