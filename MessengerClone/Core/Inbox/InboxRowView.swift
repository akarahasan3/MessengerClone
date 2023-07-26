//
//  InboxRowView.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 23.07.23.
//

import SwiftUI

struct InboxRowView: View {
    
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            CircularProfileImageView(user: User.MOCK_USER, size: .medium)
            
            VStack(alignment: .leading){
                Text("Heath Ledger")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some test message for now that goes onto two lines")
                    .font(.subheadline)
                    .foregroundStyle(Color(.gray))
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack{
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView()
}
