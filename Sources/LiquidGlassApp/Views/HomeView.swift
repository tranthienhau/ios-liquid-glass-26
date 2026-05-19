import SwiftUI

@available(iOS 26.0, *)
struct HomeView: View {
    @State private var selectedCategory: String = "All"
    @Namespace private var heroNamespace

    private var courses: [Course] {
        if selectedCategory == "All" {
            return SampleData.courses
        }
        return SampleData.courses.filter { $0.category == selectedCategory }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                categoryStrip
                heroCard
                courseGrid
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 80)
        }
        .background(BackgroundGradient())
        .navigationTitle("SoStudy")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.title2)
                    .glassEffect(.regular, in: .circle)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Good morning, Anna")
                .font(.title2.bold())
            Text("Pick up where you left off")
                .foregroundStyle(.secondary)
        }
        .padding(.top, 8)
    }

    private var categoryStrip: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(SampleData.categories, id: \.self) { c in
                    Button {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) {
                            selectedCategory = c
                        }
                    } label: {
                        Text(c)
                            .font(.subheadline.weight(.semibold))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .glassEffect(
                                selectedCategory == c
                                    ? .regular.tint(.blue.opacity(0.4)).interactive()
                                    : .regular.interactive(),
                                in: .capsule
                            )
                    }
                }
            }
        }
    }

    private var heroCard: some View {
        NavigationLink(value: SampleData.courses[0]) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Featured")
                        .font(.caption.bold())
                        .foregroundStyle(.secondary)
                    Text(SampleData.courses[0].title)
                        .font(.title3.bold())
                    Text(SampleData.courses[0].subtitle)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                Spacer()
                Image(systemName: "function")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundStyle(.blue)
                    .matchedGeometryEffect(id: SampleData.courses[0].id, in: heroNamespace)
            }
            .glassCard(tint: .blue.opacity(0.15))
        }
        .buttonStyle(.plain)
        .navigationDestination(for: Course.self) { c in
            CourseDetailView(course: c, namespace: heroNamespace)
        }
    }

    private var courseGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(courses) { c in
                NavigationLink(value: c) {
                    CourseCard(course: c)
                        .matchedGeometryEffect(id: c.id, in: heroNamespace)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

@available(iOS 26.0, *)
private struct CourseCard: View {
    let course: Course

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: iconName)
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(accent)
            Text(course.title)
                .font(.headline)
                .lineLimit(2)
            Text("\(course.durationMinutes) min")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassCard(cornerRadius: 20, tint: accent.opacity(0.12))
    }

    private var accent: Color {
        switch course.accent {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "indigo": return .indigo
        default: return .purple
        }
    }

    private var iconName: String {
        switch course.category {
        case "Math": return "function"
        case "Chemistry": return "flask.fill"
        case "History": return "book.closed.fill"
        default: return "graduationcap.fill"
        }
    }
}

@available(iOS 26.0, *)
private struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(
            colors: [
                Color(.systemBackground),
                Color.blue.opacity(0.08),
                Color.purple.opacity(0.08),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
