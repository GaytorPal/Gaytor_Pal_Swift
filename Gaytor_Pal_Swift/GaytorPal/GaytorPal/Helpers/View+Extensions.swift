//
//  View+Extensions.swift
//  GaytorPal
//
//  Created by David Denis on 3/28/24.
//

import SwiftUI


/// Custom View Extensions


extension View {
    /// Custom Spacers (so no need to use Spacer() in Views)
    
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    /// Checking Two dates are the same
    
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
