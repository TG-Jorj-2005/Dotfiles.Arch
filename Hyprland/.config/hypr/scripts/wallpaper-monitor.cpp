#include <iostream>
#include <string>
#include <chrono>
#include <thread>
#include <cstdlib>
#include <fstream>

using namespace std; // Adăugat pentru endl

void log_message(const string& message) {
    ofstream logfile("/tmp/swww_monitor.log", ios::app);
    auto now = chrono::system_clock::now();
    time_t tt = chrono::system_clock::to_time_t(now);
    logfile << ctime(&tt) << ": " << message << endl;
    logfile.close();
    cout << message << endl;
}

int main() {
    log_message("Starting SWWW monitor...");
    
    while (true) {
        std::this_thread::sleep_for(std::chrono::seconds(60)); // seconds nu second
        log_message("Verificare swww-daemon");
        
        // Verifică dacă swww-daemon rulează
        int result = std::system("pgrep swww-daemon > /dev/null 2>&1");
        
        if (result != 0) {
            log_message("swww-daemon nu rulează, îl repornim...");
            
            // Pornește daemon-ul (fără & în system())
            std::system("swww-daemon &");
            
            // Așteaptă să pornească
            std::this_thread::sleep_for(std::chrono::seconds(3)); // mai mult timp
            
            // Setează wallpaper-ul
            int wallpaper_result = std::system("swww img ~/Pictures/output1.gif");
            
            if (wallpaper_result == 0) {
                log_message("Wallpaper setat cu succes!");
            } else {
                log_message("Eroare la setarea wallpaper-ului!");
            }
        } else {
            log_message("swww-daemon rulează normal.");
        }
    }
    
    return 0;    return 0;
}
