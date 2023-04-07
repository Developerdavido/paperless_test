

class PluginModel {

  final String? image;
  final String? title;
  final String? subTitle;

  PluginModel({this.image, this.title, this.subTitle});

  static List<PluginModel> myPlugins  = [
    PluginModel(image: "assets/images/about_plugin_icon.png", title: "About Section", subTitle: "Add an about section to your listings pages"),
    PluginModel(image: "assets/images/chat_plugin_icon.png", title: "Live Chat", subTitle: "Include a live chat functionality to your listings"),
    PluginModel(image: "assets/images/faq_plugin_icon.png", title: "FAQ", subTitle: "Add a FAQ section to your listings page"),
    PluginModel(image: "assets/images/reviews_plugin_icon.png", title: "Reviews", subTitle: "Allow users to add reviews to your listings"),
    PluginModel(image: "assets/images/ammenities_plugin_icon.png", title: "Utilities", subTitle: "Add a utilities/amenities section to your listings pages"),
    PluginModel(image: "assets/images/shoppinc_cart_plugin.png", title: "Shopping cart", subTitle: "This adds a shopping cart to your listing, Users can select products and pay for them"),
  ];
}