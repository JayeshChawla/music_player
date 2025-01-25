//
//  PlayerViewController.swift
//  Music_Player
//
//  Created by Jayesh on 24/01/25.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var hearButton: UIButton!
    @IBOutlet weak var endTimeLbl: UILabel!
    @IBOutlet weak var startimeLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    
    var isHeartPressed: Bool = false
    
    var isButtonClicked = false
    var playbackTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.observePlaybackTime()
    }

    @IBAction func playButton(_ sender: Any) {
        isButtonClicked.toggle()
        if isButtonClicked {
            playButton.setImage(UIImage(named: "pause-button"), for: .normal)
            playMusic()
            startTimer()
        } else {
            playButton.setImage(UIImage(named: "Group 48098990"), for: .normal)
            stopMusic()
            stopTimer()
        }
    }
    @IBAction func backButton(_ sender: Any) {
        AudioManager.shared.resetPlayer()
        AudioManager.shared.removeObserver()
        self.dismiss(animated: true)
    }
    
    @IBAction func heartButton(_ sender: Any) {
        isHeartPressed.toggle()
        if isHeartPressed {
            hearButton.setImage(UIImage(named: "favoriteSelected"), for: .normal)
        } else {
            hearButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
    }
    @IBAction func slidingValue(_ sender: UISlider) {
        let selectedTime = sender.value
        seekToTime(selectedTime)
        updateStartTimeLabel(Double(selectedTime))
    }
}

extension PlayerViewController {
    private func setUpUI() {
        startimeLbl.text = "0:00"
        endTimeLbl.text = "46:08"
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
            
            self.updateStartTimeLabel(currentTime)
            self.endTimeLbl.text = self.formatTime(totalTime)
        }
    }
    
    private func seekToTime(_ newValue: Float) {
        let newTime = Double(newValue)
        AudioManager.shared.seekToTime(newTime)
    }
    
    private func updateStartTimeLabel(_ currentTime: Double) {
        startimeLbl.text = formatTime(currentTime)
    }
    
    private func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

//MARK: Timer Managment 
extension PlayerViewController {
    private func startTimer() {
        playbackTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let currentTime = AudioManager.shared.currentPlaybackTime
            self.updateStartTimeLabel(currentTime)
        }
    }
    
    private func stopTimer() {
        playbackTimer?.invalidate()
        playbackTimer = nil
    }
}
