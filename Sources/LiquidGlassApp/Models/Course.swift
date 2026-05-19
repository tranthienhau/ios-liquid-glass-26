import Foundation

public struct Course: Identifiable, Hashable, Sendable {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let category: String
    public let durationMinutes: Int
    public let accent: String

    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        category: String,
        durationMinutes: Int,
        accent: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.category = category
        self.durationMinutes = durationMinutes
        self.accent = accent
    }
}

public enum SampleData {
    public static let courses: [Course] = [
        .init(title: "Differential Calculus",
              subtitle: "Limits, derivatives, chain rule",
              category: "Math",
              durationMinutes: 42,
              accent: "blue"),
        .init(title: "Organic Chemistry I",
              subtitle: "Functional groups, reactions",
              category: "Chemistry",
              durationMinutes: 55,
              accent: "green"),
        .init(title: "World History 1900-1945",
              subtitle: "Two world wars timeline",
              category: "History",
              durationMinutes: 38,
              accent: "orange"),
        .init(title: "Linear Algebra",
              subtitle: "Vectors, matrices, eigenvalues",
              category: "Math",
              durationMinutes: 50,
              accent: "indigo"),
    ]

    public static let categories = ["All", "Math", "Chemistry", "History", "Physics"]
}
