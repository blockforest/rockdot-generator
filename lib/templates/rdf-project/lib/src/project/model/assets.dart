part of acanvas_template;

///This class is autogenerated by executing 'pub run collect_assets' in your project's root.
///It collects all images from web/assets
class Assets {

    static BitmapData get acanvas_logo_wide_bnw {
    return _singleton.mgr.getBitmapData("acanvas_logo_wide_bnw");
  }
  static BitmapData get displacement_bubble {
    return _singleton.mgr.getBitmapData("displacement_bubble");
  }
  static BitmapData get acanvas_logotype_white {
    return _singleton.mgr.getBitmapData("acanvas_logotype_white");
  }


  ResourceManager mgr = new ResourceManager();
  static BitmapData getBitmapData(String id) {
    return _singleton.mgr.getBitmapData(id);
  }

  static final Assets _singleton = new Assets._internal();

  factory Assets() {
    return _singleton;
  }

  Assets._internal() {
  }

  static Future load() async {
    _singleton.mgr.addBitmapData("acanvas_logo_wide_bnw", "assets/autoload/acanvas-logo-wide-bnw@1x.png");
		_singleton.mgr.addBitmapData("displacement_bubble", "assets/autoload/displacement_bubble.png");
		_singleton.mgr.addBitmapData("acanvas_logotype_white", "assets/autoload/acanvas-logotype-white@1x.png");
		
    await _singleton.mgr.load();
  }
}
