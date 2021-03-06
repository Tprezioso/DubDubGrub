//
//  ProfileView.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/29/21.
//

import SwiftUI
import CloudKit

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    NameBackgroundView()
                    HStack(spacing: 16) {
                        ZStack {
                            AvatarView(size: 84, image: viewModel.avatar)
                            EditImage()
                        }
                        .padding(.leading, 12)
                        .onTapGesture { viewModel.isShowingPhotoPicker = true }
                        VStack(spacing: 1) {
                            TextField("First Name", text: $viewModel.firstName)
                                .profileNameStyle()
                            TextField("Last Name", text: $viewModel.lastName)
                                .profileNameStyle()
                            TextField("Company Name", text: $viewModel.companyName)
                        }.padding(.trailing, 16)
                    }
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    CharactersRemainView(currentCount: viewModel.bio.count)
                    TextEditor(text: $viewModel.bio)
                        .frame(height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1.0))
                }.padding(.horizontal, 20)
                Spacer()
                
                Button {
                    viewModel.createProfile()
                } label: {
                    DDGButton(title: "Create Profile")
                }
                .padding(.bottom)
            }
            if viewModel.isLoading { LoadingView() }
        }.navigationTitle("Profile")
        .toolbar {
            Button {
                dismissKeyboard()
            } label: {
                Image(systemName: "keyboard.chevron.compact.down")
            }
        }
        .onAppear { viewModel.getProfile() }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .sheet(isPresented: $viewModel.isShowingPhotoPicker) {
            PhotoPicker(image: $viewModel.avatar)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}

struct NameBackgroundView: View {
    var body: some View {
        Color(.secondarySystemBackground)
            .frame(height: 130)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct EditImage: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .foregroundColor(.white)
            .offset(y: 30)
    }
}

struct CharactersRemainView: View {
    var currentCount: Int
    
    var body: some View {
        Text("Bio:")
            .font(.callout)
            .foregroundColor(.secondary)
            +
            Text(" \(100 - currentCount)")
            .bold()
            .font(.callout)
            .foregroundColor(currentCount <= 100 ? .brandPrimary : .pink)
            +
            Text(" characters remain")
            .font(.callout)
            .foregroundColor(.secondary)
    }
}
