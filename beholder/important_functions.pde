//we keep important functions here so they don't clutter up the other tabs

void loadJsonObjects(){
  File dir = new File("json");
  ArrayList<JSONObject> temp = new ArrayList<JSONObject>();
  
  File[] files = dir.listFiles();
  
  for(File i : files){
    String path = i.getAbsolutePath();
    
    if(path.toLowerCase().endsWith(".json")){
      temp.add(loadJSONObject(path));
    }
  }
}
