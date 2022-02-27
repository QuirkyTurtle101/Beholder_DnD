//This is for classes that define clickables, such as buttons, text boxes, etc. Everything here inherits from the Clickable class

class Clickable{
  int x;
  int y;
  int sizeX;
  int sizeY;
  String text;
  String target = "";
    
  Clickable(int _x, int _y, int _sizeX, int _sizeY){
    x = _x;
    y = _y;
    sizeX = _sizeX;
    sizeY = _sizeY;
  }
  
  void initialize(DisplayClass input){
    
  }
  
  void display(){
    fill(255, 255, 255);
    rect(x, y, sizeX, sizeY);
  }
  
  void isClicked(){
    println("Huzzah!");
  }
}

//buttons and shit
class MenuButton extends Clickable{
  DisplayClass pointer; //this variable is what determines where the button will go when clicked
  
  MenuButton(int _x, int _y, int _sizeX, int _sizeY, String _text, String _target){
    super(_x, _y, _sizeX, _sizeY);
    text = _text;
    target = _target;
  }
  
  void initialize(DisplayClass input){
    pointer = input;
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

class SheetButton extends MenuButton{
  JSONObject json;
  String[] strings;
  
  SheetButton(int _x, int _y, int _sizeX, int _sizeY, String _text, String _target, JSONObject _json){
    super(_x, _y, _sizeX, _sizeY, _text, _target);
    json = _json;
  }
  
  void isClicked(){
    pointer.character = json;
    pointer.loadSheet();
    loadMenu(pointer);
  }
}

class SaveButton extends MenuButton{
  
  SaveButton(int _x, int _y, int _sizeX, int _sizeY, String _text, String _target){
    super(_x, _y, _sizeX, _sizeY, _text, _target);
  }
  
  void isClicked(){
    pointer.saveCharacter();
    sheetSelect.json = loadJsonObjects();
  }
}

//text boxes for the sheets
class TextBox extends Clickable{
  
  TextBox(int _x, int _y, int _sizeX, int _sizeY, String _text){
   super(_x, _y, _sizeX, _sizeY); 
   text = _text;
  }
  
  void display(){
    super.display();
    textAlign(CENTER);
    fill(0, 0, 0);
    text(text, x+sizeX/2, y+sizeY/2);
  }
  
  void isClicked(){
    isEditing = true;
    currentEditing = this;
  }
  
  void takeInput(String input){
    text = input;
  }
}
