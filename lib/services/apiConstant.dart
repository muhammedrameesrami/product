class ApiConstants {
  static const String baseUrl =
      "https://barakahbazar.alisonsnewdemo.online/api";
  static const String imageBaseUrl =
      "https://barakahbazar.alisonsnewdemo.online";

  // Auth
  static const String login = "$baseUrl/login";

  // Products
  static const String products = "$baseUrl/products"; // Assumed endpoint

  // Home (If specific home endpoint exists, otherwise we might use products or banners)
  static const String home = "$baseUrl/home"; // Assumed endpoint
}
