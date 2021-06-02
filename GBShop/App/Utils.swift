//
//  Utils.swift
//  GBShop
//
//  Created by Vit K on 02.02.2021.
//

import Foundation
import Firebase
import FirebaseAnalytics

func registerOpenViewController(title: String) {
    Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
        AnalyticsParameterItemID: "id-\(title) viewController",
        AnalyticsParameterItemName: "\(title) name",
        AnalyticsParameterContentType: "content"
    ])
}

func registerButtonTapped(title: String) {
    Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
        AnalyticsParameterItemID: "id-\(title) button",
        AnalyticsParameterItemName: "\(title) name"
    ])
}

func registerAddingProductToBusket(title: Product) {
    Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
        AnalyticsParameterItemID: "id-\(title) product",
        AnalyticsParameterItemName: "\(title) name"
    ])
}
