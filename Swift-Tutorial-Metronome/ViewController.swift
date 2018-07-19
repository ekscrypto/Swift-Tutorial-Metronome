//
//  ViewController.swift
//  Swift-Tutorial-Metronome
//
//  Created by Dave Poirier on 2018-07-18.
//  Copyright © 2018 Soft.Io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bpmLabel: UILabel!
    @IBOutlet weak var tickLabel: UILabel!

    let myMetronome = Metronome()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        myMetronome.onTick = { (nextTick) in
            self.animateTick()
        }
        updateBpm()
    }

    private func animateTick() {
        tickLabel.alpha = 1.0
        UIView.animate(withDuration: 0.35) {
            self.tickLabel.alpha = 0.0
        }
    }

    @IBAction func startMetronome(_: Any?) {
        myMetronome.enabled = true
    }

    @IBAction func stopMetronome(_: Any?) {
        myMetronome.enabled = false
    }

    @IBAction func increaseBpm(_: Any?) {
        myMetronome.bpm += 1.0
        updateBpm()
    }
    @IBAction func decreaseBpm(_: Any?) {
        myMetronome.bpm -= 1.0
        updateBpm()
    }

    private func updateBpm() {
        let metronomeBpm = Int(myMetronome.bpm)
        bpmLabel.text = "\(metronomeBpm)"
    }
}


//let secondsPerBeat = 60.0 / tempoBPM
//let samplesPerBeat = Float(secondsPerBeat * Float(bufferSampleRate))
//let beatSampleTime: AVAudioFramePosition = AVAudioFramePosition(nextBeatSampleTime)
//let playerBeatTime: AVAudioTime = AVAudioTime(sampleTime: AVAudioFramePosition(beatSampleTime), atRate: bufferSampleRate)
//// This time is relative to the player's start time.
//
//player.scheduleBuffer(soundBuffer[bufferNumber]!, at: playerBeatTime, options: AVAudioPlayerNodeBufferOptions(rawValue: 0), completionHandler: {
//    self.syncQueue!.sync() {
//        self.beatsScheduled -= 1
//        self.bufferNumber ^= 1
//        self.scheduleBeats()
//    }
//})
//
//beatsScheduled += 1
//
//if (!playerStarted) {
//    // We defer the starting of the player so that the first beat will play precisely
//    // at player time 0. Having scheduled the first beat, we need the player to be running
//    // in order for nodeTimeForPlayerTime to return a non-nil value.
//
//    player.play()
//    playerStarted = true
//}
//let callbackBeat = beatNumber
//beatNumber += 1
//// calculate the beattime for animating the UI based on the playerbeattime.
//let nodeBeatTime: AVAudioTime = player.nodeTime(forPlayerTime: playerBeatTime)!
//let output: AVAudioIONode = engine.outputNode
//let latencyHostTicks: UInt64 = AVAudioTime.hostTime(forSeconds: output.presentationLatency)
////calcualte the final dispatch time which will update the UI in particualr intervals
//let dispatchTime = DispatchTime(uptimeNanoseconds: nodeBeatTime.hostTime + latencyHostTicks)**
//// Visuals.
//DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: dispatchTime) {
//    if (self.isPlaying) {
//        // send current call back beat.
//        self.delegate!.metronomeTicking!(self, bar: (callbackBeat / 4) + 1, beat: (callbackBeat % 4) + 1)
//
//    }
//}
//}
//// my view controller class where i'm showing the beat number
//class ViewController: UIViewController ,UIGestureRecognizerDelegate,Metronomedelegate{
//
//    @IBOutlet var rhythmlabel: UILabel!
//    //view did load method
//    override func viewDidLoad() {
//
//
//    }
//    //delegate method for getting the beat value from metronome engine and showing in the UI label.
//
//    func metronomeTicking(_ metronome: Metronome, bar: Int, beat: Int) {
//        DispatchQueue.main.async {
//            print("Playing Beat \(beat)")
//            //show beat in label
//            self.rhythmlabel.text = "\(beat)"
//        }
//    }
//}
