//
//  MainIntroView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainIntroView: View {
    
    //@State private var babyname: String = "Your baby"

    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Group {
                        Text("intro_info_header")
                            .font(.title)
                            .bold()
                            .padding()
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("intro_info_text")
                            .multilineTextAlignment(.center)
                            .font(.title3)
                        

                        Spacer()
                        Image("astronaut_camera")
                            .resizable()
                            .frame(width: 200.0, height: 200.0)
                    }

                    /*
                    GroupBox {
                        Form {
                            Section(header: Text("intro_tell_us_baby_name")) {
                                TextField(
                                    "intro_tell_us_baby_name",
                                    text: $babyname
                                )
                                .onSubmit {
                                    //validate(name: username)
                                }
                                .textInputAutocapitalization(.words)
                                .disableAutocorrection(true)
                                .border(.clear)
                                .multilineTextAlignment(.center)
                            }
                        
                        }.frame(height: 150)
                    }
                     */
                    
                    NavigationLink(destination: CameraView()) {
                        Label("start_ar_view", systemImage: "camera.viewfinder")
                    }
                    
                    /* Button(action: {}) {
                        Label("start_ar_view", systemImage: "camera.viewfinder")
                      } */
                
                    .buttonStyle(.automatic)
                    .buttonBorderShape(.automatic)
                    .padding()
                    
                    GroupBox {
                        Text("dialog_first_time_title")
                            .font(.title)
                        Spacer()
                        Text("intro_howto_text")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("intro_howto_header")
                            .font(.title3)
                            .padding(.bottom, 4)
                        Text("dialog_first_time_message")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct MainIntroView_Previews: PreviewProvider {
    static var previews: some View {
        MainIntroView()
    }
}
