import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

Planet sun;

int x = int(random(1,6)); //Cantidad de planetas
int y = 1; //Nivel, mantener en 1 para spawnear lunas IDK WHY I AM SO DONE AT THIS TIME ITS FUCKING 3 AM

void setup() {
  fullScreen(P3D);
  colorMode(HSB);
  //size(600, 600, P3D);  //DEBUG MODE AGUAS COMPI
  cam = new PeasyCam(this, 1000);
  sun = new Planet(50, 0, 0);
  sun.spawnMoons(x, y);
}

void draw() {
  background(0);
  lights();
  pointLight(255,255,255,0,0,0);
  sun.show();
  sun.orbit();
}

void keyTyped(){
  sun.spawnMoonsPirata(x,y);
  x++;
}