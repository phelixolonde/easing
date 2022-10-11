EasingFunction easingLinear;
EasingFunction easingQuadraticIn;
EasingFunction easingQuadraticInOut;
EasingFunction cubicEaseInOut;
EasingFunction quarticEaseIn;
EasingFunction sinEaseIn;
EasingFunction sinEaseInOut;
EasingFunction expoEaseIn;
EasingFunction expoEaseOut;
EasingFunction circularEaseIn;
  void setup(){
  size(600,400);
  easingLinear = new LinearEasing(0,height,0,255);
  easingQuadraticIn = new QuadraticEaseIn(0,height,0,255);
  easingQuadraticInOut = new QuadraticEaseInOut(0,height,0,255);
  cubicEaseInOut = new QuadraticEaseInOut(0, height, 0, 255);
  quarticEaseIn = new QuadraticEaseInOut(0, height, 0, 255);
  sinEaseIn = new QuadraticEaseInOut(0, height, 0, 255);
  sinEaseInOut = new QuadraticEaseInOut(0, height, 0, 255);
  expoEaseIn = new QuadraticEaseInOut(0, height, 0, 255);  
  expoEaseOut = new QuadraticEaseInOut(0, height, 0, 255);
  circularEaseIn = new QuadraticEaseInOut(0, height, 0, 255);
  }
  void draw(){
  for(float i = 0; i < height; i++){
  stroke(easingLinear.tween(i));
  line(0,i, width/3, i);
  stroke(easingQuadraticIn.tween(i));
  line(width/3,i, 2*width/3, i);
  stroke(easingQuadraticInOut.tween(i));
  line(2*width/3,i, width, i);
  stroke(cubicEaseInOut.tween(i));
  line(width, i, width, i);
  stroke(quarticEaseIn.tween(i));
  line(2 * width, i, width, i);
  stroke(sinEaseIn.tween(i));
  line(3 * width, i, width, i);
  stroke(sinEaseInOut.tween(i));
  line(4 * width, i, width, i);
  stroke(expoEaseIn.tween(i));
  line(5 * width, i, width, i);
  stroke(expoEaseOut.tween(i));
  line(6 * width, i, width, i);
  stroke(circularEaseIn.tween(i));
  line(2 * width, i, width, i);
  }
  save("easing.tif");
  }

class EasingFunction {
float start1;
float stop1;
float start2;
float stop2;
EasingFunction(float start1, float stop1, float start2, float stop2) {
this.start1 = start1;
this.start2 = start2;
this.stop1 = stop1;
this.stop2 = stop2;
}
public float tween(float value) {
float b = start2;
float c = stop2 - start2;
float t = value - start1;
float d = stop1 - start1;
return tween(b, c, t, d);
}
float tween(float begin, float change, float time, float duration) {
return 0;
}
}
class LinearEasing extends EasingFunction {
LinearEasing(float start1, float stop1, float start2, float stop2) {
super(start1, stop1, start2, stop2);
}
float tween(float begin, float change, float time, float duration) {
return change * time / duration + begin;
}
}

class QuadraticEaseIn extends EasingFunction {
QuadraticEaseIn(float start1, float stop1, float start2, float stop2) {
super(start1, stop1, start2, stop2);
}
float tween(float begin, float change, float time, float duration) {
return change * time / duration + begin;
}
}

class QuadraticEaseInOut extends EasingFunction {
QuadraticEaseInOut(float start1, float stop1, float start2, float stop2) {
super(start1, stop1, start2, stop2);
}
float tween(float begin, float change, float time, float duration) {
return change * time / duration + begin;
}
}
//cubic easing in/out
class CubicEaseInOut extends EasingFunction {
  CubicEaseInOut(float start1, float stop1, float start2, float stop2) {
    super(start1, stop1, start2, stop2);
  }

  float tween(float b, float c, float t, float d) {
    t /= d / 2;
    if (t < 1)
      return c / 2 * t * t * t + b;
    t -= 2;
    return c / 2 * (t * t * t + 2) + b;
  }
}

//quartic easing in
class QuarticEaseIn extends EasingFunction {
  QuarticEaseIn(float start1, float stop1, float start2, float stop2) {
    super(start1, stop1, start2, stop2);
  }

  float tween(float b, float c, float t, float d) {
    t /= d;
    return c * t * t * t * t + b;
  }
}

//sinusoidal easing in
class SinusoidalEaseIn extends EasingFunction {
  SinusoidalEaseIn(float start1, float stop1, float start2, float stop2) {
    super(start1, stop1, start2, stop2);
  }

  float tween(float b, float c, float t, float d) {
    return (float) (-c * Math.cos(t / d * (Math.PI / 2)) + c + b);
  }
}

//sinusoidal easing in/out
class SinusoidalEaseInOut extends EasingFunction {
  SinusoidalEaseInOut(float start1, float stop1, float start2, float stop2) {
    super(start1, stop1, start2, stop2);
  }

  float tween(float b, float c, float t, float d) {
    return (float) (-c / 2 * (Math.cos(Math.PI * t / d) - 1) + b);
  }
}

//exponential easing in
class ExponentialEaseIn extends EasingFunction {
  ExponentialEaseIn(float start1, float stop1, float start2, float stop2) {
    super(start1, stop1, start2, stop2);
  }

  float tween(float b, float c, float t, float d) {
    return (float) (c * Math.pow(2, 10 * (t / d - 1)) + b);
  }
}

//exponential easing out
class ExponentialEaseOut extends EasingFunction {
  ExponentialEaseOut(float start1, float stop1, float start2, float stop2) {
    super(start1, stop1, start2, stop2);
  }

  float tween(float b, float c, float t, float d) {
    return (float) (c * (-Math.pow(2, -10 * t / d) + 1) + b);
  }
}

//circular easing in
class CircularEaseIn extends EasingFunction {
  CircularEaseIn(float start1, float stop1, float start2, float stop2) {
    super(start1, stop1, start2, stop2);
  }

  float tween(float b, float c, float t, float d) {
    t /= d;
    return (float) (-c * (Math.sqrt(1 - t * t) - 1) + b);
  }
}
