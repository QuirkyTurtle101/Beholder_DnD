//This is for classes that define clickables, such as buttons, text boxes, etc. Everything here inherits from the Clickable class

class Clickable{
  int x;
  int y;
  int sizeX;
  int sizeY;
  
  Clickable(int _x, int _y, int _sizeX, int _sizeY){
    x = _x;
    y = _y;
    sizeX = _sizeX;
    sizeY = _sizeY;
  }
  
  void display(){
    rect(x, y, sizeX, sizeY);
  }
  
  void isClicked(){
    println("Huzzah!");
  }
}
