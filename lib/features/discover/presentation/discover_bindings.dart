import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/features/discover/data/repository/discover_repository_imp.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/repository/discover_repository.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/usecases/get_products_usecase.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_controller.dart';

class DiscoverBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDiscoverRepository>(() => DiscoverRepositoryImp());
    Get.lazyPut<GetProductsUsecase>(() => GetProductsUsecase(
        discoverRepository: Get.find<IDiscoverRepository>()));
    Get.put(DiscoverController(
        navigator: Get.find(),
        getProductsUsecase: Get.find<GetProductsUsecase>()));
  }
}
