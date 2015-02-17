// Player A
int posxA = 10; // x
int posyA = 125; // y

// Player B
int posxB = 390; // x
int posyB = 125; // y

// Ball
float ballX = 200; // x
float ballY = 125; // y

// Ball directions
float dirX = -1.5; // x
float dirY = 0; // y

// Player points
int pntsA = 0; 
int pntsB = 0;

boolean start = true; // Starting the game

void setup()
{
  size(400, 250);

  // Centre placing
  rectMode(CENTER);
  ellipseMode(CENTER);

  smooth();

  strokeWeight(2);

  frameRate(120);
} // end setup

void draw()
{
  if (start == true)
  { 
    // Splash screen
    background(0);
    text("Pong!", 130, 70);
    fill(255);
    stroke(0, 0, 255);
    rect(200, 150, 100, 75);
    noStroke();
    noFill();
    fill(255, 0, 0);
    text("Click start\nto play!", 170, 150);
    textSize(15);
    noLoop();
  } // end start

  if (start == false)
  {
    background(200, 20, 10);
    stroke(255, 255, 0);
    textSize(48);
    fill(255);

    // Displaying Player points
    text(pntsA, 165, 35);
    text(pntsB, 203, 35);

    line(200, 0, 200, 250); // Middle Line

    fill(random(255), random(255), random(255));
    ellipse(ballX, ballY, 10, 10);

    ballX = ballX + dirX;
    ballY = ballY + dirY;

    // Ball touching Player A
    if (ballX == 20 && ballY >= posyA-25 && ballY <= posyA+25)
    {
      if (ballY < posyA)
      {
        dirX = +2;
        dirY = -2.5;
      }

      if (ballY > posyA)
      {
        dirX = +2;
        dirY = +2.5;
      }

      if (ballY == posyA) 
      {
        dirX = +2;
        dirY = 0;
      }
    } // end ballX

    // Ball touching Player B
    if (ballX == 380 && ballY >= posyB-25 && ballY <= posyB+25) 
    {
      if (ballY < posyB) 
      {
        dirX = -2;
        dirY = -2.5;
      }

      if (ballY > posyB) 
      {
        dirX = -2;
        dirY = +2.5;
      }

      if (ballY == posyB) 
      {
        dirX = -2;
        dirY = 0;
      }
    } // end ballX

    // Left Boundary
    if (ballX < 0) 
    {
      ballX = 200;
      ballY = 125;
      dirY = 0;
      dirX = -1.5;
      pntsB = pntsB+1;
    }

    // Right boundary
    if (ballX > 400) 
    {
      ballX = 200;
      ballY = 125;
      dirY = 0;
      dirX = +1.5;
      pntsA = pntsA+1;
    }

    // Bottom boundary
    if (ballY > 250) 
    {   
      dirY = -2;
    }

    // Top boundary
    if (ballY < 0) 
    {
      dirY = +2;
    }

    stroke(255);
    fill(70, 130, 180);
    rect(posxA, posyA, 10, 50);
    rect(posxB, posyB, 10, 50);

    fill(255);

    if (pntsA >= 10) // Points for Player A
    {
      text("Player A wins!", 50, 100);
      textSize(20);
      text("CLICK TO RESTART", 110, 150);
      ballX = 200;
      ballY = 150;
      noLoop();
    }

    if (pntsB >= 10) // Points for Player B
    {
      text("Player B wins!", 50, 100);
      textSize(20);
      text("CLICK TO RESTART", 110, 150);
      ballX = 200;
      ballY = 150;
      noLoop();
    }
  } // end start
} // end draw

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      posyB = max(25, posyB - 2);
    } // end if
    
    else if (keyCode == DOWN)
    {
      posyB = min(225, posyB + 2);
    } // end else if
  } // end CODED key
  
  else if (key == 'W' || key == 'w')
  {
    posyA = max(25, posyA - 2);
  } // end else if
  
  else if (key == 'S' || key == 's')
  {
    posyA = min(225, posyA + 2);
  } // end else if
} // end keyPressed

void mousePressed()
{
  if (pntsA >= 10 || pntsB >= 10)
  {
    loop();
    pntsA = 0;
    pntsB = 0;

    posyA = 125;
    posyB = 125;

    ballY = 135;
    dirX = -1.5;
  }

  if (start == true) 
  {
    if ((mouseX <= 250 && mouseX >= 150) &&(mouseY <= 187.5 && mouseY >= 112.5)) // Clicking on the box
    {
      loop();
      start = false;
    } // end if
  } // end start
} // end mousePressed
