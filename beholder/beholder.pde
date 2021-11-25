//Main code 

//these are our menu classes - they must be defined in advance
DisplayClass mainMenu;
DisplayClass sheetSelect;

//this is the loaded display class at any given time
DisplayClass isLoaded; 


void setup(){
  size(800,600);
  mainMenu = new MainMenu();
  sheetSelect = new SheetSelect();
  
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
