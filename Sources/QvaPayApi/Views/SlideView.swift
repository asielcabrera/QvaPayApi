//
//  File.swift
//  
//
//  Created by Asiel Cabrera on 1/14/21.
//

import SwiftUI

@available(iOS 13.0, *)
@available(iOS 13.0, *)
public struct SlideOverCardView<Content:View>: View {
    var isPresented: Binding<Bool>
    
    let onDismiss: (() -> Void)?
    
    var dragEnabled: Binding<Bool>
    var dragToDismiss: Binding<Bool>
    var displayExitButton: Binding<Bool>
    
    let content: Content
    
    init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, dragEnabled: Binding<Bool> = .constant(true), dragToDismiss: Binding<Bool> = .constant(true), displayExitButton: Binding<Bool> = .constant(true), content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.onDismiss = onDismiss
        self.dragEnabled = dragEnabled
        self.dragToDismiss = dragToDismiss
        self.displayExitButton = displayExitButton
        self.content = content()
    }
    
    @GestureState private var viewOffset: CGFloat = 0.0
    
    public var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            if displayExitButton.wrappedValue {
                Button(action: {
                    self.isPresented.wrappedValue = false
                    if (self.onDismiss != nil) { self.onDismiss!() }
                }) {
                    SOCExitButton()
                }.frame(width: 24, height: 24)
            }
            content
                .padding([.horizontal, displayExitButton.wrappedValue ? .bottom : .vertical], 14)
        }.padding(20)
        .background(RoundedRectangle(cornerRadius: 38.5, style: .continuous)
                        .fill(Color(.systemGray6)))
        .clipShape(RoundedRectangle(cornerRadius: 38.5, style: .continuous))
        .offset(x: 0, y: viewOffset/pow(2, abs(viewOffset)/500+1))
        .gesture(
            dragEnabled.wrappedValue ?
                DragGesture()
                .updating($viewOffset) { value, state, transaction in
                    state = value.translation.height
                }
                .onEnded() { value in
                    if value.predictedEndTranslation.height > 175 && self.dragToDismiss.wrappedValue {
                        self.isPresented.wrappedValue = false
                        if (self.onDismiss != nil) { self.onDismiss!() }
                    }
                } : nil
        )
    }
}

public struct SOCActionButton: ButtonStyle {
    public init() {}
    
    @available(iOS 13.0.0, *)
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
                .font(Font.body.weight(.medium))
                .padding(.vertical, 20)
                .foregroundColor(.white)
            Spacer()
        }.background(Color.accentColor).overlay(configuration.isPressed ? Color.black.opacity(0.2) : nil).cornerRadius(12)
    }
}

public struct SOCAlternativeButton: ButtonStyle {
    public init() {}
    
    @available(iOS 13.0.0, *)
    public func makeBody(configuration: Configuration) -> some View {
        return SOCActionButton().makeBody(configuration: configuration).accentColor(Color(.systemGray5))
    }
}

public struct SOCEmptyButton: ButtonStyle {
    public init() {}
    
    @available(iOS 13.0.0, *)
    public func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .font(Font.body.weight(.bold))
            .padding(.top, 18)
            .foregroundColor(.accentColor)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

@available(iOS 13.0, *)
public struct SOCExitButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    public var body: some View {
        return ZStack {
            Circle()
                .fill(Color(white: colorScheme == .dark ? 0.19 : 0.93))
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
            .font(Font.body.weight(.bold))
                .scaleEffect(0.416)
                .foregroundColor(Color(white: colorScheme == .dark ? 0.62 : 0.51))
        }
    }
}

@available(iOS 13.0, *)
extension View {
    public func slideOverCard<Content:View>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, dragEnabled: Binding<Bool> = .constant(true), dragToDismiss: Binding<Bool> = .constant(true), displayExitButton: Binding<Bool> = .constant(true), @ViewBuilder content: @escaping () -> Content) -> some View {
        // If device is an iPad, present centered and resized view with alternative transition
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        return ZStack {
            self
           
            if isPresented.wrappedValue {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .zIndex(1)
                
                VStack {
                    Spacer()
                    
                    SlideOverCardView(isPresented: isPresented,
                                      onDismiss: onDismiss,
                                      dragEnabled: dragEnabled,
                                      dragToDismiss: dragToDismiss,
                                      displayExitButton: displayExitButton) {
                        content()
                    }.padding(isiPad ? 0 : 6)
                    .conditionalAspectRatio(isiPad, 1.0, contentMode: .fit)
                    
                    if isiPad { Spacer() }
                }.edgesIgnoringSafeArea(.bottom)
                .transition(isiPad ? AnyTransition.opacity.combined(with: .offset(x: 0, y: 200)) : .move(edge: .bottom))
                .zIndex(2)
            }
        }.animation(.spring(response: 0.35, dampingFraction: 1))
    }
    
    private func conditionalAspectRatio(_ apply: Bool, _ aspectRatio: CGFloat? = .none, contentMode: ContentMode) -> some View {
        Group {
            if apply {
                self.aspectRatio(aspectRatio, contentMode: contentMode)
            } else { self }
        }
    }
}
