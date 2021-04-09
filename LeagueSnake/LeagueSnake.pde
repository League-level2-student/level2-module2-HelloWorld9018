//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int snakeX;
int snakeY;

// Add a constructor with parameters to initialize each variable.

Segment(int snakeX, int snakeY){
  this.snakeX = snakeX;
  this.snakeY = snakeY;
}

}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

ArrayList <Segment> parts = new ArrayList <Segment>();

//DIMENSIONS
  int gridUnit = 20;


//FOOD
  int foodX;
  int foodY;

  int foodEaten = 0;

//SNAKE


  int snakeDirection = RIGHT;
  Segment head;
  int defaultX = gridUnit*6;
  int defaultY = gridUnit*3;

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
 
  size(800, 600);
  
  head = new Segment(defaultX, defaultY);
  
  frameRate(10);
  dropFood();
  parts.add(head);
  

}

void dropFood() {
  //Set the food in a new random location
  
  //make sure head doesn't spawn on the food
  
  boolean intersection = true;
  
  while(intersection){
  foodX = (int) random(1, 40) * 20;
  foodY = (int) random(1, 30) * 20;
  
  if(head.snakeX != foodX && head.snakeY != foodY){intersection = false;}
  
  }
  
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  
   background(173, 250, 145);
   
     textSize(20);
   text("Score: " + foodEaten, 10, 30);
   
   eat();
   move();
   drawFood();
   drawSnake();
    //eat();
   
    
    manageTail();
    
}

void drawFood() {
  //Draw the food
  
  fill(225, 0, 0);
  rect(foodX, foodY, gridUnit, gridUnit);
 
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(0, 0, 225);
  rect(head.snakeX, head.snakeY, gridUnit, gridUnit);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  
  for(int i = 0; i < parts.size(); i++){
    int x = parts.get(i).snakeX;
    int y = parts.get(i).snakeY;
    rect(x, y, gridUnit, gridUnit);
    //println();
    
    //manageTail();
    
  }
  
  
  
  
 // for (int i = 1; i <8; i++){
   //int partSize = headSize /i;
 // rect(snakeX-gridUnit*i, snakeY, gridUnit, gridUnit);
 // }
 // ellipse(snakeX-ellipseSpace, snakeY, headSize, headSize);
  
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
    checkTailCollision();
   drawTail();

  parts.add(new Segment(head.snakeX, head.snakeY));
  
  if(parts.size() > foodEaten){
    
    parts.remove(0);
    
  }
  
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
   for(int i = 1; i < parts.size(); i++){
  if(head.snakeX == parts.get(i).snakeX && head.snakeY == parts.get(i).snakeY){
    println("KA-BOOM!");
    
    foodEaten = 1;
    parts.clear();
    parts.add(head);
    
    
  }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
//  if (keyPressed){
    
      if (keyCode == UP && snakeDirection != DOWN){
      snakeDirection = UP;
      }
      else if (keyCode == DOWN && snakeDirection != UP){
      snakeDirection = DOWN;
      }  
      else if (keyCode == LEFT && snakeDirection != RIGHT){
      snakeDirection = LEFT;
      }
      else if (keyCode == RIGHT && snakeDirection != LEFT){
      snakeDirection = RIGHT;
      }
    
 // }
  //move();
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(snakeDirection) {
   case UP:
    // move head up here 
      
      head.snakeY = head.snakeY - gridUnit;
      
      
    break;
    
  case DOWN:
    // move head down here 
    
    head.snakeY = head.snakeY + gridUnit;
    break;
    
  case LEFT:
   // figure it out 
   head.snakeX = head.snakeX - gridUnit;
    break;
    
  case RIGHT:
    // mystery code goes here 
    head.snakeX = head.snakeX + gridUnit;
    break;
  }
  
  checkBoundaries();
  
  //parts.add(new Segment(head.snakeX, head.snakeY));
  //manageTail();
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
  
   if(head.snakeX > 780){
    head.snakeX = 0;
  }
  
  if(head.snakeX < 0){
    head.snakeX = 780;
  }
  
  if(head.snakeY > 580){
    head.snakeY = 0;
  }
  
  if (head.snakeY < 0){
    head.snakeY = 580;
  }
  
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  
  if(head.snakeX == foodX && head.snakeY == foodY){
    foodEaten++;
    dropFood();
    //grow tail?
    
  // drawTail();
    println(foodEaten);
    
  }

}
