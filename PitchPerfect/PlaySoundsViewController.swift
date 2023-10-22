//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Weili Yi on 2023/10/8.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
        
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        snailButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        chipmunkButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        rabbitButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        vaderButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        echoButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        reverbButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        stopButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
}
