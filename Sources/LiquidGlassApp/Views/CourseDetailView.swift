import SwiftUI

@available(iOS 26.0, *)
struct CourseDetailView: View {
    let course: Course
    let namespace: Namespace.ID
    @State private var isPlaying = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "function")
                        .font(.system(size: 56, weight: .bold))
                        .foregroundStyle(.blue)
                        .matchedGeometryEffect(id: course.id, in: namespace)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                .glassCard(cornerRadius: 28, tint: .blue.opacity(0.15))

                VStack(alignment: .leading, spacing: 8) {
                    Text(course.category.uppercased())
                        .font(.caption.bold())
                        .foregroundStyle(.secondary)
                    Text(course.title)
                        .font(.largeTitle.bold())
                    Text(course.subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                Text(longDescription)
                    .font(.body)
                    .lineSpacing(4)

                HStack(spacing: 16) {
                    Label("\(course.durationMinutes) min", systemImage: "clock")
                    Label("12 lessons", systemImage: "list.bullet")
                    Label("4.8", systemImage: "star.fill")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 120)
        }
        .background(BackgroundGradient())
        .safeAreaInset(edge: .bottom) {
            playerBar
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var playerBar: some View {
        HStack(spacing: 12) {
            Button {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    isPlaying.toggle()
                }
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.title2)
                    .frame(width: 48, height: 48)
                    .glassEffect(.regular.tint(.blue).interactive(), in: .circle)
                    .foregroundStyle(.white)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(course.title).font(.subheadline.bold()).lineLimit(1)
                Text("Lesson 1 / 12").font(.caption).foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "forward.fill")
                .font(.title3)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .glassEffect(.regular, in: .rect(cornerRadius: 24))
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
    }

    private var longDescription: String {
        "This course walks through the fundamentals of differential calculus, building up from limits and continuity to derivatives, the chain rule, and applied optimization. Each lesson includes interactive checks and an end-of-section quiz to reinforce key ideas."
    }
}

@available(iOS 26.0, *)
private struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(
            colors: [Color(.systemBackground), .blue.opacity(0.08)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
