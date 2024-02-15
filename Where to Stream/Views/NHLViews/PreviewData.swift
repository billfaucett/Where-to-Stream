//
//  PreviewData.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

import Foundation

struct PreviewData {
    static let points1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 120)
    static let points2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/ANA_light.svg", position: "RW", value: 92)
    static let points3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg", position: "RW", value: 80)
    static let points4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg", position: "RW", value: 80)
    static let points5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 80)
    
    static let points = [points1, points2, points3, points4, points5]
    
    static let assists1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 70)
    static let assists2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/ANA_light.svg", position: "RW", value: 50)
    static let assists3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg", position: "RW", value: 40)
    static let assists4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg", position: "RW", value: 40)
    static let assists5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 40)
    
    static let assists = [assists1, assists2, assists3, assists4, assists5]
    
    static let player1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 50)
    static let player2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/ANA_light.svg", position: "RW", value: 45)
    static let player3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg", position: "RW", value: 40)
    static let player4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg", position: "RW", value: 40)
    static let player5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 40)
    
    static let goalscorers = [player1, player2, player3, player4, player5]
    
    static let gaa1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 2.01123)
    static let gaa2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/ANA_light.svg", position: "RW", value: 2.124)
    static let gaa3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg", position: "RW", value: 2.2153)
    static let gaa4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg", position: "RW", value: 2.2265)
    static let gaa5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 2.4132)
    
    static let gaa = [gaa1, gaa2, gaa3, gaa4, gaa5]
    
    static let wins1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 30)
    static let wins2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/ANA_light.svg", position: "RW", value: 27)
    static let wins3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg", position: "RW", value: 25)
    static let wins4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg", position: "RW", value: 23)
    static let wins5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 19)
    
    static let wins = [wins1, wins2, wins3, wins4, wins5]
    
    static let so1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 10)
    static let so2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/ANA_light.svg", position: "RW", value: 9)
    static let so3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg", position: "RW", value: 8)
    static let so4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg", position: "RW", value: 7)
    static let so5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 6)
    
    static let shutouts = [so1, so2, so3, so4, so5]
    
    static let sv1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 0.921675)
    static let sv2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/ANA_light.svg", position: "RW", value: 0.914567)
    static let sv3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg", position: "RW", value: 0.91245)
    static let sv4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg", position: "RW", value: 0.907612)
    static let sv5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 0.9051523)
    
    static let svPctg = [sv1, sv2, sv3, sv4, sv5]
}
