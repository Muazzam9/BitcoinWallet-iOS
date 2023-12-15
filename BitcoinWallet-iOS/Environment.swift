import Foundation

public enum Environment {
    
    enum keys {
        static let fixerApiKey = "FIXER_API_KEY"
    }
    
    static let infoDictionary: [String:Any] = {
        guard let dict = Bundle.main.infoDictionary else {fatalError("Error")}
        return dict
    }()
    
    static let fixerApiKey: String = {
        guard let fixerApiKeyString = infoDictionary[keys.fixerApiKey] as? String else {fatalError("Error")}
        return fixerApiKeyString
    }()
    
}
