import 'dart:html';
import 'dart:math';
import 'package:stagexl/stagexl.dart';

ButtonElement ferretButton;
ButtonElement destroyFerretButton;
RenderLoop renderloop;
Random random = new Random();

void main() {
  CanvasElement canvas = querySelector("#grow-canvas");
  ferretButton = querySelector("#ferret-button");
  destroyFerretButton = querySelector("#clear-button");
  Stage stage = new Stage(canvas);
  ferretButton.onClick.listen((e) => addFerret(e, stage));
  destroyFerretButton.onClick.listen((e) => stage.removeChildren(0, stage.numChildren - 1));
  
  renderloop = new RenderLoop()..addStage(stage);
}

void addFerret(_, Stage stage) {
  print(stage);
  var shape = new Shape();
  shape.graphics.rect(0, 0, 1, 1);
  shape.graphics.fillColor(Color.Red);
  shape.x = random.nextInt(800);
  shape.y = random.nextInt(600);
  shape.alpha = 0;
  stage.addChild(shape);
  
  var tween = new Tween(shape, 1.0, TransitionFunction.cosine);
  tween.animate.scaleX.to(50);
  tween.animate.scaleY.to(50);
  tween.animate.alpha.to(1);
  tween.animate.rotation.to(50);
  
  renderloop.juggler.add(tween);
}
