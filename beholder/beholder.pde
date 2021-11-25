//Main code 

DisplayClass isLoaded;


void setup(){
  size(800,600);
  isLoaded = new MainMenu();
  
}

void draw(){
  isLoaded.display();
}

void mouseClicked(){
  for(Clickable i : isLoaded.buttons){
    if(i.x < mouseX && mouseX < i.x+i.sizeX && i.y < mouseY && mouseY < i.y+i.sizeY){
      i.isClicked();
    }
  }
}
