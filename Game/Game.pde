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

PFont font;
PFont font2;

void setup()
{
  size(600, 600);

  // Centre placing
  rectMode(CENTER);
  ellipseMode(CENTER);

  smooth();

  strokeWeight(2);

  frameRate(120);

  font = loadFont("Tahoma-Bold-100.vlw");
  font2 = loadFont("BuxtonSketch-20.vlw");
} // end setup

void draw()
{
  if (start == true)
  { 
    // Splash screen
    background(0);

    int i = 11;

    for (int x = 0; x < width; x+=i)
    {
      for (int y = 0; y < height; y+=i)
      {
        strokeWeight(6);
        stroke(30, 144, 255);
        line(x, y, x + 10, y + 10);
        noStroke();
        stroke(124,252,0);
        line(x, y+10, x+10, y);
        //stroke(120);
        //line(x-10, y-10, x, y);
      } //  end for
    } // end for

    // PONG
    textFont(font, 100);
    fill(255, 20, 147);
    text("PONG!", 130, 170);

    // RECT
    fill(255, 69, 0);
    stroke(255);
    rect(300, 370, 200, 40);
    noStroke();
    noFill();

    // PLAY
    fill(124, 252, 0);
    textFont(font2, 20);
    text("P L A Y!", 270, 375);
    //textSize(15);
    noLoop();
  }

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
    } // end UP

    else if (keyCode == DOWN)
    {
      posyB = min(225, posyB + 2);
    } // end DOWN
  } // end CODED key

  else if (key == 'W' || key == 'w')
  {
    posyA = max(25, posyA - 2);
  } // end W/w

  else if (key == 'S' || key == 's')
  {
    posyA = min(225, posyA + 2);
  } // end S/s
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
    if ((mouseX <= 300 && mouseX >= 100) &&(mouseY <= 370 && mouseY >= 330)) // Clicking on the box
    {
      loop();
      start = false;
    } // end if
  } // end start
} // end mousePressed

