//
//  Model.swift
//  SpaceXApp
//
//  Created by Pınar Macit on 5.10.2022.
//

import Foundation

struct SpaceX: Codable {
    let results:[SpaceXElement]
}

// MARK: - SpaceXElement
struct SpaceXElement: Codable {
    let links: Links?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool?
    let window: Int?
    let rocket: String?
    let success: Bool?
    let details: String?
    let payloads: [String]?
    let launchpad: String?
    let flightNumber: Int?
    let name, dateUTC: String?
    let dateUnix: Int?
    let datePrecision: String?
    let upcoming: Bool?
    let cores: [Core]?
    let autoUpdate, tbd: Bool?
    let id: String?

}

// MARK: - Core
struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt: Bool?

}

// MARK: - Links
struct Links: Codable {
    let patch: Patch?
    let webcast: String?
    let youtubeID: String?
    let article: String?
    let wikipedia: String?

}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String?
}

