//
//  ListLayout.swift
//  Moonshot
//
//  Created by Tony Alhwayek on 1/18/24.
//

import SwiftUI

struct ListLayout: View {
    
    var astronauts: [String: Astronaut]
    var missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundStyle(.gray.opacity(0.6))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    
                }
            }
            .listRowBackground(Color.darkBackground)
        }
//        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return ListLayout(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
