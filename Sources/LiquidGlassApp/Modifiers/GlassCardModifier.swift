import SwiftUI

@available(iOS 26.0, *)
public struct GlassCardModifier: ViewModifier {
    public let cornerRadius: CGFloat
    public let tint: Color?

    public init(cornerRadius: CGFloat = 24, tint: Color? = nil) {
        self.cornerRadius = cornerRadius
        self.tint = tint
    }

    public func body(content: Content) -> some View {
        content
            .padding(16)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .glassEffect(.regular.tint(tint ?? .clear), in: .rect(cornerRadius: cornerRadius))
            }
            .shadow(color: .black.opacity(0.08), radius: 16, x: 0, y: 8)
    }
}

@available(iOS 26.0, *)
public extension View {
    func glassCard(cornerRadius: CGFloat = 24, tint: Color? = nil) -> some View {
        modifier(GlassCardModifier(cornerRadius: cornerRadius, tint: tint))
    }
}
