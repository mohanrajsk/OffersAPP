//
//  DynamicValue.swift
//  OffersApp
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import Foundation
// MARK: Dynamic Value class to receive notifications to track if changes made on an array of objects
class DynamicValue<T> {

    typealias CompletionHandler = ((T) -> Void)

    var value: T {
        didSet {
            self.notify()
        }
    }

    private var observers = [String: CompletionHandler]()

    init(_ value: T) {
        self.value = value
    }

    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }

    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }

    private func notify() {
        observers.forEach({ $0.value(value) })
    }

    deinit {
        observers.removeAll()
    }
}
