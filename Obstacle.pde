// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pathfinding w/ Genetic Algorithms

// A class for an obstacle, just a simple rectangle that is drawn
// and can check if a Rocket touches it

// Also using this class for target location


class Obstacle {

  PVector location;
  float w,h;
  
  Obstacle(float x, float y, float w_, float h_) {
    location = new PVector(x,y);
    w = w_;
    h = h_;
  }

  void display() { 
    int huey =  int( 360 * sin(frameCount) + 180) ; // (sin(frameCount/(360 * location.x * location.y)) + 2)
    stroke(huey, 100, 100,100);
    fill(location.y,100,100,100);
    strokeWeight(4);
    rectMode(CORNER);
    rect(location.x,location.y,w,h);
  }

  boolean contains(PVector spot) {
    if (spot.x > location.x && spot.x < location.x + w && spot.y > location.y && spot.y < location.y + h) {
      return true;
    } else {
      return false;
    }
  }

}
