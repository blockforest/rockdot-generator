part of google_example;

class GoogleExample extends AbstractReflowScreen implements IIOModelAware {
  static const int WIDTH_BUTTON = 240;

  MdWrap _wrap01;
  MdWrap _wrap02;
  IOModel _ioModel;

  @override
  void set ioModel(IOModel ioModel) {
    _ioModel = ioModel;
  }

  GoogleExample(String id) : super(id) {}

  @override
  void init({Map<String, String> params: null}) {
    super.init(params: params);

    /* Google Plus API */

    _wrap01 = new MdWrap(
        Theme.getHeadline(getProperty("col01").toUpperCase(),
            size: 18, color: Colors.WHITE),
        panelColor: Colors.WRAP_01);
    _wrap01.addChild(new MdButton("Show My Google+ Friends",
        bgColor: Theme.EXAMPLES_HIGHLIGHT_MAIN,
        fontColor: Colors.WHITE,
        width: WIDTH_BUTTON)
      ..submitEvent = new AcSignal(
          GoogleEvents.USER_LOGIN,
          new GoogleLoginVO(
              nextSignal: new AcSignal(
                  StateEvents.ADDRESS_SET,
                  getProperty(
                      GoogleExampleScreenIDs.GOOGLE_FRIENDS + ".url", true)))));
    _wrap01.addChild(new MdButton("Google Plus Me",
        bgColor: Theme.EXAMPLES_HIGHLIGHT_MAIN,
        fontColor: Colors.WHITE,
        width: WIDTH_BUTTON)
      ..submitEvent =
          new AcSignal(GoogleEvents.PLUS_USER_GET, "me", _onGoogleDataMe));
    _wrap01.addChild(new MdButton("Google Share",
        bgColor: Theme.EXAMPLES_HIGHLIGHT_MAIN,
        fontColor: Colors.WHITE,
        width: WIDTH_BUTTON)
      ..submitEvent = new AcSignal(GoogleEvents.PLUS_SHARE_RENDER));
    _wrap01.addChild(new MdButton("Google People Me",
        bgColor: Theme.EXAMPLES_HIGHLIGHT_MAIN,
        fontColor: Colors.WHITE,
        width: WIDTH_BUTTON)
      ..submitEvent = new AcSignal(
          GoogleEvents.PLUS_PEOPLE_GET, "me", _onGoogleDataFriends));
    _wrap01.span(300, 420);

    /* Google Speech API (alpha) */

    MdButton recordButton;
    MdButton stopButton;
    MdButton sendButton;

    recordButton = new MdButton("Record Mic",
        bgColor: Theme.EXAMPLES_HIGHLIGHT_MAIN,
        fontColor: Colors.WHITE,
        width: WIDTH_BUTTON)
      ..submitEvent = new AcSignal(IOEvents.MIC_RECORD_START)
      ..submitCallback = (_) {
        recordButton.disable();
        stopButton.enable();
      };

    stopButton = new MdButton("Stop Recording",
        bgColor: Theme.EXAMPLES_HIGHLIGHT_MAIN,
        fontColor: Colors.WHITE,
        width: WIDTH_BUTTON)
      ..submitEvent = new AcSignal(IOEvents.MIC_RECORD_STOP)
      ..submitCallback = (_) {
        stopButton.disable();
        sendButton.enable();
      }
      ..disable();

    sendButton = new MdButton("Recognize",
        bgColor: Theme.EXAMPLES_HIGHLIGHT_MAIN,
        fontColor: Colors.WHITE,
        width: WIDTH_BUTTON)
      //..submitEvent = new AcSignal(GoogleEvents.SPEECH_RECOGNIZE, _ioModel.mic_recorded_blob)
      ..submitCallback = (_) {
        new AcSignal(GoogleEvents.SPEECH_RECOGNIZE, _ioModel.mic_recorded_blob)
            .dispatch();
        recordButton.enable();
        sendButton.disable();
      }
      ..disable();

    _wrap02 = new MdWrap(
        Theme.getHeadline(getProperty("col02").toUpperCase(),
            size: 18, color: Colors.WHITE),
        panelColor: Colors.WRAP_02);
    _wrap02.addChild(recordButton);
    _wrap02.addChild(stopButton);
    _wrap02.addChild(sendButton);
    _wrap02.span(300, 420);

    reflow.addChild(_wrap01);
    reflow.addChild(_wrap02);

    /*
    _vbox.addChild(new MdButton("DB Test", bgColor: Theme.EXAMPLES_COLOR_BASE, fontColor: Colors.WHITE)..submitEvent = new AcSignal(UGCEvents.TEST));
    */

    addChild(reflow);
    onInitComplete();
  }

  void _onGoogleDataMe(Person person) {
    //TODO show dialog with user info
    print(person);
  }

  void _onGoogleDataFriends(List<Person> persons) {
    //TODO show dialog with user list
    print(persons);
  }
}
