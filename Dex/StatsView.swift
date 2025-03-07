    //
    //  StatsView.swift
    //  Dex
    //
    //  Created by Edu Caubilla on 6/3/25.
    //

import SwiftUI
import Charts

struct StatsView: View {
    let pokemon : Pokemon
    
    var body: some View {
        Chart (pokemon.stats) { stat in
            BarMark(
                x: .value("Value", stat.value),
                y: .value("Stat", stat.name)
            )
            .annotation(position: .trailing) {
                Text("\(stat.value)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.top, -2)
            }
        }
        .frame(height: 250)
        .padding()
        .foregroundStyle(pokemon.typeColor)
        .chartXScale(domain: 0...pokemon.highestStat.value + 10)
    }
}

#Preview {
    StatsView(pokemon: PersistenceController.previewPokemon)
}
