// modified by some schlub... see the original 
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Smart Rockets w/ Genetic Algorithms

// Each Rocket's DNA is an array of PVectors
// Each PVector acts as a force for each frame of animation
// Imagine an booster on the end of the rocket that can point in any direction
// and fire at any strength every frame

// The Rocket's fitness is a function of how close it gets to the target as well as how fast it gets there

// This example is inspired by Jer Thorp's Smart Rockets
// http://www.blprnt.com/smartrockets/  

int lifetime;  // How long should each generation live

Population population;  // Population

int lifecycle;          // Timer for cycle of generation
int recordtime;         // Fastest time to target

Obstacle target;        // Target location

//int diam = 24;          // Size of target

ArrayList<Obstacle> obstacles;  //an array list to keep track of all the obstacles!

void setup() {
  size(1280, 720);
  colorMode(HSB, 360, 100, 100, 100);
  // The number of cycles we will allow a generation to live
  lifetime = 333;

  // Initialize variables
  lifecycle = 0;
  recordtime = lifetime;
  
  target = new Obstacle(width/2-12, 24, 24, 24);

  // Create a population with a mutation rate, and population max
  float mutationRate = 0.0016;
  population = new Population(mutationRate, 64);

  // Create the obstacle course  
  obstacles = new ArrayList<Obstacle>();
  for (let i = 0; i < 7; i++) {
    obstacles.add(new Obstacle(int(random(350))+(width/2-175), 50 + int(random(height-200)), 50, 10));
  }
  for (let i = 0; i < 30; i++) {
    obstacles.add(new Obstacle(int(random(width-100)), 50 + int(random(height-200)), 100, 10));
  }
}

void draw() {
  background(13,0,5);

  // Draw the start and target locations
  target.display();


  // If the generation hasn't ended yet
  if (lifecycle < lifetime) {
    population.live(obstacles);
    if ((population.targetReached()) && (lifecycle < recordtime)) {
      recordtime = lifecycle;
    }
    lifecycle++;
    // Otherwise a new generation
  } 
  else {
    lifecycle = 0;
    population.fitness();
    population.selection();
    population.reproduction();
    lifetime = lifetime + population.getGenerations();  
    recordtime = lifetime;
  }

  // Draw the obstacles
  for (Obstacle obs : obstacles) {
    obs.display(framecount);
  }

  // Display some info
  fill(47 + (sin(frameCount/360)*10), 100, 100);
  text("Gen: " + population.getGenerations(), 10, 18);
  text("remaining: " + (lifetime-lifecycle), 10, 36);
  text("of: " + recordtime, 10, 54);
  
  
}

// Move the target if the mouse is pressed
// System will adapt to new target
void mousePressed() {
  target.location.x = mouseX;
  target.location.y = mouseY;
  recordtime = lifetime;
}
