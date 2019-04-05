//
//  ButterCalculator.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/4/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class ButterCalculator: NSObject {
    var cupView: ElementEditor
    var gramView: ElementEditor
    var percentView: ElementEditor
    var numberServingView: ElementEditor

    init(cupView: ElementEditor,
                     gramView: ElementEditor,
                     percentView: ElementEditor,
                     numberServingView: ElementEditor) {
        self.cupView = cupView
        self.gramView = gramView
        self.percentView = percentView
        self.numberServingView = numberServingView
        super.init()
    }

    private func getGrams() -> Double {
        if gramView.pickerWrapper.pickerView.selectedRow(inComponent: 0) == 0 {
            return gramView.value
        } else {
            return gramView.value * 28
        }
    }

    private func getCups() -> Double {
        if cupView.pickerWrapper.pickerView.selectedRow(inComponent: 0) == 0 {
            return cupView.value
        } else {
            return cupView.value * 16
        }
    }

    func getTotal() -> String {
        let total = calculateTotal()
        return total.formatNumber()
    }

//    # of spices (weight of gram only) * % of spices used = X
//    X * 1000 = Y
//
//    Butter Total MG = Y  *  .93
//    MG Per Serving = Value of # of servings (4th slider/stepper value) / Total MG
//
    private func calculateTotal() -> Double {
        let grams = getGrams()
        let yValue = grams * percentView.value / 100 * 1000
        let total = yValue * 0.93
        return total
    }

    func getMgServing() -> String {
        let total = calculateTotal()
        if total == 0 { return "0.0" }
        let value = numberServingView.value / total
        return value.formatNumber()
    }
}
