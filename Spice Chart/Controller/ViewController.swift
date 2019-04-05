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
    @IBOutlet weak var walnetView: DetailView!
    @IBOutlet weak var grapeseedView: DetailView!

    @IBOutlet weak var butterPicker: ElementEditor!
    @IBOutlet weak var spicesPicker: ElementEditor!
    @IBOutlet weak var spicesPercent: ElementEditor!
    @IBOutlet weak var numberOfServing: ElementEditor!

    var butterCalculator: ButterCalculator!

    var butterHandler: ButterPickerHandler!
    var unitHandler: UnitPickerHandler!
    var spicesPercentHandler: SpicesPercentageHandler!
    var servingNumberHandler: ServingNumberHandler!

    func setupView() {
        butterCalculator = ButterCalculator(cupView: butterPicker,
                                            gramView: spicesPicker,
                                            percentView: spicesPercent,
                                            numberServingView: numberOfServing)

        butterHandler = ButterPickerHandler(editor: butterPicker)
        unitHandler = UnitPickerHandler(editor: spicesPicker)
        spicesPercentHandler = SpicesPercentageHandler(editor: spicesPercent)
        servingNumberHandler = ServingNumberHandler(editor: numberOfServing)

        butterView.setTitle(name: "BUTTER")
        oliveView.setTitle(name: "EXTRA VIRGIN OLIVE OIL")
        coconutView.setTitle(name: "COCONUT OIL")
        walnetView.setTitle(name: "WALNUT OIL")
        grapeseedView.setTitle(name: "GRAPESEED OIL")
        avocadoView.setTitle(name: "AVOCADO OIL")

        butterPicker.setTitle(name: "of butter/oil", type: .selection)
        butterPicker.setDatasource(datasource: butterHandler.datasource)

        spicesPicker.setTitle(name: "of spices", type: .selection)
        spicesPicker.setDatasource(datasource: unitHandler.datasource)

        spicesPercent.setTitle(name: "% of spices", type: .text)
        spicesPercent.setDefaultValue()

        numberOfServing.setTitle(name: "# of servings", type: .text)
        numberOfServing.setDefaultValue()
    }

    var butterPickerDatasource = ["Tablespoons", "Cups"]
    var unitPickerDatasource = ["Grams", "Ounces"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        NotificationCenter.default.addObserver(self, selector: #selector(valueChange), name: NSNotification.Name(rawValue: "valueChange"), object: nil)
    }

    @objc func valueChange(value: Double) {
        butterView.totalValueLabel.text = butterCalculator.getTotal()
        butterView.servingValueLabel.text = butterCalculator.getMgServing()
    }
}
