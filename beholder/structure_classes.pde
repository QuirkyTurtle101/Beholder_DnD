//In this tab, we keep all the structural classes for loading and displaying various content. Everything in this tab inherits from DisplayClass

class DisplayClass{
  String debug;
  ArrayList<Clickable> buttons;
  ArrayList<JSONObject> json;
  
  DisplayClass(){
    buttons = new ArrayList<Clickable>();
  }
  
  void initialize(){
    for(Clickable i : buttons){
      switch(i.text){
        case "Sheet":
          i.initialize(sheetSelect);
          break;
        case "Main":
          i.initialize(mainMenu);
          break;
        default:
          break;
      }
    }
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
    buttons.add(new MenuButton(500, 350, 200, 100, "Sheet"));
    debug = "MainMenu";
  }
    
  void display(){
    super.display();
  }
}


class SheetSelect extends DisplayClass{
  
  SheetSelect(){
    super();
    buttons.add(new MenuButton(20, 20, 50, 50, "Main"));
    debug = "SheetSelect";
  }
  
  void display(){
    super.display();
  }
}

class SheetLoader extends DisplayClass{
  
  SheetLoader(){
    super();
    loadJsonObjects();
  }
  
  void display(){
    super.display();
  }
}
