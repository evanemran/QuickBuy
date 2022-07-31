import 'package:dio/dio.dart';
import 'package:quickbuy/models/responses/ProductDetailResponse.dart';
import 'package:quickbuy/models/responses/ProductsResponse.dart';
import 'package:retrofit/http.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://asos2.p.rapidapi.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('products/v2/list')
  Future<ProductsResponse> getProducts(
      @Header("X-RapidAPI-Key") String apikey,
      @Header("X-RapidAPI-Host") String appId,
      
      @Query("store") String store,
      @Query("offset") int offset,
      @Query("categoryId") int categoryId,
      @Query("limit") int limit,
      );

  @GET('products/v3/detail')
  Future<ProductDetailResponse> getProductDetail(
      @Header("X-RapidAPI-Key") String apikey,
      @Header("X-RapidAPI-Host") String appId,

      @Query("id") int id,
      );

}