import Foundation

struct UserProfile : Hashable, Equatable{
    let id: UUID
    let username: String
    var bio: String
    var followers: Int

    
    // TODO: Implement Hashable
    // Consider: Which properties should be used for hashing?
    // Remember: Only use immutable properties
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    // TODO: Implement Equatable
    // Consider: Which properties determine equality?
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.username == rhs.username &&
            lhs.bio == rhs.bio &&
            lhs.followers == rhs.followers
    }
}
