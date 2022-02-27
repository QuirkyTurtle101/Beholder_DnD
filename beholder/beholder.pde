//Main code 
//first some imports, you love to see it
import java.io.File;

//these are our menu classes - they must be defined in advance because if we don't create them piecemeal there's some fucking hocus pocus going on that breaks them
DisplayClass mainMenu;
DisplayClass sheetSelect;

//this is the loaded display class at any given time
DisplayClass isLoaded; 


void setup(){
  size(1200,800);
  sheetSelect = new SheetSelect();
  mainMenu = new MainMenu();
  
  mainMenu.initialize();
  sheetSelect.initialize();
  
  isLoaded = mainMenu;
}

void draw(){
  clear();
  println("Loaded display is: " + isLoaded.debug);
  isLoaded.display();
}

void mouseClicked(){
  for(Clickable i : isLoaded.buttons){
    if(i.x < mouseX && mouseX < i.x+i.sizeX && i.y < mouseY && mouseY < i.y+i.sizeY){
      i.isClicked();
    }
  }
}

void loadMenu(DisplayClass pointer){
  isLoaded = pointer;
}
