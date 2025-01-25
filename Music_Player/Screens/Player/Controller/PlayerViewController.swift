//
//  PlayerViewController.swift
//  Music_Player
//
//  Created by Jayesh on 24/01/25.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    
    var isButtonClicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setUpUI()
        self.observePlaybackTime()
    }

    @IBAction func playButton(_ sender: Any) {
        isButtonClicked.toggle()
        if isButtonClicked {
            playButton.setImage(UIImage(named: "pause-button"), for: .normal)
            playMusic()
        } else {
            playButton.setImage(UIImage(named: "Group 48098990"), for: .normal)
            stopMusic()
        }
    }
    @IBAction func backButton(_ sender: Any) {
        AudioManager.shared.removeObserver()
        self.dismiss(animated: true)
    }
    @IBAction func slidingValue(_ sender: UISlider) {
        seekToTime(Float(sender.value))
    }
}

extension PlayerViewController {
    private func setUpUI() {
        slider.minimumValue = 0
        slider.maximumValue = 1
    }
    
    private func playMusic() {
        let musicURL = "https://v3.cdn.level.game/raag-pilu-mix-full-vers.mp3"
        AudioManager.shared.playMusic(from: musicURL)
    }
    
    private func stopMusic() {
        AudioManager.shared.stopMusic()
    }
    
    private func observePlaybackTime() {
        AudioManager.shared.observePlaybackTime { [weak self] currentTime, totalTime in
            guard let self = self else { return }
            
            let progress = Float(currentTime / totalTime)
            self.slider.value = progress

            self.slider.maximumValue = Float(totalTime)
        }
    }
    
    private func seekToTime(_ newValue: Float) {
          let newTime = Double(newValue)
          AudioManager.shared.seekToTime(newTime)
      }
}
