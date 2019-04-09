//
//  UnitPickerHandler.swift
//  Spice Chart
//
//  Created by Ky Nguyen on 4/2/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//


import UIKit
class UnitPickerHandler: NSObject, EditorDelegate {
    private enum Item: String {
        case Grams, Ounces
    }
    let datasource = [Item.Grams.rawValue, Item.Ounces.rawValue]

    var editor: EditorView?
    init(editor: EditorView) {
        super.init()
        self.editor = editor
        editor.delegate = self
        editor.setDatasource(datasource: datasource)
    }

    var min: Double = 0
    var max: Double = 0
    var step: Double = 0

    func didSelectItem(item: String, atIndex: Int) {
        if item.lowercased() == Item.Grams.rawValue.lowercased() {
            min = 0
            max = 28
            step = 0.01
        } else {
            min = 0
            max = 16
            step = 1
        }
    }

    func getMax() -> Double {
        return max
    }

    func getMin() -> Double {
        return min
    }

    func getStep() -> Double {
        return step
    }

    func convertValue(value: Double, selectedItem: String) -> Double {
        var convertedValue: Double
//        28 GRAMS = 1 OUNCE
        if selectedItem == Item.Grams.rawValue {
            convertedValue = value * 28
            convertedValue = Double(Int(convertedValue))
        } else {
            convertedValue = value / 28
            convertedValue = (convertedValue * 1000) / 1000
        }

        return convertedValue
    }
}



