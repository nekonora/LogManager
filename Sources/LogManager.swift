//
//  DevLogManager.swift
//  Clockifier
//
//  Created by Filippo Zaffoni on 21/03/2020.
//  Copyright © 2020 Filippo Zaffoni. All rights reserved.
//

import Foundation

public enum LogSource: String {
    case services
    case storage
    case ui
    case general
    
    var name: String { rawValue.uppercased() }
}

public enum LogLevel {
    case info, debug
}

public enum LogType {
    case info, warning, error
    
    var indicator: String {
        switch self {
        case .info: return ""
        case .warning: return "⚠️"
        case .error: return "⛔️"
        }
    }
}

public final class LogManager {
    
    // MARK: - Instance
    public static let shared = LogManager()
    
    private init() { }
    
    // MARK: - Properties
    public var logLevel: LogLevel = .info
    
    // MARK: - Class methods
    public func logMessage(source: LogSource, message: String, type: LogType = .info) {
        print("\n[DEVLOG][SERVICES] - ")
    }
    
    @available(macOS 10.15, *)
    @available(macCatalyst 15.0, *)
    @available(iOS 15.0, *)
    public func logNetworkResponse(_ result: URLSession.DataTaskPublisher.Output) {
        guard let httpResponse = result.response as? HTTPURLResponse else { return }
                
        let messageURL  = "\n| URL:  - \(result.response.url?.absoluteString ?? "")"
        let messageCode = "\n| Code: - \(httpResponse.statusCode)"
        let messageBody = "\n| Body: - \n\(NSString(data: result.data, encoding: 1) ?? "")"
        
        let message: String = {
            var _message = messageURL + messageCode
            if logLevel == .debug { _message += messageBody }
            return _message
        }()
        
        logMessage(source: .services, message: "Network response:\n\(message)\n", type: .info)
    }
}
