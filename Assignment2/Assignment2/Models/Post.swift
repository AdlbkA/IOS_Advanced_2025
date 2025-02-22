import Foundation

struct Post : Hashable, Equatable {
    let id: UUID
    let authorId: UUID
    var content: String
    var likes: Int
    
    // TODO: Implement Hashable
    // Consider: Which properties should be used for hashing?
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(authorId)
    }
    
    // TODO: Implement Equatable
    // Consider: When should two posts be considered equal?
    static func == (lhs: Post, rhs: Post) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.authorId == rhs.authorId &&
            lhs.content == rhs.content &&
            lhs.likes == rhs.likes
    }
}
