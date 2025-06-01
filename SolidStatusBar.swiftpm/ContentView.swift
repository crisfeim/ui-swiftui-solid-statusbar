import SwiftUI

struct ContentView: View {
    var body: some View {
        StatusBar(Material.ultraThin) {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(lorem)
                }
                .padding(.horizontal, 24)
            }
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .systemGray))
        }
    }
}

struct StatusBar<Bg, Content: View>: View {
    let background: Bg
    @ViewBuilder var content: () -> Content
    
    init(_ background: Bg, content: @escaping () -> Content) {
        self.background = background
        self.content = content
    }
    
    var body: some View {
        if let bg = background as? Material {
            content()
                .statusBarBackground(bg)
        } else if let bgView = background as? AnyView {
            content()
                .statusBarBackground(bgView)
        } else {
            content()
        }
    }
}

extension View {
    func statusBarBackground<Background: View>(_ background: Background) -> some View {
        self
            .overlay(alignment: .top) {
            Color.clear
                .background(background)
                .ignoresSafeArea(edges: .top)
                .frame(height: 0)
        }
    }
    
    @ViewBuilder
    func statusBarBackground(_ background: Material?) -> some View {
            self.overlay(alignment: .top) {
                Color.clear
                    .background(background ?? .thinMaterial)
                    .opacity(background != nil ? 1 : 0)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 0)
        }
    }
}

let lorem = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisi eu tincidunt tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc.

Praesent et lectus in enim bibendum malesuada. Donec congue massa eget nunc tincidunt, vel tincidunt nisi tincidunt. Fusce vel nunc eget nunc tincidunt tincidunt. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc.

Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vel nunc eget nunc tincidunt tincidunt. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc.

Curabitur nec nunc eget nunc tincidunt tincidunt. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc. Fusce vel nunc eget nunc tincidunt tincidunt.

Nulla facilisi. Donec congue massa eget nunc tincidunt, vel tincidunt nisi tincidunt. Fusce vel nunc eget nunc tincidunt tincidunt. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc. Sed euismod, nunc sit amet aliquam tincidunt, nunc nunc lacinia nunc, vitae aliquam nunc nisi id nunc.
"""
