#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
#include <fstream>
#include <memory>
#include <algorithm>
#include <cctype>
#include <locale>

using namespace std;

void log_message(const string &message) {
    ofstream log_file("spotify_log.txt", ios_base::app);
    log_file << message << endl;
}

string exec(const char* cmd){
   unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd, "r"), pclose);
   if (!pipe) {
       throw runtime_error("popen() failed!");
   }
   char buffer[128];
   string result;
   while(fgets(buffer,sizeof(buffer),pipe.get()) != nullptr){
       result += buffer;
   }
   return result;
}

string truncateString(const string& text, int maxLength, int cutAt) {
    if (text.length() > maxLength) {
        return text.substr(0, cutAt) + "...";
    } else {
        return text;
    }
}
std::string trim(const std::string& str) {
    size_t first = str.find_first_not_of(" \t\n\r");
    if (first == std::string::npos) return "";
    size_t last = str.find_last_not_of(" \t\n\r");
    return str.substr(first, last - first + 1);
}

std::string escape_json(const std::string &s) {
    std::string out;
    for (char c : s) {
        switch (c) {
            case '\"': out += "\\\""; break;
            case '\\': out += "\\\\"; break;
            case '\b': out += "\\b";  break;
            case '\f': out += "\\f";  break;
            case '\n': out += "\\n";  break;
            case '\r': out += "\\r";  break;
            case '\t': out += "\\t";  break;
            default:
                if (c >= 0 && c <= 0x1F) {
                    char buf[7];
                    snprintf(buf, sizeof(buf), "\\u%04x", c);
                    out += buf;
                } else {
                    out += c;
                }
        }
    }
    return out;
}


int main(){

  
  string status = trim(exec("playerctl status 2>/dev/null"));
  if(status.empty() || status == "Stopped"){
  cout << "{\"text\": \"No media\", \"class\": \"stopped\", \"tooltip\": \"No media player running\"}" << endl;
  return 0;
}

 string title = trim(exec("playerctl metadata title 2>/dev/null"));
string artist = trim(exec("playerctl metadata artist 2>/dev/null"));
string album = trim(exec("playerctl metadata album 2>/dev/null"));


   if(title.empty()) title = "Unknown Title";
   if(artist.empty()) artist = "Unknown Artist";
   if(album.empty()) album = "Unknown Album";

  string display_artist = truncateString(artist, 20, 17);
  string display_title = truncateString(title, 25, 22); 

 string icon;
 string class_name;
 string display_text;

     if (status == "Playing") {
        icon = "▶";
        class_name = "playing";
        display_text = display_title + " - " + display_artist;
    }
    else if (status == "Paused") {
        icon = "⏸";
        class_name = "paused";
        display_text = display_title + " - " + display_artist;
    }
    else {
        icon = "■";
        class_name = "stopped";
        display_text = "No music playing";
    }

    string tooltip = "Title" + title + "\\n" + "Artist" + artist + "\\n" + "Album" + album + "\\n" + "Status :" + status;

    string display_text_json = escape_json(display_text);
    string tooltip_json = escape_json(tooltip);

   cout << "{"
          << "\"text\":\"" << display_text_json << "\","
          << "\"class\":\"" << class_name << "\","
          << "\"tooltip\":\"" << tooltip_json << "\""
          << "}" << endl;



}
