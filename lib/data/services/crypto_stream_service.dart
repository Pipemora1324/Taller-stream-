import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/crypto_entity.dart';
import '../models/crypto_model.dart';

class CryptoStreamService {
  final _controller = StreamController<List<CryptoEntity>>();
  Timer? _timer;

  static const _url =
      'https://api.coingecko.com/api/v3/simple/price'
      '?ids=bitcoin,ethereum,solana'
      '&vs_currencies=usd'
      '&include_24hr_change=true';

  Stream<List<CryptoEntity>> get cryptoStream => _controller.stream;

  void start() {
    _fetchAndEmit();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _fetchAndEmit());
  }

  Future<void> _fetchAndEmit() async {
    try {
      final response = await http.get(
        Uri.parse(_url),
        headers: {'User-Agent': 'proyecto_stream/1.0'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final list = data.entries
            .map((e) => CryptoModel.fromJson(e.key, e.value))
            .toList();
        _controller.add(list);
      } else if (response.statusCode == 429) {
        _controller.addError('Límite de API alcanzado. Reintentando en 30s...');
      } else {
        _controller.addError('Error del servidor: ${response.statusCode}');
      }
    } catch (e) {
      _controller.addError('Sin conexión. Verifica tu red.');
    }
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}