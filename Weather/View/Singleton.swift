final class Singleton {
    static let shared = Singleton()
    
    private init() {}
    
    var currentAccount:String?
}

