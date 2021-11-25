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
    fill(255, 255, 255);
    rect(x, y, sizeX, sizeY);
  }
  
  void isClicked(){
    println("Huzzah!");
  }
}


class MainMenuButton extends Clickable{
  DisplayClass pointer; //this variable is what determines where the button will go when clicked
  String text;
  
  MainMenuButton(int _x, int _y, int _sizeX, int _sizeY, DisplayClass _pointer, String _text){
    super(_x, _y, _sizeX, _sizeY);
    pointer = _pointer;
    text = _text;
  }
  
  void display(){
    super.display();
    textAlign(CENTER);
    fill(0, 0, 0);
    text(text, x+sizeX/2, y+sizeY/2);
  }
  
  void isClicked(){
    loadMenu(pointer);
  }
}
