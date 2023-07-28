//
//  InboxView.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 23.07.23.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var showProfile = false
    
    private var user: User?{
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ActiveNowView()
                
                List{
                    ForEach(0 ... 10, id: \.self){ message in
                            InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(isPresented: $showProfile, destination: {
                ProfileView(user: user)
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
            })
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    HStack{
                        CircularProfileImageView(user: user, size: .xSmall)
                            .onTapGesture {
                                showProfile.toggle()
                            }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
