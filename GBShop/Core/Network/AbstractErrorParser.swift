//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Vit K on 21.12.2020.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
