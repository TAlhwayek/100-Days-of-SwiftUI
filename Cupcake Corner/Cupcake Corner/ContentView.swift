//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Tony Alhwayek on 1/31/24.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Button("Play Haptic", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
    }
    
    func prepareHaptics() {
        // Check if device has haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // Check if device has haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
