// A Pac-Man 'digital rain' effect

int[] posPacman = new int[20];
int[] index=new int[20];

void setup() {
  size(800, 400);
  // noStroke();
  frameRate(10);
  // textSize(20);
  textAlign(CENTER);
  //initialise array with random values for height
  for (int n = 0; n < posPacman.length; n++) {
    posPacman[n] = round(random(height));
  }
}

void draw() {
  //draw slightly black rectangle to give a fade effect
  fill(color(0, 25));
  rect(0, 0, width, height);
  fill(100, 255, 100); //green fill colour
  for (int n = 0; n < posPacman.length; n++) {
    pushMatrix();
    translate(n*40, posPacman[n]);
    rotate(HALF_PI);

    float mouthAngle = abs(sin(millis()/130.0));           // Sine function for chomping effect
    arc(0, -40, 40, 40, mouthAngle, TWO_PI-mouthAngle); // Draw the Pac-Man arc
    posPacman[n]=(posPacman[n]+10)%(height+40);
    popMatrix();
  }
}
