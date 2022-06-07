//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Mark: - Outlets
    @IBOutlet weak var TitleBarLbl: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    //MARK: - Variabes and propertiest
    //MARK: - Variabes and propertiest
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
//Mark: - Action
    @IBAction func softSeletedBtn(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!

        ProgressView.progress = 0.0
        secondsPassed = 0
        TitleBarLbl.text = hardness
//Mark: - timer code
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    //MARK: - update timer
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            ProgressView.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate()
            TitleBarLbl.text = "DONE!"
//MARK: - Alarm code
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
}
}


