library physics_example;

import 'dart:math' hide Point, Rectangle;
import 'dart:async' show Timer;

import 'package:stagexl/stagexl.dart';
import 'package:acanvas_commons/acanvas_commons.dart'
    show
        BoxSprite,
        AcGraphics,
        Ac,
        MdDimensions,
        MdIcon,
        MdFab,
        MdColor,
        MdButton,
        MdIconSet,
        MLifecycle;
import 'package:acanvas_physics/acanvas_physics.dart';

import 'package:acanvas_framework/src/core.all.dart' show AbstractAcPlugin;
import 'package:acanvas_template/acanvas_template.dart'
    show Colors, Theme, AbstractScreen, Dimensions, EffectIDs;

part 'src/physics_example_plugin.dart';
part 'src/model/physics_example_screen_ids.dart';

part 'src/view/screen/abstract_box2d_screen.dart';
part 'src/view/screen/paper_physics.dart';
part 'src/view/element/physics/i_box2d_element.dart';
part 'src/view/element/physics/abstract_box2d_element.dart';
part 'src/view/element/physics/m_box2d_helper.dart';
part 'src/view/element/physics/impl/buoyancy.dart';
part 'src/view/element/physics/impl/bridge.dart';
part 'src/view/element/physics/impl/ragdolls.dart';
part 'src/view/element/physics/impl/stacks.dart';
