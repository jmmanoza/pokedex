//
//  SoundManager.swift
//  Pokedex
//
//  Created by jmmanoza on 3/21/24.
//

import Foundation
import AVFoundation

class SoundManager {
    var audioPlayer: AVAudioPlayer?

    func playSound(soundName: String, type: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not find and play the sound file.")
            }
        }
    }
}
