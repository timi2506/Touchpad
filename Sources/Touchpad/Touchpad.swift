//
//  Touchpad.swift
//  Touchpad
//
//  Created by Tim on 03.03.25.
//

import SwiftUI

public struct TouchpadView: View {
    public init(
        buttons: [TouchpadButton],
        touchPadLabel: String? = nil
    ) {
        self.buttons = buttons
        self.touchPadLabel = touchPadLabel
    }
    
    @State public var offset = CGSize.zero
    @State public var lastOffset: CGSize = .zero
    @State public var showPosition: CGSize = CGSize.zero
    @State public var cursorPosition: CGPoint = .zero
    @State public var currentGeometry: GeometryProxy?
    public let buttons: [TouchpadButton]
    public let touchPadLabel: String?
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    TouchPad.frame(maxHeight: .infinity, alignment: .bottom).padding()
                    ForEach(buttons, id: \.self.id) { button in
                        button.body
                    }
                    Cursor
                }
            } .onAppear {
                currentGeometry = geometry
            }
        } .ignoresSafeArea(.all)
    }
    
    public var Cursor: some View {
        RoundedRectangle(cornerRadius: 15).foregroundStyle(.ultraThinMaterial).frame(width: 25, height: 25).overlay(
            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 2.5)
        ).offset(offset)
    }
    public var TouchPad: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.ultraThinMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.gray.opacity(0.5))
            )
            .overlay(
                Text(touchPadLabel ?? "").foregroundColor(.gray).font(.caption).padding().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            )
            .simultaneousGesture(
                TapGesture()
                    .onEnded {
                        for button in buttons {
                            if button.boundaries.contains(cursorPosition) {
                                button.executeAction()
                            }
                        }
                    }
            )
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = CGSize(
                            width: lastOffset.width + gesture.translation.width,
                            height: lastOffset.height + gesture.translation.height
                        )
                        cursorPosition = CGPoint(
                            x: currentGeometry!.size.width / 2 + offset.width,
                            y: currentGeometry!.size.height / 2 + offset.height
                        )
                    }
                    .onEnded { _ in
                        lastOffset = offset
                    }
            )
            .frame(width: 300, height: 200)
    }
}

public struct TouchpadButton {
    public init(id: String, text: String?, symbolName: String?, boundaries: CGRect, action: @escaping () -> Void, border: Bool, borderColor: Color?, borderRadius: CGFloat?) {
        self.id = id
        self.text = text
        self.symbolName = symbolName
        self.boundaries = boundaries
        self.action = action
        self.border = border
        self.borderColor = borderColor ?? Color.red
        self.borderRadius = borderRadius ?? CGFloat(0)
    }
    public let id: String
    public let text: String?
    public let symbolName: String?
    public let boundaries: CGRect
    public let border: Bool
    public let borderColor: Color
    public let borderRadius: CGFloat
    public var body: some View {
        Group {
            ZStack {
                VStack {
                    if let text = text {
                        Text(text)
                    } else if let symbolName = symbolName {
                        Image(systemName: symbolName).resizable().scaledToFit()
                    }
                }
                if border {
                    RoundedRectangle(cornerRadius: borderRadius)
                        .stroke(borderColor)
                        .frame(width: boundaries.width, height: boundaries.height)
                }
            }
        } .frame(width: boundaries.width, height: boundaries.height).position(x: boundaries.midX, y: boundaries.midY)
    }
    public let action: () -> Void
    
    public func executeAction() {
        action()
    }
}

#Preview {
    TouchpadView(buttons: [
        TouchpadButton(id: "button1", text: "Button 1", symbolName: nil, boundaries: CGRect(x: 100, y: 100, width: 100, height: 100), action: {
            print("button 1 pressed")
        }, border: true, borderColor: nil, borderRadius: nil),
        TouchpadButton(id: "button2", text: "Button 2", symbolName: nil, boundaries: CGRect(x: 150, y: 205, width: 100, height: 45), action: {
            print("button 2 pressed")
        }, border: true, borderColor: .green, borderRadius: 15),
        TouchpadButton(id: "button3", text: "Button 3", symbolName: nil, boundaries: CGRect(x: 200, y: 250, width: 100, height: 50), action: {
            print("button 2 pressed")
        }, border: false, borderColor: nil, borderRadius: nil)
    ], touchPadLabel: nil)
}


