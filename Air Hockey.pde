int rad = 10; //set radius of ball to 10       
float xpos, ypos; // location of ball, x and y positions
float xspeed = 10.8; // x speed of ball
float yspeed = 10.2; //y speed of ball
int xdirection = 1; //horizontal ball direction
int ydirection = 1; //vertical ball direction
int x = 570; //x value for paddle 1
int y = 200; //y value for paddle 1
int xx = 30; //x value for paddle 2
int yy = 200; //y value for paddle 2
int p1 = 0; // set score for player 1 to 033
int p2 = 0; // set score for player 2 to 0
int stage = 0; //set stage to 0
PImage home; //background image for home screen
PImage picon; //image for play icon
PImage play; //text that says play
PImage help; //text that says help
PImage title; //Air hockey title
PImage back2; //second bacground for when you click help
PImage exp; //explanation or instructions
PImage ttl; //instructions title
PImage keys; // image showing player the keys
PImage player1; // text that says player 1
PImage player2; // text that says player 2
PImage back; //button that redirects you to home screen after instructions

void setup(){
    size(600,400); //set size of canvas
    noStroke(); //add no stroke to text and images
    frameRate(30); // set frame rate
    xpos = width/2; // x starting position of ball
    ypos = height/2; // y starting position of ball
    home = loadImage("home.png"); //background image for home screen
    picon = loadImage("picon.png"); //text that says play
    play = loadImage("play.png"); //text that says play
    help = loadImage("help.png"); //text that says help
    title = loadImage("Title.png"); //Air hockey title
    back2 = loadImage("back2.png"); //second bacground for when you click help
    exp = loadImage("exp.png"); //explanation or instructions
    ttl = loadImage("ttl.png"); //instructions title
    keys = loadImage("keys.png"); // image showing player the keys
    player1 = loadImage("p1.png"); // text that says player 1
    player2 = loadImage("p2.png"); // text that says player 2
    back = loadImage("back.png"); //button that redirects you to home screen after instructions
}

void draw(){ //draw part of the screen
     if (stage == 0){ // if stage is 0
    image(home,0,0); //set home screen ontop
    image(picon,54,-10); // place play icon
    image(play,0,-18); // put play text
    image(help,0,60); // put help text
    image(ttl,-25,-65); //put air hockey title
  }
   if((mousePressed == true) && stage == 0 && (mouseX > 280 && mouseX < 350 && mouseY > 180 && mouseY < 220)){//changes stage to game screen stage
    stage = 1; // makes stage value 1
   }
   
   if((mousePressed == true) && stage == 0 && (mouseX > 280 && mouseX < 315 && mouseY > 278 && mouseY < 318)){//changes stage to help screen stage
    stage = 2;  // makes stage value 2
   }
   
   if((mousePressed == true) && stage == 2 && (mouseX > 500 && mouseX < 580 && mouseY > 10 && mouseY < 50)){//changes stage to home screen stage
    stage = 0;  // makes stage value 0
   }
   
   if(stage == 2){ // if stage is 2
   image(back2,0,0); // put in white background
   image(title,0,0); // add instructions title
   image(exp,0,10); // add explanation
   image(keys,0,-10); // show images of player keys
   image(player1,5,-10); // text player 1 
   image(player2,160,-10); // text player 2
   image(back,290,-330); // back button

 }
   
   if(stage == 1){ // if stage is 1
     background(0); // set background to all black
    fill(255,0,0); // make all lines red
    ellipse(x,y,30,30); // paddle 1
    ellipse(xx,yy,30,30); // paddle 2

    
    strokeWeight(5); // make line a bit thick
    stroke(255); // colour of line white
      line(300,0,300,400); // line divides the screen in half
 
    noFill();
      strokeWeight(15); // make border lines more thick
    stroke(255,0,0); // border is red
      rect(0,0,600,400); // make a rectangle with no fill but has a border
 
      strokeWeight(20); // make white net on sides more thick than actual border
    stroke(255); // make line white
      line(0,150,0,250); // put line between top and bottom of screen
 
      strokeWeight(20); // make white net on sides more thick than actual border
    stroke(255); // make line white
      line(600,150,600,250);// put line between top and bottom of screen

      textSize(20); // make text bigger
      text(p1,150,40); // score board for player 1
      
      textSize(20); //make text bigger
      text(p2,450,40); // score board for player 2
 
            if(dist(x,y,xpos,ypos)<=35){ // if distance between paddle 1 and ball is less than 35
            xdirection *= -1; // send ball back 
            }
            
            if(dist(xx,yy,xpos,ypos)<=35){ // if distance between paddle 2 and ball is less than 35
            xdirection *= -1; // send ball back 
            }
            
            xpos = xpos + ( xspeed * xdirection ); // x speed of ball
            ypos = ypos + ( yspeed * ydirection ); // y speed of ball
 
            if (xpos > width-rad || xpos < rad) { // if ball touches border, bounce back
            xdirection *= -1; // send ball back 
            }
 
            if (ypos > height-rad || ypos < rad) { // if ball touches border
            ydirection *= -1; // send ball back 
            }
            
//--------------------------------------------------------------------------------
            //goes in player 1 nets
            
            if(p2 >= 7){ // if player 2 scores 7 goals
            fill(255); // make text white
            textSize(50); // make text size 50
            text("Player 2 Wins",150,175); // make text say player 2 wins
            noLoop(); // end game
            }
            }
            
            if(xpos < 20 && ypos > 150 && ypos <250){ // if ball hits white part
            p2 = p2 +1; // add 1 point to player 2
            }
            
            if(xpos < 20 && ypos > 150 && ypos <250){ // if ball hits white part
            ypos = 200; // set ball to centre
            xpos = 300; // set ball to centre
            x = 570; // set paddle 1 to original spot
            y = 200; // set paddle 1 to original spot
            xx = 30; // set paddle 2 to original spot
            yy = 200; // set paddle 2 to original spot
            } 
            
//----------------------------------------------------------------------------------
            //goes in player 2 net
            
            if(p1 >= 7){
            fill(255);
            textSize(50);
            text("Player 1 Wins",150,175);
            noLoop();
            }
            
            if(xpos >580  && ypos > 150 && ypos <250){
            p1 = p1 +1;
            }
            
            if(xpos >580  && ypos > 150 && ypos <250){
            ypos = 200; // set ball to centre
            xpos = 300; // set ball to centre
            x = 570; // set paddle 1 to original spot
            y = 200; // set paddle 1 to original spot
            xx = 30; // set paddle 2 to original spot
            yy = 200; // set paddle 2 to original spot
            } 
       
            ellipse(xpos, ypos, rad, rad); // make ball

     if(keyCode==UP){ // if up key pressed
     y =y-10; // paddle 1 starts moving up
     }
     if(keyCode==DOWN){// if down key pressed
     y =y+10; // paddle 1 starts moving down
     }
     if(keyCode==RIGHT){// if right key pressed
     x =x+10; // paddle 1 starts moving right
     }
     if(keyCode==LEFT){ // if left key pressed
     x =x-10; // paddle 1 starts moving left
     }
     if(y <= 30){ // if y is less than 30
     y = 30; // set y value to 30
     }
     if(y >= 370){ // if y is more than 370
     y = 370; // set y to 370
     }
     if(x > 570){ // if x is more than 570
     x= 570; // set x to 570
     }
     if(x < 324){ // if x is less than 324
     x = 324; //set x to 324
     }
     
     
     if(key=='w'||key=='W'){ // if w key pressed
     yy =yy-10; // paddle 2 moves up
     }
     if(key=='s'||key=='S'){ // if s key pressed
     yy =yy+10; // paddle 2 moves down
     }
     if(key=='d'||key=='D'){ // if d key pressed
     xx =xx+10; // paddle 2 moves right
     }
     if(key=='a'||key=='A'){ // if a key pressed
     xx =xx-10; // paddle 2 moves left
     }
      if(yy <= 30){ // if yy is less than 30
     yy = 30; // set yy value to 30
     }
     if(yy >= 370){ // if yy is more than 370
     yy = 370; // set yy value to 370
     }
     if(xx > 276){ // if xx is more than 276
     xx= 276; // set xx to 276
     }
     if(xx < 30){ // if xx is less than 30
     xx = 30; // set xx to 30
     }

}

 