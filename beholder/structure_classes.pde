//In this tab, we keep all the structural classes for loading and displaying various content. Everything in this tab inherits from DisplayClass

class DisplayClass{
  String debug;
  ArrayList<Clickable> buttons;
  ArrayList<JSONObject> json;
  JSONObject character;
  
  DisplayClass(){
    buttons = new ArrayList<Clickable>();
  }
  
  void initialize(){
    for(Clickable i : buttons){
      switch(i.target){
        case "Sheet":
          i.initialize(sheetSelect);
          break;
        case "Main":
          i.initialize(mainMenu);
          break;
        case "Loader":
          i.initialize(sheetLoader);
          break;
        default:
          break;
      }
    }
  }
  
  void loadSheet(){
    //lol. lmao.
  }
  
  void display(){
    for(Clickable i : buttons){
      i.display();
    }
  }
  
  void saveCharacter(){
    int count = 0;
    JSONObject output = new JSONObject();
    String[] fields = {"name", "player name", "level", "class", "background", "alignment"};
    for(Clickable i : buttons){
      if(i instanceof TextBox){
        output.setString(fields[count], i.text);
        count++;
      }
    }
    saveJSONObject(output, "C:/Users/QuirkyTurtle/Desktop/processing-3.5.4/json/" + output.getString("name") + ".json"); //THIS IS AN ABSOLUTE PATH. COMPLETE IDIOCY. BUT IT WON'T FUCKING WORK OTHERWISE
  }
}


class MainMenu extends DisplayClass{
  
  MainMenu(){
    super();
    buttons.add(new MenuButton(500, 350, 200, 100, "Sheets", "Sheet"));
    debug = "MainMenu";
  }
    
  void display(){
    super.display();
  }
}


class SheetSelect extends DisplayClass{
  
  SheetSelect(){
    super();
    buttons.add(new MenuButton(20, 20, 50, 50, "Back", "Main"));
    json = loadJsonObjects(); //finally, the fun shit
    int count = 0;
    for(JSONObject i : json){ //if this crashes one more time i will eat a dick (it didn't)
      buttons.add(new SheetButton(500, 150*(count+1), 200, 100, i.getString("name"), "Loader", i));
      count++;
    }
    debug = "SheetSelect";
  }
  
  void display(){
    super.display();
  }
}

class SheetLoader extends DisplayClass{
  
  SheetLoader(){
    super();
    buttons.add(new MenuButton(20, 20, 50, 50, "Back", "Sheet"));
    buttons.add(new SaveButton(80, 20, 50, 50, "Save", "Loader"));
  }
  
  void loadSheet(){
    //are you ready for the cringe? it's time for "why is this not a for loop goddamnit"
    buttons.add(new TextBox(500, 100, 200, 50, character.getString("name")));
    buttons.add(new TextBox(500, 200, 200, 50, character.getString("player name")));
    buttons.add(new TextBox(500, 300, 200, 50, character.getString("level")));
    buttons.add(new TextBox(500, 400, 200, 50, character.getString("class")));
    buttons.add(new TextBox(500, 500, 200, 50, character.getString("background")));
    buttons.add(new TextBox(500, 600, 200, 50, character.getString("alignment")));
  }
}
