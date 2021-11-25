//In this tab, we keep all the structural classes for loading and displaying various content. Everything in this tab inherits from DisplayClass

class DisplayClass{
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
    buttons.add(new Clickable(20, 20, 100, 100));
  }
    
  void display(){
    super.display();
  }
}


class SheetLoader extends DisplayClass{
  
  
  void display(){
    super.display();
  }
}
