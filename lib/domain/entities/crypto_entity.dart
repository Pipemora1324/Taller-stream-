class CryptoEntity {
  final String id;
  final String name;
  final double priceUsd;
  final double change24h;

  CryptoEntity({
    required this.id,
    required this.name,
    required this.priceUsd,
    required this.change24h,
  });
}