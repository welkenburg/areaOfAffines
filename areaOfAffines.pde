
//every y values must be multiplied by -1

//Function[] affine = { new Function(2,-60), new Function(3,150), new Function(-1,-100),  new Function(1,60),new Function(-1,100) };
Function[] affine = { new Function(4,-60), new Function(0,20), new Function(-0.6,124),  new Function(-2.5,295) };
Point center = new Point(50,50);

ArrayList<Point> shapeNodes = new ArrayList<Point>();

void setup(){
  size(600,600);
  translate(width/2,height/2);
  for(int i = 0; i < affine.length; i++){
    renderFunction(affine[i]);
    for(int j = i; j < affine.length; j++){
       Point intersectionPoint = affine[i].intersection(affine[j]);
       if (intersectionPoint != null){
         shapeNodes.add(intersectionPoint);
       }
    }
  }
  
  fill(255);
  circle(center.x,-center.y,10);
  for(int i = 0; i < affine.length; i++){
    for(int j = 0; j < shapeNodes.size(); j++){
      if(!affine[i].border(center, shapeNodes.get(j))) shapeNodes.remove(j);
    }
  }
  
  float area = 0;
  for(int i = 0; i < shapeNodes.size(); i++){
    noStroke();
    fill(255 - 255 * i / shapeNodes.size(),255 * i / shapeNodes.size(),0);
    circle(shapeNodes.get(i).x, -shapeNodes.get(i).y, 10);
    
    println(shapeNodes.get(i).x, shapeNodes.get(i).y);
    
    int ni = (i + 1) % shapeNodes.size();
    area += shapeNodes.get(i).x * shapeNodes.get(ni).y - shapeNodes.get(i).y * shapeNodes.get(ni).x;
    
  }
  print(abs(area));
  
}

void draw(){
}

void renderFunction(Function f){
  float x1 = -width/2;
  float y1 = f.solve(x1);
  
  float x2 = width/2;
  float y2 = f.solve(x2);
  
  stroke(0);
  line(x1,-y1,x2,-y2);
}
