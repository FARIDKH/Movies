//
//  SupportingFunction.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 12..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

func createColorFromRBG(red: Double, blue: Double, green: Double) -> Color {
    return Color(red: red / 235, green: blue / 235, blue: green / 235)
}

func mainBlue() -> Color {
    return createColorFromRBG(red: 19, blue: 18, green: 33)
}

func mainPurpure() -> Color {
    return createColorFromRBG(red: 166, blue: 77, green: 188)
}

func darkPurpure() -> Color {
    return createColorFromRBG(red: 76, blue: 75, green: 244)
}

func mainGradientColor() -> Gradient {
    return Gradient(colors: [
        createColorFromRBG(red: 136, blue: 19, green: 179),
        createColorFromRBG(red: 19, blue: 18, green: 33)
    ])
}

func secondaryGradientColor() -> Gradient {
    return Gradient(colors: [
        createColorFromRBG(red: 95, blue: 79, green: 240),
        createColorFromRBG(red: 189, blue: 77, green: 175)
    ])
}

let  categories = ["Popular","New","Soon","Trailers"]

