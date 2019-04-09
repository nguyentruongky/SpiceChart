//
//  ViewController.swift
//  Spice Chart
//
//  Created by Scott Damopoulos on 3/31/19.
//  Copyright © 2019 damopoulos.scott@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var butterView: DetailView!
    @IBOutlet weak var coconutView: DetailView!
    @IBOutlet weak var oliveView: DetailView!
    @IBOutlet weak var avocadoView: DetailView!
    @IBOutlet weak var walnutView: DetailView!
    @IBOutlet weak var grapeseedView: DetailView!

    @IBOutlet weak var toolPickerView: EditorView!
    @IBOutlet weak var unitPickerView: EditorView!
    @IBOutlet weak var percentPickerView: EditorView!
    @IBOutlet weak var servingAmountView: EditorView!

    var calculator: Calculator!

    var toolPicker: ToolPickerHandler!
    var unitPicker: UnitPickerHandler!
    var percentPicker: PercentPickerHandler!
    var servingAmountPicker: ServingAmountPickerHandler!

    func setupView() {
        calculator = Calculator(toolView: toolPickerView,
                                unitView: unitPickerView,
                                percentView: percentPickerView,
                                servingAmountView: servingAmountView)

        toolPicker = ToolPickerHandler(editor: toolPickerView)
        unitPicker = UnitPickerHandler(editor: unitPickerView)
        percentPicker = PercentPickerHandler(editor: percentPickerView)
        servingAmountPicker = ServingAmountPickerHandler(editor: servingAmountView)

        butterView.setTitle(name: "BUTTER")
        oliveView.setTitle(name: "EXTRA VIRGIN OLIVE OIL")
        coconutView.setTitle(name: "COCONUT OIL")
        walnutView.setTitle(name: "WALNUT OIL")
        grapeseedView.setTitle(name: "GRAPESEED OIL")
        avocadoView.setTitle(name: "AVOCADO OIL")

        toolPickerView.setTitle(name: "of butter/oil", type: .selection)
//        butterPicker.setDatasource(datasource: toolPicker.datasource)

        unitPickerView.setTitle(name: "of spices", type: .selection)
//        spicesPicker.setDatasource(datasource: unitPicker.datasource)

        percentPickerView.setTitle(name: "% of spices", type: .text)
        percentPickerView.setDefaultValue()

        servingAmountView.setTitle(name: "# of servings", type: .text)
        servingAmountView.setDefaultValue()
    }

    var butterPickerDatasource = ["Tablespoons", "Cups"]
    var unitPickerDatasource = ["Grams", "Ounces"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        NotificationCenter.default.addObserver(self, selector: #selector(valueChange), name: NSNotification.Name(rawValue: "valueChange"), object: nil)
    }

    @objc func valueChange(value: Double) {
        calculateValues(ingredient: .butter)
        calculateValues(ingredient: .coconut)
        calculateValues(ingredient: .avocado)
        calculateValues(ingredient: .olive)
        calculateValues(ingredient: .walnut)
        calculateValues(ingredient: .grapeseed)
    }

    func calculateValues(ingredient: IngredientType) {
        let value = calculator.calculateFigure(ingredientType: ingredient)
        let detailView: DetailView
        switch ingredient {
        case .butter:
            detailView = butterView
        case .avocado:
            detailView = avocadoView
        case .coconut:
            detailView = coconutView
        case .olive:
            detailView = oliveView
        case .walnut:
            detailView = walnutView
        case .grapeseed:
            detailView = grapeseedView
        }
        detailView.totalValueLabel.text = value.total.formatNumber()
        detailView.servingValueLabel.text = value.mgServing.formatNumber()
    }
}

