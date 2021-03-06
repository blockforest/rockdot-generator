part of gaf_example;

class GafSlotMachine extends AbstractScreen {
  SlotMachineGame _slotMachineGame;

  GAFAsset _gafAsset;
  num _originalWidth;

  GafSlotMachine(String id) : super(id) {
    requiresLoading = true;
  }

  @override
  Future load({Map params: null}) async {
    _gafAsset =
        await GAFAsset.load('assets/gaf/slot_machine/slot_machine.gaf', 1, 1);
    onLoadComplete();
  }

  @override
  void init({Map<String, String> params: null}) {
    super.init(params: params);

    // load and show the slot machine GAF asset

    var gafTimeline = _gafAsset.getGAFTimelineByLinkage('rootTimeline');

    var slotMachine = new SlotMachine(gafTimeline);
    _slotMachineGame = new SlotMachineGame(slotMachine);

    addChild(_slotMachineGame);
    Ac.JUGGLER.add(_slotMachineGame);

    onInitComplete();
  }

  @override
  void refresh() {
    super.refresh();

    _originalWidth ??= _slotMachineGame.width / 2;
    _slotMachineGame.scaleX =
        _slotMachineGame.scaleY = spanWidth / _originalWidth;

    _slotMachineGame.x = 40 * _slotMachineGame.scaleX;
    _slotMachineGame.y = 20 * _slotMachineGame.scaleX;
  }

  @override
  void dispose({bool removeSelf: true}) {
    Ac.JUGGLER.remove(_slotMachineGame);

    Ac.JUGGLER.removeTweens(this);
    super.dispose();
  }
}
