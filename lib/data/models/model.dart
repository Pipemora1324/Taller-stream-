import '../../domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  CryptoModel({
    required super.id,
    required super.name,
    required super.priceUsd,
    required super.change24h,
  });

  factory CryptoModel.fromJson(String id, Map<String, dynamic> json) {
    final names = {
      'bitcoin': 'Bitcoin',
      'ethereum': 'Ethereum',
      'solana': 'Solana',
    };
    return CryptoModel(
      id: id,
      name: names[id] ?? id,
      priceUsd: (json['usd'] as num).toDouble(),
      change24h: (json['usd_24h_change'] as num).toDouble(),
    );
  }
}