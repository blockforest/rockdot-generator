part of acanvas_template;

/// The AbstractScreen class contains settings applicable to all screens of an application.

class AbstractScreen extends LifecycleSprite with MApplicationContextAware {
  AbstractScreen(String id) : super(id) {
    padding = Ac.MOBILE ? 32 : 52;
    inheritSpan = true;
  }

  @override
  String getProperty(String key,
      [bool omitPrefix = false, String prefix = ""]) {
    return super.getProperty(key, omitPrefix, this.name);
  }

  /// This is the place where you add anything to this method that needs initialization.
  /// This especially applies to members of the display list.

  @override
  void init({Map<String, String> params: null}) {
    super.init(params: params);
  }

  /// Positioning logic goes here. Use spanWidth and spanHeight to find out about available space.

  @override
  void refresh() {
    super.refresh();
  }

  /// Put anything here that needs special disposal.
  /// Note that the super function already takes care of display objects.

  @override
  void dispose({bool removeSelf: true}) {
    Ac.JUGGLER.removeTweens(this);
    super.dispose();
  }

  /// Set spanWidth and spanHeight according to calculations in Dimensions class.

  @override
  void span(num spanWidth, num spanHeight, {bool refresh: true}) {
    super.span(Dimensions.WIDTH_CONTENT, Dimensions.HEIGHT_CONTENT);
    x = Dimensions.X_PAGES;
    y = Dimensions.Y_PAGES;
  }

  /// Use this in case all your fade in / fade out stuff is the same for all screens

  @override
  void appear({double duration: MLifecycle.APPEAR_DURATION_DEFAULT}) {
    super.appear(duration: duration);
  }

  @override
  void disappear(
      {double duration: MLifecycle.DISAPPEAR_DURATION_DEFAULT,
      bool autoDispose: false}) {
    super.disappear(duration: duration, autoDispose: autoDispose);
  }
}
