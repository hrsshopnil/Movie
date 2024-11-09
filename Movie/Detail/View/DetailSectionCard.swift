//
//  DetailSectionCard.swift
//  Movie
//
//  Created by shopnil hasan on 10/11/24.
//

import SwiftUI

struct DetailSectionCard: View {
    let section: DetailViewSection
    var nameSpace: Namespace.ID
    @Binding var selectedSection: DetailViewSection
    
    var body: some View {
        Text(section.rawValue)
            .poppins(.medium, 16)
            .background {
                if section == selectedSection {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 3)
                        .offset(y: 20)
                        .matchedGeometryEffect(id: "DetailSectionCard", in: nameSpace)
                }
            }
    }
}

#Preview {
    DetailSectionCard(section: .about, nameSpace: Namespace().wrappedValue, selectedSection: .constant(.about))
}
