//
//  CurrencyViewModel.swift
//  InnovaCurrencyConverterMVVM
//
//  Created by Appcent on 21.01.2022.
//

import Foundation
import Bond
import ReactiveKit

class CurrencyConverterViewModel {

    var currency: Currency?

    func getDatas() {
        print("girdim")
        APICaller.shared.getAPI { result in
            guard let result = result else { return }
            self.currency = result
        }
    }

}
