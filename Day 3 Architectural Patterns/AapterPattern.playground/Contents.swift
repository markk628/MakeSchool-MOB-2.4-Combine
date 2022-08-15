import UIKit

enum MediaFileType {
    case mp4
    case aac
}

// Target protocol 1
protocol Player {
    associatedtype Media
    func play(mediaType: Media, fileName: String)
}

// Target protocol 2

//TODO: Implement a Pause protocol with a pause() function that accepts 1 parameter: A String called "fileName"
protocol PausePlayer {
    func pause(fileName: String)
}


// Adaptee 1
class AudioPlayer {
    func playAudio(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adaptee 2
class VideoPlayer {
    func playVideo(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adapter (class)
class MyPlayer: Player {
    
    //TODO: create required player variables
    
    let audioPlayer = AudioPlayer()
    let videoPlayer = VideoPlayer()
    
    func play(mediaType: MediaFileType, fileName: String) {
        if (mediaType == .aac){
            videoPlayer.playVideo(fileName: fileName);
        }else if(mediaType == .mp4){
            audioPlayer.playAudio(fileName: fileName);
        }
    }
}

// Adapter (class extension)

//TODO: Implement a class extension which adds Pause functionality to MyPlayer
extension MyPlayer: PausePlayer {
    func pause(fileName: String) {
        print("\(fileName) is now paused")
    }
}


// Usage
let myPlayer = MyPlayer()
myPlayer.play(mediaType: .aac, fileName: "Titanium.aac")
myPlayer.play(mediaType: .mp4, fileName: "Cat_riding_a_roomba.mp4")
myPlayer.pause(fileName: "Cat_riding_a_roomba.mp4")


/* This should print:
 Now Playing:  Titanium.aac
 Now Playing:  Cat_riding_a_roomba.mp4
 Cat_riding_a_roomba.mp4  is now paused...
 */
