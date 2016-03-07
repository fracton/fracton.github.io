int degree=1;
float wide=2;
float wi= 0.00005;
int degrees=1000;
void setup() {
  size(1024,420);
}
void draw() {
  clear();
  background(0,5,55);
  for (int x=10; x<(width);x=x+20 ) {
    translate(20,0);
    for (int y=10; y<(height);y=y+20 ) {
      translate(0,20);
      
      fill(random(140),y,x,128);
      stroke(0,0,x,128);
      strokeWeight(2);
      float fwidth = width;
      float fheight = height;
      float ted =20+( 10*sin(wide)); 
      rotate( (degree*PI)/degrees );
      ellipse(0,0,20, floor(ted));
      float fx = x;
      float fy = y; 
      println(x,fwidth,fx/fwidth);
      //ellipse(0,0,10,wide);
      wide = wide+wi;
      if (wide > 300 || wide < 2) wi *= -1;
      rotate( (-degree*PI)/degrees );
      degree++;
      degree %= degrees;
      //println(x,y,wi,wide,ted, 233 ) ;
    } 
    translate(0,-height);
  }
}
