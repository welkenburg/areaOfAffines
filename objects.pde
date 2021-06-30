class Point{
  float x;
  float y;
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void render(){
    circle(this.x,this.y,5);
  }
}

class Function{
  float x;
  float y;

  Function(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  Point intersection(Function g){
    float diviser = this.x - g.x;
    if (diviser == 0) return null;
    float solvedX = (g.y - this.y) / diviser;
    return new Point(solvedX,solve(solvedX));
  }
  
  float solve(float x){
    return this.x * x + this.y;
  }
  
  boolean border(Point a, Point b){
    if (b.y - solve(b.x) == 0) return  true;
    
    int aSign = (int) Math.signum(a.y - solve(a.x));
    int bSign = (int) Math.signum(b.y - solve(b.x));
    if (aSign == bSign) return  true;
    
    return false;
  } 
}
