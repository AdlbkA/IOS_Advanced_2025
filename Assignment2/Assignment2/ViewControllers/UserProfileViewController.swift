import Foundation
import UIKit

class UserProfileViewController : UIViewController, ProfileUpdateDelegate {
    func profileDidUpdate(_ profile: UserProfile) {
        <#code#>
    }
    
    func profileLoadingError(_ error: any Error) {
        <#code#>
    }
    
    // TODO: Consider reference type for these properties
    var profileManager: ProfileManager?
    var imageLoader: ImageLoader?
    
    func setupProfileManager() {
        // TODO: Implement setup
        // Think: What reference type should be used in closure?
    }
    
    func updateProfile() {
        // TODO: Implement profile update
        // Consider: How to handle closure capture list?
    }
}
