class Ball
{
  PVector pos;

  Ball()
  {
    pos = new   PVector(random(0, displayHeight), radom(0, displayWidth));
  }

  void display()
  {
    fill(random(255), random(255), random(255));
  }
} // end Ball

class okBall extends Ball
{
  void display()
  {
    super.display();
    ellipse(pos.x, pos.y, 70, 70);
  } //  end display
} // end okBall

