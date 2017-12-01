class Planet {
  float radius;
  float distance;
  Planet[] planets;
  Planet[] planets2;
  float angle;
  float orbitspeed;
  PVector v;
  int counter = 1;
  float counterVN = 0.005;
  float counterVP = 0.005;
  int hue = 1;
  int addHue = 1;

  PShape globe;

  Planet(float r, float d, float o) {

    v = PVector.random3D();

    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
  }

  void orbit() {
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }

  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = random(radius/2, radius/3);
      float d = random((radius + r)*2, (radius+r)*4);
      float o = random(-0.05, 0.01);
      planets[i] = new Planet(r, d, o);
      if (level < 2) {
        int num = int(random(0, 3));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }

  void show() {
    pushMatrix();
    //noStroke();
    stroke(hue,100,100);
    hue = hue + addHue;
    if(hue==360){
      addHue = addHue*-1;
    }
    if(hue==0){
      addHue = addHue*-1;
    }
    

    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    //stroke(255);
    translate(v.x, v.y, v.z);
    noFill();
    sphereDetail(10);
    sphere(radius);


    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }

  // AQUI YA SE PONE LO BUENO \o/
  void spawnMoonsPirata(int a, int b) {
    planets2 =new Planet[(a+1)];
    for (int i = 0; i < planets.length; i++) {
      planets2[i]=planets[i];
    }
    float r = random(radius/(2+counterVP), radius/(3+counterVP));
    float d = random((radius + r)*(2+counter), (radius+r)*(4+counter));
    float o = random(-0.05+counterVN, 0.01-counterVP);
    counter ++;
    counterVN = counterVN + 0.001;
    counterVP = counterVP - 0.001;
    planets2[(planets2.length)-1] = new Planet(r, d, o);
    if (b < 2) {
      int num = int(random(0, 3));
      planets2[(planets2.length)-1].spawnMoons(num, b+1);
    }
    planets = new Planet[planets2.length];
    for (int i=0; i<planets.length; i++) {
      planets[i]=planets2[i];
    }
  }
}