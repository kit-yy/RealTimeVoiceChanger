//
//  ViewController.swift
//  Swift_VoiceChange
//
//  Created by Yasuaki K on 2017/02/21.
//  Copyright © 2017年 Yasuaki Kitaoka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate{
    @IBOutlet weak var sv: UIScrollView!
    
    var uv = UIView()
    fileprivate var audioEngine = AVAudioEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uv.frame = CGRect(x: 0, y: 0, width: 800, height: 80)
        
        for i in 0..<3{
            let button:UIButton = UIButton()
            
            button.frame = CGRect(x: (i*80) + 10, y: 0, width: 80, height: 80)
            
            let image:UIImage = UIImage(named: String(i+1) + ".png")!
            
            button.setImage(image, for: UIControlState.normal)
            
                button.addTarget(self, action: #selector(changeVoice), for: .touchUpInside)
            uv.addSubview(button)
            uv.backgroundColor = UIColor.clear
            
        }
        
        sv.addSubview(uv)
        sv.contentSize = uv.bounds.size
        
        createVoice1()
    }
    
    func changeVoice(sender:UIButton){
        
        if(sender.tag == 0){
            audioEngine.stop()
            audioEngine.reset()
            createVoice1()
        }
        if(sender.tag == 1){
            audioEngine.stop()
            audioEngine.reset()
            createVoice2()
        }
        if(sender.tag == 2){
            audioEngine.stop()
            audioEngine.reset()
            createVoice3()
        }
    }
    
    func createVoice1(){
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setActive(true)
        } catch let error as NSError {
            print("error")
        }
        
        let input = audioEngine.inputNode
        let mixer = audioEngine.mainMixerNode
        
        let reverb = AVAudioUnitReverb()
        
        reverb.loadFactoryPreset(.largeHall2)
        reverb.wetDryMix = 50
        
        
        audioEngine.attach(reverb)
        
        let distortion = AVAudioUnitDistortion()
        
        distortion.loadFactoryPreset(.speechWaves)
        
            distortion.preGain = -6
        
            audioEngine.attach(distortion)
        
        let eq = AVAudioUnitEQ()
        eq.globalGain = 90
        audioEngine.attach(eq)
        
        
        audioEngine.connect(input!, to: reverb, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(reverb, to: eq, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(eq, to: mixer, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(input!, to: distortion, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(distortion, to: mixer, format: input!.inputFormat(forBus: 0))
        
        
        try! audioEngine.start()
        
    }
    func createVoice2(){
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setActive(true)
        } catch let error as NSError {
            print("error")
        }
        
        let input = audioEngine.inputNode
        let mixer = audioEngine.mainMixerNode
        
        let reverb = AVAudioUnitReverb()
        
        reverb.loadFactoryPreset(.largeRoom)
        reverb.wetDryMix = 50
        
        audioEngine.attach(reverb)
        
        let distortion = AVAudioUnitDistortion()
        
        distortion.loadFactoryPreset(.multiDecimated1)
        
        distortion.preGain = -6
        
        audioEngine.attach(distortion)
        
        let eq = AVAudioUnitEQ()
        eq.globalGain = 90
        audioEngine.attach(eq)
        
        
        audioEngine.connect(input!, to: reverb, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(reverb, to: eq, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(eq, to: mixer, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(input!, to: distortion, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(distortion, to: mixer, format: input!.inputFormat(forBus: 0))
        
        
        try! audioEngine.start()
        
    }
    func createVoice3(){
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setActive(true)
        } catch let error as NSError {
            print("error")
        }
        
        let input = audioEngine.inputNode
        let mixer = audioEngine.mainMixerNode
        
        let reverb = AVAudioUnitReverb()
        
        reverb.loadFactoryPreset(.cathedral)
        reverb.wetDryMix = 50
        
        audioEngine.attach(reverb)
        
        let distortion = AVAudioUnitDistortion()
        
        distortion.loadFactoryPreset(.multiEcho1)
        
        distortion.preGain = -6
        
        audioEngine.attach(distortion)
        
        let eq = AVAudioUnitEQ()
        eq.globalGain = 90
        audioEngine.attach(eq)
        
        
        audioEngine.connect(input!, to: reverb, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(reverb, to: eq, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(eq, to: mixer, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(input!, to: distortion, format: input!.inputFormat(forBus: 0))
        audioEngine.connect(distortion, to: mixer, format: input!.inputFormat(forBus: 0))
        
        
        try! audioEngine.start()
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

