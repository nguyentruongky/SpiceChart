//
//  ButterCalculator.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/4/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class Calculator: NSObject {
    var toolView: EditorView
    var unitView: EditorView
    var percentView: EditorView
    var servingAmountView: EditorView
    let ingredientValues: [IngredientType: Double] = [
        .butter: 0.93,
        .coconut: 0.82,
        .olive: 0.83,
        .avocado: 0.92,
        .walnut: 0.83,
        .grapeseed: 0.81
    ]

    init(toolView: EditorView,
                     unitView: EditorView,
                     percentView: EditorView,
                     servingAmountView: EditorView) {
        self.toolView = toolView
        self.unitView = unitView
        self.percentView = percentView
        self.servingAmountView = servingAmountView
        super.init()
    }

    private func getGrams() -> Double {
        if unitView.pickerWrapper.pickerView.selectedRow(inComponent: 0) == 0 {
            return unitView.value
        } else {
            return unitView.value * 28
        }
    }

    private func getCups() -> Double {
        if toolView.pickerWrapper.pickerView.selectedRow(inComponent: 0) == 0 {
            return toolView.value
        } else {
            return toolView.value * 16
        }
    }

}

extension Calculator {
    func calculateFigure(ingredientType: IngredientType) -> (total: Double, mgServing: Double) {
        guard let fixedValue = ingredientValues[ingredientType] else { return (0, 0) }
        let grams = getGrams()
        let yValue = grams * percentView.value / 100 * 1000
        let total = yValue * fixedValue
        if servingAmountView.value == 0 { return (total, 0) }

        let value = total / servingAmountView.value
        return (total, value)
    }

}

enum IngredientType {
    case butter, coconut, olive, avocado, walnut, grapeseed
}
