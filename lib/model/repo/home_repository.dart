import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/api/request/sort_request.dart';
import 'package:ybc/model/api/response/banner_response.dart';
import 'package:ybc/model/api/response/category_response.dart';
import 'package:ybc/model/api/response/courser_detail_response.dart';
import 'package:ybc/model/api/response/courses_courser_response.dart';
import 'package:ybc/model/api/response/courses_response.dart';
import 'package:ybc/model/api/response/home_response.dart';
import 'package:ybc/model/api/response/menu_response.dart';
import 'package:ybc/model/api/response/news_detail_response.dart';
import 'package:ybc/model/api/response/news_response.dart';
import 'package:ybc/model/api/response/thought_response.dart';
import 'package:ybc/model/api/response/profile_response.dart';
import 'package:ybc/model/api/rest_client.dart';

class HomeRepository {
  final Dio dio;

  HomeRepository({@required this.dio});

  Future<NewsResponse> getNews({
    @required int categoryId,
    @required String name,
    @required String create,
  }) async {
    final client = RestClient(dio);
    return client.getNews(
        categoryId ?? null, SortRequest(name ?? '', create ?? ''));
  }

  Future<NewsResponse> getNewsCategory({
    int categoryId,
    @required String name,
    @required String create,
  }) async {
    final client = RestClient(dio);
    return client.getNewsCategory(
        SortRequest(name ?? '', create ?? ''), categoryId ?? '');
  }

  Future<CoursesResponse> getCourser({
    int categoryId,
    @required String name,
    @required String create,
  }) async {
    final client = RestClient(dio);
    return client.getCourser(
        categoryId ?? null, SortRequest(name ?? '', create ?? ''));
  }

  Future<CoursesCategoriesResponse> getCourserCategory() async {
    final client = RestClient(dio);
    return client.getCourserCategory();
  }

  Future<BannerResponse> getBanner() async {
    final client = RestClient(dio);
    return client.getBanner();
  }

  Future<ThoughtResponse> getThought() async {
    final client = RestClient(dio);
    return client.getThought();
  }

  Future<MenuResponse> getMenu() async {
    final client = RestClient(dio);
    return client.getMenu();
  }

  Future<NewsDetailResponse> getNewsDetail({
    @required int newsId,
  }) async {
    final client = RestClient(dio);
    return client.getNewsDetail(newsId);
  }

  Future<HomeResponse> getHomeData() async {
    final client = RestClient(dio);
    return client.getHomeData();
  }

  Future<CourserDetailResponse> getCourserDetail({
    @required int courserId,
  }) async {
    final client = RestClient(dio);
    return client.getCourserDetail(courserId);
  }

  Future<CategoryResponse> getCategory({
    @required int categoryId,
  }) async {
    final client = RestClient(dio);
    return client.getCategory(categoryId);
  }

  Future<ProfileResponse> getInformation({
    @required int idUser,
  }) async {
    final client = RestClient(dio);
    return client.getInformation(idUser);
  }
}
