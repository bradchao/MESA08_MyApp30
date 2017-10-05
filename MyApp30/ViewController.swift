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

    var recorder:AVAudioRecorder? = nil
    var player:AVAudioPlayer? = nil
    

    @IBAction func recorder(_ sender: Any) {
        let file = NSHomeDirectory() + "/Documents/audio.ima4"
        let url = URL(fileURLWithPath: file)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.setActive(true)
            
            // 組態 [String:NSNumber]
            let config = [
                AVFormatIDKey : NSNumber(value: kAudioFormatAppleIMA4),
                AVEncoderAudioQualityKey : NSNumber(value: AVAudioQuality.high.rawValue),
                AVEncoderBitRateKey : NSNumber(value: 16),
                AVNumberOfChannelsKey : NSNumber(value: 2),
                AVSampleRateKey : NSNumber(value: 44100)
            ]
            
            do {
                try recorder = AVAudioRecorder(url: url, settings: config)
                recorder?.delegate = self
                
                if (recorder?.record(forDuration: 10))! {
                    recorder?.record()
                    print(NSHomeDirectory())
                    print("開始錄音")
                }else{
                    print("error 1")
                }
                
//                if (recorder?.record())! {
//                    print("開始錄音")
//                }else{
//                    print("錄音error")
//                }
                
//                if let _ = recorder {
//                    if recorder?.isRecording {
//                        recorder?.stop()
//                    }
//                }
                
            } catch {
                print("error 2 : \(error)")
            }
        }catch{
            print("session error: \(error)")
        }
        
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("錄音結束:\(flag)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
}

