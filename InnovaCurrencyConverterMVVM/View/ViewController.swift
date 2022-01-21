//
//  ViewController.swift
//  InnovaCurrencyConverterMVVM
//
//  Created by Appcent on 21.01.2022.
//

import UIKit
import ReactiveKit
import Bond

class ViewController: UIViewController {

    @IBOutlet weak var lblUsd: UILabel!
    @IBOutlet weak var lblTRY: UILabel!
    @IBOutlet weak var lblGBP: UILabel!
    @IBOutlet weak var lblJPY: UILabel!
    @IBOutlet weak var lblPLN: UILabel!
    @IBOutlet weak var lblRUB: UILabel!
    @IBOutlet weak var btnConvert: UIButton!

    let viewModel = CurrencyConverterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        viewModel.getDatas()
        bind()
    }

    func bind() {
        btnConvert.reactive.tap.bind(to: self) {_,_ in
            self.lblUsd.text = "\(self.viewModel.currency?.rates["USD"] ?? 0) USD"
            self.lblTRY.text = "\(self.viewModel.currency?.rates["TRY"] ?? 0) TRY"
            self.lblGBP.text = "\(self.viewModel.currency?.rates["GBP"] ?? 0) GBP"
            self.lblJPY.text = "\(self.viewModel.currency?.rates["JPY"] ?? 0) JPY"
            self.lblPLN.text = "\(self.viewModel.currency?.rates["PLN"] ?? 0) PLN"
            self.lblRUB.text = "\(self.viewModel.currency?.rates["RUB"] ?? 0) RUB"
        }
    }




}

