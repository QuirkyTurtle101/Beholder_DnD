//Main code 
//first some imports, you love to see it
import java.io.File;

//these are our menu classes - they must be defined in advance because if we don't create them piecemeal there's some fucking hocus pocus going on that breaks them
DisplayClass mainMenu;
DisplayClass sheetSelect;
DisplayClass sheetLoader;

//this is the loaded display class at any given time
DisplayClass isLoaded; 

//this variable tracks whether we're editing a text box. my code is bad and i should feel bad
boolean isEditing = false;
TextBox currentEditing = null;

void setup(){
  size(1200,800);
  sheetSelect = new SheetSelect();
  mainMenu = new MainMenu();
  sheetLoader = new SheetLoader();
  
  mainMenu.initialize();
  sheetSelect.initialize();
  sheetLoader.initialize();
  //wouldn't it be great if there were a better way of doing this? wow, i think so too! if only i could be fucked to find out how
  
  isLoaded = mainMenu;
}

void draw(){
  clear();
  //println("Loaded display is: " + isLoaded.debug); //debug stuff
  println("isEditing = " + isEditing);
  if(currentEditing != null){
    println("currentEditing = " + currentEditing.text);
  }
  isLoaded.display();
}

void keyPressed(){
  if(isEditing == true && currentEditing != null){
    switch(key){
      case BACKSPACE:
        currentEditing.takeInput(currentEditing.text.substring(0, currentEditing.text.length()-1)); //THIS SHOULD WORK. WHY DOES THIS NOT WORK. WHY AM I STILL HERE. WILL I JUST HAVE TO TURN THIS SHIT IN LIKE THIS? FUCK IT I GUESS I WILL
        break; //update i figured out what was wrong ignore the last rant
      case ENTER:
        isEditing = false;
        break;
      default:
        if(keyCode != SHIFT){
          currentEditing.text += key;
        }
        break;
    }
  }
}

void mouseClicked(){
  for(Clickable i : isLoaded.buttons){
    if(i.x < mouseX && mouseX < i.x+i.sizeX && i.y < mouseY && mouseY < i.y+i.sizeY && isEditing == false){
      i.isClicked();
      break;
    }
  }
}

void loadMenu(DisplayClass pointer){
  isLoaded = pointer;
}
