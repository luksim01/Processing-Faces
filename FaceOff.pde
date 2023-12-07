int middleX, middleY;

void setup(){
  size(1000,1000);
  middleX=width/2;
  middleY=height/2;
}

void draw(){
  int distFromMiddleX = abs(middleX-mouseX);
  // black, background experimenting
  if(mouseX < middleX & mouseY < middleY){
    background(0);
    stroke(255);
    strokeWeight(3);
    fill(#BBFF81);
    pushStyle();
    pushMatrix();
    for(int i=0;i<30;i+=1){
      for(int j=0;j<30;j+=1){
        fill(255,distFromMiddleX+150,255);
        //noStroke();
        strokeWeight(distFromMiddleX/random(2,8));
        stroke(i*2,j*8,i+j*4);
        rotate(radians(45+i));
        ellipse(j*40,i*40+random(distFromMiddleX/100),random(10),random(distFromMiddleX+random(50)));
        ellipse(j*60,i*60+random(2),random(5),random(5));
      }
    }
    popMatrix();
    popStyle();
  }
  // red, background experimenting
  else if(mouseX >= middleX & mouseY < middleY){
    background(#FF6C6C);
    strokeWeight(6);
    fill(#FFA0B8);
    pushStyle();
    for(int i=0;i<30;i+=1){
      for(int j=0;j<30;j+=1){
        fill(mouseX,50,50);
        noStroke();
        ellipse(i*40,j*40+random(distFromMiddleX/4),random(-10,20),random(mouseY+j*5));
      }
    }
    popStyle();
  }
  // blue, background experimenting
  else if(mouseX < middleX & mouseY >= middleY){
    background(#6CBCFF);
    strokeWeight(4);
    fill(#D7C9FF);
    pushStyle();
    pushMatrix();
    for(int i=0;i<width+200;i+=100){
      for(int j=0;j<height+200;j+=100){
        fill(255,random(255),distFromMiddleX+100);
        rect(i+distFromMiddleX,j*2-distFromMiddleX,20,20,20);
        fill(random(100,200),random(255),distFromMiddleX+100);
        rect(j-distFromMiddleX,i,20,20,20);
        fill(255,distFromMiddleX+150,255);
        noStroke();
        if(i%200 == 0 & j%200 == 0){
          rectMode(CENTER);
          rect(i,j,80,40,random(14,20));
        }
      }
    }
    popMatrix();
    popStyle();
  }
  // green, background experimenting
  else if(mouseX >= middleX & mouseY >= middleY){
    background(#6CFF8D);
    strokeWeight(5);
    fill(#FFBC74);
    pushStyle();
    pushMatrix();
    for(int i=0;i<width*1.2;i+=100){
      for(int j=0;j<width*random(1,4);j+=100){
        fill(#DFFF62);
        strokeWeight(0);
        arc(distFromMiddleX,random(190,200),2*j,j,0,PI/8,CHORD);
        fill(random(200,255),random(200,255),random(200,255));
        arc(0,0,1500+random(200),1500+random(100),0,PI/6,CHORD);
        rotate(radians(random(160,180)));
      }
    }
    popMatrix();
    popStyle();
  }
  
  // head
  ellipse(middleX,middleY,240,240);
   
  // mouth
  pushStyle();
  if(mouseY>=middleY){
    noFill();
  }
  else if(mouseY<middleY){
    fill(#292929);
  }
  beginShape();
  int p1x = -40-(mouseX-middleX)/2;
  int p2x = -30-(mouseX-middleX)/2;
  int p3x = 30-(mouseX-middleX)/2;
  int p4x = 40-(mouseX-middleX)/2;
  
  int p1y = 0;
  int p2y = 0;
  int p3y = 0;
  int p4y = 0;
  float offset = 70+(middleY-mouseY)/1.5;
  
  if(mouseY < middleY){
    p1y = 5*(middleY-mouseY);
    p2y = 0;
    p3y = 0;
    p4y = 5*(middleY-mouseY);
  }
  else if(mouseY > middleY){
    p1y = 4*(middleY-mouseY);
    p2y = 0;
    p3y = 0;
    p4y = 4*(middleY-mouseY);
  }
  
  // left end
  curveVertex(mouseX+p1x, mouseY+p1y+offset);
  // left curve
  curveVertex(mouseX+p2x, mouseY+p2y+offset);
  // right curve
  curveVertex(mouseX+p3x, mouseY+p3y+offset);
  // right end
  curveVertex(mouseX+p4x, mouseY+p4y+offset);
  endShape();
  popStyle();
  
  // middle
  if(mouseX == middleX){
    // left eye
    pushStyle();
    fill(#C12F2F);
    ellipse(mouseX-50,mouseY-50,30,30);
    popStyle();
    // nose
    pushStyle();
    fill(#FF5852);
    ellipse(mouseX,mouseY,100,100);
    popStyle();
    // right eye
    pushStyle();
    fill(#A52828);
    ellipse(mouseX+50,mouseY-50,30,30);
    popStyle();
  }
  // move left
  else if(mouseX < middleX){
    // left eye
    pushStyle();
    fill(#8ACBC8);
    ellipse((mouseX-50)+(distFromMiddleX)/2,mouseY-50,(30-(distFromMiddleX)/5),(30-(distFromMiddleX)/5));
    popStyle();
    // nose
    pushStyle();
    fill(#AB75F7);
    ellipse(mouseX,mouseY,100,100);
    popStyle();
    // right eye
    pushStyle();
    fill(#A3E0DD);
    ellipse(mouseX+50,mouseY-50,(30+(distFromMiddleX)/15),(30+(distFromMiddleX)/15));
    popStyle();
  }
  // move right
  else if(mouseX > middleX){
    // right eye
    pushStyle();
    fill(#A52828);
    ellipse((mouseX+50)-(distFromMiddleX)/2,mouseY-50,(30-(distFromMiddleX)/5),(30-(distFromMiddleX)/5));
    popStyle();
    // nose
    pushStyle();
    fill(#FF5852);
    ellipse(mouseX,mouseY,100,100);
    popStyle();
    // left eye
    pushStyle();
    fill(#C12F2F);
    ellipse(mouseX-50,mouseY-50,(30+(distFromMiddleX)/15),(30+(distFromMiddleX)/15));
    popStyle();
  }
  
  //eyebrows
  int initEyebrowDistFromXAxis = 30;
  int initEyebrowDistFromYAxis = -80;
  int initEyebrowWidth = 40;
  int initEyebrowHeight = 15;
  
  // right brow
  // wrt mouse position
  int rightBrowPosX = initEyebrowDistFromXAxis;
  int rightBrowPosY = initEyebrowDistFromYAxis;
  int rightBrowWidth = initEyebrowWidth;
  int rightBrowHeight = initEyebrowHeight;
  float rightBrowOriginXLeft = rightBrowPosX-(distFromMiddleX)*1.2;
  float rightBrowOriginXRight = rightBrowPosX+(distFromMiddleX)*1.8;
  float rightBrowOriginY = rightBrowPosY;
  
  // left brow
  // wrt mouse position
  int leftBrowPosX = -initEyebrowDistFromXAxis;
  int leftBrowPosY = initEyebrowDistFromYAxis;
  int leftBrowWidth = -initEyebrowWidth;
  int leftBrowHeight = initEyebrowHeight;
  float leftBrowOriginXLeft = leftBrowPosX+(distFromMiddleX)*1.8;
  float leftBrowOriginXRight = leftBrowPosX-(distFromMiddleX)*1.2;
  float leftBrowOriginY = leftBrowPosY;
  
  int distMouseXFromYAxis = middleY-mouseX;
  float browWidthChange = (distMouseXFromYAxis/8);
  float browHeightChange = (distMouseXFromYAxis/12);
  
  
  // LEFT SIDE OF SCREEN
  if(mouseX<=middleX){
    pushMatrix();
    pushStyle();
    fill(#4F4DFF);
    translate(mouseX, mouseY);
    rotate(radians(distMouseXFromYAxis)/2);
    rect(rightBrowOriginXLeft+distMouseXFromYAxis/2, rightBrowOriginY-distMouseXFromYAxis/2, rightBrowWidth+browWidthChange, rightBrowHeight+browHeightChange, 20);
    //pushStyle();
    //fill(#E84444);
    //noStroke();
    //ellipse(rightBrowOriginXLeft+distMouseXFromYAxis/2, rightBrowOriginY-distMouseXFromYAxis/2, 5, 5);
    //popStyle();
    popMatrix();
    
    
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(-radians(distMouseXFromYAxis));
    rect(leftBrowOriginXLeft-distMouseXFromYAxis/10, leftBrowOriginY+distMouseXFromYAxis/20, leftBrowWidth+browWidthChange, leftBrowHeight-browHeightChange, 20);
    //pushStyle();
    //fill(#E84444);
    //noStroke();
    //ellipse(leftBrowOriginXLeft-distMouseXFromYAxis/10, leftBrowOriginY+distMouseXFromYAxis/20, 5, 5);
    //popStyle();
    popStyle();
    popMatrix();
  }
  
  // RIGHT SIDE OF SCREEN
  else if(mouseX>middleX){
    pushMatrix();
    pushStyle();
    fill(#761F0D);
    translate(mouseX, mouseY);
    rotate(radians(distMouseXFromYAxis));
    rect(rightBrowOriginXRight+distMouseXFromYAxis*1.5, rightBrowOriginY-distMouseXFromYAxis, rightBrowWidth+browWidthChange, rightBrowHeight+browHeightChange, 20);
    //pushStyle();
    //fill(#E84444);
    //noStroke();
    //ellipse(rightBrowOriginXRight+distMouseXFromYAxis*1.5, rightBrowOriginY-distMouseXFromYAxis, 5, 5);
    //popStyle();
    popMatrix();
    
    
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(-radians(distMouseXFromYAxis));
    rect(leftBrowOriginXRight-distMouseXFromYAxis/1.5, leftBrowOriginY-distMouseXFromYAxis, leftBrowWidth+browWidthChange, leftBrowHeight-browHeightChange, 20);
    //pushStyle();
    //fill(#E84444);
    //noStroke();
    //ellipse(leftBrowOriginXRight-distMouseXFromYAxis/1.5, leftBrowOriginY-distMouseXFromYAxis, 5, 5);
    //popStyle();
    popStyle();
    popMatrix();
  }
}
void keyPressed(){
  if(key == 's'){
    saveFrame("output/######.jpg");
    //when you press "s" key, 
    //processing will make an 
    //image output
  }
}
