//
//  AudioControl.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 10.04.2022.
//

import Foundation
import AVFoundation

class AudioControl {
    private let audioPlayer:  AVAudioPlayerNode
    private let clickFile:    AVAudioFile
    private let audioEngine:  AVAudioEngine
    
    init (clikFile: URL) {
        self.audioPlayer    = AVAudioPlayerNode()
        self.clickFile      = try! AVAudioFile(forReading: clikFile)
        self.audioEngine    = AVAudioEngine()
        
        // Attach the player node to the audio engine
        audioEngine.attach(audioPlayer)
        // Connect the player node to the main mixer node
        audioEngine.connect(audioPlayer, to: audioEngine.mainMixerNode, format: clickFile.processingFormat)
        
        try! audioEngine.start()
    }
    // Compute bar buffer
    private func barBuffer(bpm: Double) -> AVAudioPCMBuffer {
        clickFile.framePosition = 0
        
        //Длина одного beat
        let beatLength = AVAudioFrameCount(clickFile.processingFormat.sampleRate * 60 / bpm)
        
        //Длина одного click
        let clickBuffer = AVAudioPCMBuffer(pcmFormat: clickFile.processingFormat, frameCapacity: beatLength)!
        try! clickFile.read(into: clickBuffer)
        clickBuffer.frameLength = beatLength
        
        // Длина одного такта (bar)
        let barBuffer = AVAudioPCMBuffer(pcmFormat: clickFile.processingFormat, frameCapacity: 4 * beatLength)!
        barBuffer.frameLength = 4 * beatLength
        
        let channelCount = Int(clickFile.processingFormat.channelCount)
        let clickArray = Array(UnsafeBufferPointer(start: clickBuffer.floatChannelData![0], count: channelCount * Int(beatLength)))
        
        var barArray = [Float]()
        
        for _ in 1...4 {
            barArray.append(contentsOf: clickArray)
        }
        
        barBuffer.floatChannelData!.pointee.assign(from: barArray,
                                                   count: channelCount * Int(barBuffer.frameLength))
        return barBuffer
    }
    
    func play(bpm: Double) {
        
        let buffer = barBuffer(bpm: bpm)
        
        if audioPlayer.isPlaying {
            audioPlayer.scheduleBuffer(buffer, at: nil, options: .interruptsAtLoop, completionHandler: nil)
        } else {
            self.audioPlayer.play()
        }
        
        self.audioPlayer.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
    }
    
    func stop() {
        audioPlayer.stop()
    }
    
}
