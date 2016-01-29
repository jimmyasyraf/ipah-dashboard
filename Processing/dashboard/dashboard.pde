int temperaturehigh = 0;
int temperaturelow = 0;

String weather = "";
String location = "";
String ampm = "";

//zipcode for nepean
String zip = "4441";

void setup() {
  size(displayWidth, displayHeight);

  //retrieve xml data from yahoo weather
  String url = "http://xml.weather.yahoo.com/forecastrss?w=" + zip + "&u=c";

  XML xml = loadXML(url);

  XML forecast = xml.getChild("channel/item/yweather:forecast");
  XML details = xml.getChild("channel/yweather:location");


  location = details.getString("city");
  temperaturehigh = forecast.getInt("high");
  temperaturelow = forecast.getInt("low");
  weather = forecast.getString("text");
  
}

void draw() {
  background(0);
  fill(100, 255, 255);
  PFont font;
  font = loadFont("Avenir-Light-70.vlw");
  textFont(font);
  int s = second();  
  int m = minute();  
  int h = hour();   
  textSize(50);
  line(s, 0, s, 33);
  line(m, 33, m, 66);
  line(h, 66, h, 100);
  if (h<12) {
    ampm = "am";
  }
  if (h>12) {
    ampm = "pm";
    h=h-12;
  }

  text("Hello!", 130, 100);
  textSize(30);
  text("The time now is", 130, 200);
  textSize(110);
  text(h + ":" + nf(m, 2) + ":" + nf(s, 2), 130, 330);
  textSize(30);
  text(ampm, 470, 380);
  text("Location: " + location, 130, 450);
  text("Today’s high: " + temperaturehigh, 130, 500);
  text("Today’s low: " + temperaturelow, 130, 550);
  text("Forecast: " + weather, 130, 600);
  textSize(40);
  
  //reminder section
  //will be replaced with google spreadsheet APIs
  
  text("Reminder", 720, 200);
  textSize(30);
  text("Computation homework", 720, 250);
  text("Computation lab report", 720, 300);
  text("Chem lab report", 720, 350);
}