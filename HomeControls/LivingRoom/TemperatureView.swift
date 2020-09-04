//
//  TemperatureView.swift
//  HomeControls
//
//  Created by Suneel Gunupudi on 04/09/20.
//  Copyright © 2020 Suneel. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    var row: Int
    @State var temperatureValue: CGFloat    = 0.0
    var body: some View {
        VStack {
            Text("Living Room")
                .font(.largeTitle)
                .bold()
                .foregroundColor(ColorConstants.textColorPrimary)
            Text("Temperature \(row)")
                .font(.body)
                .foregroundColor(ColorConstants.textColorSecondary)

            TemperatureControlView(temperatureValue: $temperatureValue)
                .padding(.top, 60)
            Spacer()

            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text("\(String.init(format: "%.0f", temperatureValue))")
                    .font(.system(size: 60))
                    .foregroundColor(ColorConstants.textColorPrimary)
                Text("°C")
                    .font(.system(size: 30))
                .bold()
                    .foregroundColor(ColorConstants.textColorPrimary)
            }
            Spacer()
        }
    }
}
