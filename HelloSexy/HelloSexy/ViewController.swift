//
//  ViewController.swift
//  HelloSexy
//
//  Created by Pranav Karnani on 30/03/19.
//  Copyright © 2019 Pranav Karnani. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        speak(text: "Hello R M I T")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    @IBAction func bttnTapped(_ sender: Any) {
        let text = field.text ?? ""
        if text == "" {
            let alert = UIAlertController(title: "Error", message: "Text field cannot be left empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "Done", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        else {
            speak(text: field.text!)
        }
        
    }
    func speak(text : String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

