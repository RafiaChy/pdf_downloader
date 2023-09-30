class AppInformation{
  static const baseURL = "base-url";
  static const baseWebURL = "base-web-url";
  static const appName = "app-name";
  static const appTitle = "app-title";
  static const debugBannerBoolean = "debug-banner-boolean";



  static Map<String, dynamic> dev = {
    baseURL: "https://devcoder.com",
    baseWebURL: "https://devcoder.com",
    appName:'Pdf Dev',
    debugBannerBoolean: true,
    appTitle: 'Pdf Downloader Dev'
  };

  static Map<String, dynamic> prod = {
    baseURL: "https://prodcoder.com",
    baseWebURL: "https://prodcoder.com",
    appName:'Pdf Downloader',
    debugBannerBoolean: false,
    appTitle: 'Pdf Downloader'
  };
}