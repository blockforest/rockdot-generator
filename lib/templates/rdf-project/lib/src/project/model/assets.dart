part of rockdot_template;

///This class is autogenerated by executing 'pub run collect_assets' in your project's root.
///It collects all images from web/assets
class Assets {
  static BitmapData get displacement_bubble {
    return _singleton.mgr.getBitmapData("displacement_bubble");
  }

  static BitmapData get rockdot {
    return _singleton.mgr.getBitmapData("rockdot");
  }

  static BitmapData get logo_rockdot_small {
    return _singleton.mgr.getBitmapData("logo_rockdot_small");
  }

  ResourceManager mgr = new ResourceManager();
  static BitmapData getBitmapData(String id) {
    return _singleton.mgr.getBitmapData(id);
  }

  static final Assets _singleton = new Assets._internal();

  factory Assets() {
    return _singleton;
  }

  Assets._internal() {}

  static Future load() async {
    _singleton.mgr.addBitmapData(
        "displacement_bubble", "assets/autoload/displacement_bubble.png");
    _singleton.mgr.addBitmapData("rockdot", "assets/autoload/rockdot@1x.png");
    _singleton.mgr.addBitmapData(
        "logo_rockdot_small", "assets/autoload/logo_rockdot_small@1x.png");

    await _singleton.mgr.load();
  }
}
