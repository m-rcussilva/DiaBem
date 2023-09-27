//
//  TimeFormatting.swift
//  DiaBem
//
//  Created by Marcus Silva on 25/09/23.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    switch minutes {
    case ..<120:
        return "\(minutes) minuto\(minutes == 1 ? "" : "s") atrás"
    case 120..<2880:
        return "\(hours) hora\(hours == 1 ? "" : "s") atrás"
    default:
        return "\(days) dia\(days == 1 ? "" : "s") atrás"
    }
}
