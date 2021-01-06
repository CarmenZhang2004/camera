//keyboard
boolean wkey, skey, akey, dkey;

//camerta variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

void setup(){
  size(800, 800, P3D);
  eyex = width/2;
  eyey = height/2;
  eyez = height/2;
  
  focusx = eyex;
  focusy = eyey;
  focusz = eyez - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
}

void draw(){
  background(0);
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  drawAxis();
  drawFloor(-2000, 2000, height, 100);
  drawFloor(-2000, 2000, 0, 100);
}

void move(){ 
  if (akey) eyex = eyex - 10;
  if (dkey) eyex = eyex + 10;
  if (wkey) eyez = eyez - 10;
  if (skey) eyez = eyez + 10;
  
  focusx = eyex;
  focusy = eyey;
  focusz = eyez - 100;
}

void drawAxis(){
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0,0,0, 1000,0,0); //x axis
  line(0,0,0, 0,1000,0); //y axis
  line(0,0,0, 0,0,1000); //z axis
}

void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing){
  stroke(255);
  strokeWeight(1);
  int x = floorStart;
  int z = floorStart;
  while(x < floorEnd){
    line(x,floorHeight,floorStart, x,floorHeight,floorEnd);
    line(floorStart,floorHeight,z, floorEnd,floorHeight,z);
    x = x + floorSpacing;
    z = z + floorSpacing;
  }
}
