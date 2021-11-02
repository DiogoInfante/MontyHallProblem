//
//  AudioPlayer.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 02/11/21.
//

import AVFoundation

class AudioPlayer {
    /// Audio player
    var player = AVAudioPlayer()
    /// PlaySound
    /// - Parameters:
    ///     - sound media: Given media to be played - It can be easily accessed by the track list
    ///     - numberOfLoops: Number of times it will repeat: 0 as default. Also, -1 means infiniti loop
    func play(_ media: Media, numberOfLoops: Int = -1) {
        if let bundle = Bundle.main.path(forResource: media.title, ofType: media.type) {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                player = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                player.numberOfLoops = numberOfLoops
                player.prepareToPlay()
                player.play()
            } catch {
                print(error)
            }
        }
    }
    func toggleMusic() {
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
}
/// Track List
struct Tracklist {
    /// Available Sounds
    static let soundtrack = Media(title: "soundtrack", type: "mp3")
}
