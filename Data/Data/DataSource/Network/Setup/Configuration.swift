//
//  Configuration.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation


public protocol Configuration {
    static var serverBaseUrl: String { get }
}

struct AppEnvironment: Configuration{
    static var serverBaseUrl = "http://www.nactem.ac.uk"
}
