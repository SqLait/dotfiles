#include <iostream>
#include <fstream>
#include <cstdlib>

int main() {
    // Path to the sound file
    const std::string soundFile = "/home/deanr/.local/bin/SoundFiles/startup.mov";

    // Check if the sound file exists
    std::ifstream file(soundFile);
    if (!file) {
        std::cerr << "Sound file not found: " << soundFile << std::endl;
        return 1;
    }
    // Close the file (not strictly necessary here, as the destructor will handle it)
    file.close();

    // Command to play the sound file with cvlc
    std::string command = "cvlc --play-and-exit --no-video ";
    command += soundFile;

    // Execute the command
    int result = system(command.c_str());
    if (result != 0) {
        std::cerr << "Failed to play sound file. Error code: " << result << std::endl;
        return result;
    }

    // Exit the program
    return 0;
}

