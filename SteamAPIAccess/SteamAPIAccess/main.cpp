//
//  main.cpp
//  SteamAPIAccess
//
//  Created by Marko Rankovic on 10/4/19.
//  Copyright © 2019 Marko Rankovic. All rights reserved.
//

#include <iostream>
#include <steam_api.h>

int main(int argc, const char * argv[]) {
    bool isSteamRunning = SteamAPI_IsSteamRunning();
    std::cout << (isSteamRunning ? "Steam is running in the background." : "No Steam instance running.") << "\n";
    return 0;
}
