//
//  playMusic.swift
//  Music_Player
//
//  Created by Jayesh on 24/01/25.
//

import Foundation
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    private var player: AVPlayer?
    private var timeObserverToken: Any?
    
    private init() {}
    
    func playMusic(from urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        player = AVPlayer(url: url)
        player?.play()
        print("Playing music from \(urlString)")
    }
    
    func stopMusic() {
        player?.pause()
        print("Music stopped")
    }
    
    func observePlaybackTime(completion: @escaping (Double, Double) -> Void) {
            guard let player = player else { return }

            if let token = timeObserverToken {
                player.removeTimeObserver(token)
                timeObserverToken = nil
            }

            timeObserverToken = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 600), queue: .main) { [weak self] time in
                guard let self = self else { return }

                let currentTime = CMTimeGetSeconds(time)
                if let duration = player.currentItem?.duration {
                    let totalTime = CMTimeGetSeconds(duration)
                    if !totalTime.isNaN && totalTime > 0 {
                        completion(currentTime, totalTime)
                    }
                }
            }
        }
    
    func removeObserver() {
        guard let player = player, let token = timeObserverToken else { return }
        player.removeTimeObserver(token)
        timeObserverToken = nil
    }
    
    func seekToTime(_ newTime: Double) {
        guard let player = player, let duration = player.currentItem?.duration else { return }
        
        let totalTime = CMTimeGetSeconds(duration)
        let seekTime = CMTime(seconds: newTime, preferredTimescale: 600)
        
        if newTime <= totalTime {
            player.seek(to: seekTime)
            print("Seeked to time: \(newTime)")
        }
    }
    
    var currentPlaybackTime: Double {
        guard let player = player else { return 0 }
        return CMTimeGetSeconds(player.currentTime())
    }
}
