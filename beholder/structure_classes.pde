//In this tab, we keep all the structural classes for loading and displaying various content. Everything in this tab inherits from DisplayClass

class DisplayClass{
  String debug;
  ArrayList<Clickable> buttons;
  
  DisplayClass(){
    buttons = new ArrayList<Clickable>();
  }
  
  void display(){
    for(Clickable i : buttons){
      i.display();
    }
  }
}


class MainMenu extends DisplayClass{
  
  MainMenu(){
    super();
    buttons.add(new MainMenuButton(300, 250, 200, 100, sheetSelect, "Sheet"));
    debug = "MainMenu";
  }
    
  void display(){
    super.display();
  }
}


class SheetSelect extends DisplayClass{
  
  SheetSelect(){
    super();
    buttons.add(new MainMenuButton(20, 20, 50, 50, mainMenu, "Back"));
    debug = "SheetSelect";
  }
  
  void display(){
    super.display();
  }
}
