//
//  ViewController.swift
//  MyApp30
//
//  Created by user22 on 2017/10/3.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    @IBAction func recorder(_ sender: Any) {
        let file = NSHomeDirectory() + "/Documents/audio.mp3"
        let url = URL(fileURLWithPath: file)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.setActive(true)
            
        
            
            
        }catch{
            
        }
        
        
    }
    
    
    var recorder:AVAudioRecorder? = nil
    var player:AVAudioPlayer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
}

