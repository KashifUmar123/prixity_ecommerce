import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prixity_ecommerce_app/core/constants/app_collections.dart';
import 'package:prixity_ecommerce_app/features/discover/data/data_source/discover_data_source.dart';
import 'package:prixity_ecommerce_app/features/discover/data/models/filter_params.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class DiscoverDataSourceImp implements IDiscoverDataSource {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection(
    AppCollections.products,
  );

  @override
  Future<List<Product>> getProducts(FilterParams params) async {
    try {
      Query query = productsCollection;

      if (params.brand != null) {
        query = query.where("brand", isEqualTo: params.brand?.toMap());
      }

      if (params.rangeValues != null) {
        query = query
            .where("price", isGreaterThanOrEqualTo: params.rangeValues!.start)
            .where("price", isLessThanOrEqualTo: params.rangeValues!.end);
      }

      if (params.gender != null) {
        query = query.where("gender", isEqualTo: params.gender);
      }

      if (params.color != null) {
        query = query.where("colors", arrayContains: params.color?.toMap());
      }

      if (params.sortBy != null) {
        final String sortBy = params.sortBy!;
        if (sortBy == "Most recent") {
          query = query.orderBy("createdAt", descending: true);
        } else if (sortBy == "Lowest price") {
          query = query.orderBy("price");
        } else {
          query = query.orderBy("price", descending: true);
        }
      }
      // pagination logic
      /*
      if (params.lastProductId != null) {
        var lastDocument =
            await productsCollection.doc(params.lastProductId).get();
        query = query.startAfterDocument(lastDocument);
      }

      var response = await query.limit(20).get();
      */
      var response = await query.get();

      List<Product> products = response.docs.map((e) {
        Product product = Product.fromMap(e.data() as Map<String, dynamic>);
        product.id = e.id;
        return product;
      }).toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
