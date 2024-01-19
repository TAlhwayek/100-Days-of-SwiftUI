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
                            .frame(width: 75, height: 75)
                            .padding(.leading, 25)
                    }
                    
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundStyle(.gray.opacity(0.6))
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                
//                DividerView()
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundStyle(.lightBackground)
                
            }
            .listRowBackground(Color.darkBackground)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return ListLayout(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
