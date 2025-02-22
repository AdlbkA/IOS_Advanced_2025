import Foundation

protocol ProfileUpdateDelegate : AnyObject {
    // TODO: Consider protocol inheritance requirements
    // Think: When should we restrict protocol to reference types only?
    func profileDidUpdate(_ profile: UserProfile)
    func profileLoadingError(_ error: Error)
}

class ProfileManager {
    var activeProfiles: [String: UserProfile]
    
    weak var delegate: ProfileUpdateDelegate?
    
    var onProfileUpdate: ((UserProfile) -> Void)?
    
    init(delegate: ProfileUpdateDelegate? = nil) {
        self.delegate = delegate
        self.activeProfiles = [:]
    }
    
    func loadProfile(id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        DispatchQueue.global().async {
            if let profile = self.activeProfiles[id] {
                DispatchQueue.main.async{
                    completion(.success(profile))
                    self.delegate?.profileDidUpdate(profile)
                    self.onProfileUpdate?(profile)
                }
            }
            else {
                let error = NSError(domain: "Profile Loading Error", code: 404, userInfo: [NSLocalizedDescriptionKey: "Profile not found"])
                DispatchQueue.main.async {
                    completion(.failure(error))
                    self.delegate?.profileLoadingError(error)
                    
                }
            }
        }
        
    }
}
