import 'package:dio/dio.dart';
import '../models/anime_model.dart';

class AnimeService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.jikan.moe/v4/top/anime';

  Future<List<Datum>> fetchAnimeList() async {
    try {
      final response = await _dio.get(_baseUrl);

      // Ubah seluruh response jadi objek Anime (wrapper)
      final anime = AnimeModel.fromJson(response.data);

      // Ambil list Datum-nya saja, fallback ke list kosong kalau null
      return anime.data ?? [];
    } on DioException catch (e) {
      throw Exception('Gagal mengambil data anime: ${e.message}');
    }
  }
}