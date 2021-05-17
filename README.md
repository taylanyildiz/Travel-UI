# expedition_travel_challenge



# Ask me
- ## linkedin [taylanyildz](https://www.linkedin.com/in/taylan-y%C4%B1ld%C4%B1z-02225a158/)
## Design
![design](https://user-images.githubusercontent.com/16286046/64514994-09339100-d2ec-11e9-9fde-2b48aa5c222b.gif)


|              App Display             | 
| :----------------------------------: | 
| <a  target="_blank"><img src="travel.gif" width="200"></a> |  


### Map Line Curved
##
#
 - [map curve line paint](https://github.com/taylanyildiz/Travel-UI/blob/master/lib/widgets/map_curve_line.dart)
```dart

final Animation<double> animation;

 Path path = Path();
    path.moveTo(size.width / 2 + size.width * .05 * animation.value, 5);
    path.cubicTo(
      size.width / 2 + size.width * .2 * animation.value,
      size.height / 6,
      size.width / 2,
      size.height / 6,
      size.width / 2 + size.width * .16 * animation.value,
      size.height / 3.3,
    );
    path.cubicTo(
      size.width / 2 + size.width * .3 * animation.value,
      size.height / 2,
      size.width / 2 + size.width * .3 * animation.value,
      size.height / 2,
      size.width / 2 + size.width * .12 * animation.value,
      size.height / 1.3,
    );
    path.cubicTo(
      size.width / 2,
      size.height / 1.3,
      size.width / 2,
      size.height / 1.3,
      size.width / 2 - size.width * .01 * animation.value,
      size.height / 1.2,
    );
    path.cubicTo(
      size.width / 2 - size.width * .2 * animation.value,
      size.height,
      size.width / 2,
      size.height,
      size.width / 2 - size.width * .18 * animation.value,
      size.height + 4,
    );

    if (animation.value > 0) {
      canvas.drawPath(path, mapLinePaint);
    }
```
### GesutureDetector Vertical Handler

##
#
 - [gesture](https://github.com/taylanyildiz/Travel-UI/blob/master/lib/widgets/home_screen.dart)
```dart
void _handleDragUpdate(DragUpdateDetails details) {
    _animationController.value -= details.primaryDelta! / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      _animationController.fling(velocity: max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _animationController.fling(velocity: min(-2.0, -flingVelocity));
    else
      _animationController.fling(
          velocity: _animationController.value < 0.5 ? -2.0 : 2.0);
  }
```
# Import
```
We can listen to the page change from all classes by using pageController in Pageview.
The class to listen to should benefit from the listenable feature,that is,inherit from the AnimatedWidget class.
```
### Example
```dart
    class ListenClassWidget extends AnimatedWidget{
        ListenClassWidget({
            Key? key,
            required this.controller,
        }):super(key: key,listenable:controller);

        final PageController controller;

        @override
        Widget build(BuildContext context){
            double opacity = 0.0;
            if(controller.position.hasContentDimensions){
                opacity = controller.page!;
            }
            return Opacity(
                opacity: opacity,
                child: ..../
            )
        }
    }
```
### PageView physics: ClampingScrollPhysics()
```dart
    PageView(
        controller:
        physics: ClampingScrollPhysics(),
        children:[
            ...
            ...
        ]
    )
    
```
### Provider Usage With Cunsomer

```t
 Using provider you can trigger the animation on another page.
```

```dart
    late AnimationController _animationController
    Listenable.value(
        value: _animationController
        child: ../
    )
```

```dart
    Consumer<AnimationController>(
        build: (context,animation,child){
            return Positioned(
                bottom : (1-animation.value)*200,
                child: TextButton(
                    onPressed: () => 
                    child Text('..'),
                )
            )
        }
    )
```
```dart
class MapAnimationNotifier with ChangeNotifier{

 

 AnimationController? _animation;
 
 MapAnimationNotifier(this._animation){
  _animation!.addListener(_onChangeAnimation);
 }
 
 void _onChangeAnimation(){
  notifyListeners();
 }
 
 Animation<double> get animation => _animation;
 
 double get value =>_animation!.value;
 
 void forward() => _animation!.forward();
 
 void reverse() => _animation!.reverse();
 

 @override
 void dispose(){
  super.dispose();
  _animation!.removeListener(_onChangeAnimation);
  _animation.dispose();
 }
}
```

```yaml
 provider:
```
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
