//
//  utils.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 25/06/2024.
//

import Foundation

func formatNumber(_ number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}
