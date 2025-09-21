#include <iostream>
#include <string>
#include <chrono>
#include <thread>
#include <cstdlib>

using namespace std; // Adăugat pentru endl

int main() {
    std::cout << "Starting SWWW monitor..." << std::endl;
    
    while (true) {
        std::this_thread::sleep_for(std::chrono::seconds(60)); // seconds nu second
        std::cout << "Verificare swww-daemon" << std::endl; // endl nu "endl"
        
        // Verifică dacă swww-daemon rulează
        int result = std::system("pgrep swww-daemon > /dev/null 2>&1");
        
        if (result != 0) {
            std::cout << "swww-daemon nu rulează, îl repornim..." << std::endl;
            
            // Pornește daemon-ul (fără & în system())
            std::system("swww-daemon &");
            
            // Așteaptă să pornească
            std::this_thread::sleep_for(std::chrono::seconds(3)); // mai mult timp
            
            // Setează wallpaper-ul
            int wallpaper_result = std::system("swww img ~/Pictures/output1.gif");
            
            if (wallpaper_result == 0) {
                std::cout << "Wallpaper setat cu succes!" << std::endl;
            } else {
                std::cout << "Eroare la setarea wallpaper-ului!" << std::endl;
            }
        } else {
            std::cout << "swww-daemon rulează normal." << std::endl;
        }
    }
    
    return 0;
}
