//
//  VolumeSlider.swift
//  visionProMusicApp
//
//  Created by Maxime BAUDOIN on 07/06/2024.
//

import SwiftUI
import MediaPlayer

struct VolumeSlider: View {
    
    @Binding var sliderProgress: CGFloat
    
    var symbol: Symbol?
    var axis: SliderAxis
    var tint: Color
    
    @State private var progress: CGFloat = .zero
    @State private var dragOffset: CGFloat = .zero
    @State private var lastDragOffset: CGFloat = .zero
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let orientationSize = axis == .horizontal ? size.width : size.height
            let progressValue = (max(progress, .zero)) * orientationSize
            
            ZStack(alignment: axis == .horizontal ? .leading : .bottom) {
                Rectangle()
                    .fill(.tertiary)
                
                Rectangle()
                    .fill(tint)
                    .frame(
                        width: axis == .horizontal ? progressValue : nil,
                        height: axis == .vertical ? progressValue : nil
                    )
                
                if let symbol, symbol.display {
                    Image(systemName: symbol.icon)
                        .font(symbol.font)
                        .foregroundStyle(symbol.tint)
                        .padding(symbol.padding)
                        .frame(width: size.width, height: size.height, alignment: symbol.alignment)
                }
            }
            .clipShape(.rect(cornerRadius: 15))
            .contentShape(.rect(cornerRadius: 15))
            .optionalSizingModifiers(
                axis: axis,
                size: size,
                progress: progress,
                orientationSize: orientationSize
            )
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged {
                        let translation = $0.translation
                        let movement = (axis == .horizontal ? translation.width : -translation.height) + lastDragOffset
                        dragOffset = movement
                        calculateProgress(orientationSize: orientationSize)
                        MPVolumeView.setVolume(Float(self.progress))
                    }
                    .onEnded { _ in
                        withAnimation(.smooth) {
                            dragOffset = dragOffset > orientationSize ? orientationSize : (dragOffset < 0 ? 0 : dragOffset)
                            calculateProgress(orientationSize: orientationSize)
                        }
                        
                        lastDragOffset = dragOffset
                    }
            )
            .frame(
                maxWidth: size.width,
                maxHeight: size.height,
                alignment: axis == .vertical ? (progress < 0 ? .top : .bottom) : (progress < 0 ? .trailing : .leading)
            )
            .onChange(of: sliderProgress, initial: true) { oldValue, newValue in
                guard sliderProgress != progress, (sliderProgress > 0 && sliderProgress < 1) else { return }
                progress = max(min(sliderProgress, 1.0), .zero)
                dragOffset = progress * orientationSize
                lastDragOffset = dragOffset
            }
            .onChange(of: axis) { oldValue, newValue in
                dragOffset = progress * orientationSize
                lastDragOffset = dragOffset
            }
        }
        .onChange(of: progress) { oldValue, newValue in
            sliderProgress = max(min(progress, 1.0), .zero)
        }
    }
    
    private func calculateProgress(orientationSize: CGFloat) {
        let topAndTrailingExcessOffset = orientationSize + (dragOffset - orientationSize) * 0.01
        let bottomAndLeadingExcessOffset = dragOffset < 0 ? (dragOffset * 0.01) : dragOffset
        let progress = (dragOffset > orientationSize ? topAndTrailingExcessOffset : bottomAndLeadingExcessOffset) / orientationSize
        self.progress = progress
    }

        
    struct Symbol {
        var icon: String
        var tint: Color
        var font: Font
        var padding: CGFloat
        var display: Bool = true
        var alignment: Alignment = .center
    }
        
    enum SliderAxis {
        case vertical
        case horizontal
    }

}

fileprivate extension View {
    @ViewBuilder
    func optionalSizingModifiers(axis: VolumeSlider.SliderAxis, size: CGSize, progress: CGFloat, orientationSize: CGFloat) -> some View {
        let topAndTrailingScale = 1 - (progress - 1) * 0.7
        let bottomAndLeadingScale = 1 + (progress) * 0.7
        
        self
            .frame(
                width: axis == .horizontal && progress < 0 ? size.width + (-progress * size.width) : nil,
                height: axis == .vertical && progress < 0 ? size.height + (-progress * size.height) : nil
            )
            .scaleEffect(
                x: axis == .vertical ? (progress > 1 ? topAndTrailingScale : (progress < 0 ? bottomAndLeadingScale : 1)) : 1,
                y: axis == .horizontal ? (progress > 1 ? topAndTrailingScale : (progress < 0 ? bottomAndLeadingScale : 1)) : 1,
                anchor: axis == .horizontal ? (progress < 0 ? .trailing : .leading) : (progress < 0 ? .top : .bottom)
            )
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}

#Preview {
    ContentView()
}
