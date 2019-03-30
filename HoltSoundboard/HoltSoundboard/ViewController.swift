//
//  ViewController.swift
//  HoltSoundboard
//
//  Created by Pranav Karnani on 30/03/19.
//  Copyright © 2019 Pranav Karnani. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var holt: UIImageView!
    @IBOutlet weak var soundboard: UITableView!
    var audioPlayer: AVAudioPlayer?
    var sounds = [NSString]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getSongs()
        soundboard.dataSource = self
        soundboard.delegate = self
    }
    
    func getSongs() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        do {
            let items:[NSString] = try fm.contentsOfDirectory(atPath: path) as [NSString]
            for item in items {
                if (item.pathExtension == "m4a"){
                    sounds.append(item.deletingPathExtension as NSString)
                }
                
            }
        } catch {
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        holt.layer.cornerRadius = holt.frame.height/2
        holt.clipsToBounds = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SoundTableViewCell
        cell.soundNumber.text = "\(indexPath.row + 1)"
        cell.soundName.text = sounds[indexPath.row] as String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            if let fileURL = Bundle.main.path(forResource: "\(sounds[indexPath.row])", ofType: "m4a") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                audioPlayer?.play()
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

