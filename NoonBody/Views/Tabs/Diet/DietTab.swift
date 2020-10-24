//
//  NoonBodyCollectionMain.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct DietTab: View {
    
    @State var DietLists: [dietPost] = [
        dietPost(dietWhen: "아침", dietTime: "9시 30분", dietText: "아침 먹음", dietImage: Image("food1"), dietDate: "2020. 10. 24"),
        dietPost(dietWhen: "점심", dietTime: "12시 30분", dietText: "점심 먹음", dietImage: Image("food2"), dietDate: "2020. 10. 24"),
        dietPost(dietWhen: "저녁", dietTime: "6시 30분", dietText: "저녁 먹음", dietImage: Image("food3"), dietDate: "2020. 10. 24"),
        dietPost(dietWhen: "아침", dietTime: "9시 30분", dietText: "아침 먹음", dietImage: Image("body1"), dietDate: "2020. 10. 23"),
        dietPost(dietWhen: "점심", dietTime: "12시 30분", dietText: "점심 먹음", dietImage: Image("body2"), dietDate: "2020. 10. 23"),
        dietPost(dietWhen: "저녁", dietTime: "6시 30분", dietText: "저녁 먹음", dietImage: Image("body3"), dietDate: "2020. 10. 23"),
        dietPost(dietWhen: "아침", dietTime: "9시 30분", dietText: "아침 먹음", dietImage: Image("food1"), dietDate: "2020. 10. 22"),
        dietPost(dietWhen: "저녁", dietTime: "6시 30분", dietText: "저녁 먹음", dietImage: Image("food3"), dietDate: "2020. 10. 22")
    ]
    
    @State var date = Date()
    @State var show = false
    
    @State var showSheet = false
    
    @State var selectedDateText: String = "Date"
    
    @State var day: Int = 0
    
    @State var choosedDate: String = "2020. 10. 24"
    
    @State var dateString: String = ""
    
    @State var myColor: String = "secondaryOrange"
    @State var isChoosed: Bool = false

    
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        
        let secondaryOrange = UIColor.init(netHex: 0xFFEFEA)
        UINavigationBar.appearance().backgroundColor = secondaryOrange
        
        }
    
    var body: some View {
        
        NavigationView {
            VStack{
                ScrollView(.horizontal, showsIndicators:false){
                    HStack(alignment: .center){
                        Spacer().frame(width:10)
                        
                        Text("2020. 10. 22")
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                            .background(Color(myColor))
                            .onTapGesture(count: 1, perform: {
                                choosedDate = "2020. 10. 22"
                                
                                self.isChoosed.toggle()
                                
                                if isChoosed{
                                    self.myColor = "primaryOrange"
                                }else{
                                    self.myColor = "secondaryOrange"
                                }
                            })
                        Text("2020. 10. 23")
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                            .background(Color(myColor))
                            .onTapGesture(count: 1, perform: {
                                choosedDate = "2020. 10. 23"
                                
                                self.isChoosed.toggle()
                                
                                if isChoosed{
                                    self.myColor = "primaryOrange"
                                }else{
                                    self.myColor = "secondaryOrange"
                                }
                            })
                        Text("2020. 10. 24")
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                            .background(Color(myColor))
                            .onTapGesture(count: 1, perform: {
                                choosedDate = "2020. 10. 24"
                                
                                self.isChoosed.toggle()
                                
                                if isChoosed{
                                    self.myColor = "primaryOrange"
                                }else{
                                    self.myColor = "secondaryOrange"
                                }
                            })
                        
//                        ForEach(DietLists, id: \.id){ post in
//
//                            dateString = "\(post.dietDate)"
//                            if post.dietDate != dateString{
//                                Text("\(post.dietDate)")
//                                    .onTapGesture(count: 1, perform: {
//                                        choosedDate = "\(post.dietDate)"
//                                    })
//                            }
//
//                            }
//
//                        ForEach(0..<DietLists.count){_ in
//                            dateString = "\(DietLists[0].dietDate)"
//
//                        }
                        
//
                        Spacer().frame(width:10)
                    }.frame(height: 80)
                }.background(Color.clear)
                .padding(.leading)
                .padding(.trailing)
                
                VStack{
                        List {
                            ForEach(DietLists, id: \.id){ post in
                                if post.dietDate == choosedDate{
                                    DietPostView(passed_dietWhen: post.dietWhen, passed_dietTime: post.dietTime, passed_dietText: post.dietText, passed_dietImage: post.dietImage)
                                        .listRowBackground(Color("secondaryOrange"))
                                }
                                
                            }.onDelete(perform: delete)
                            
                            
                        }.background(Color.clear)
                    
                }
                
                
                
                    
            }.background(Color("secondaryOrange"))
            
            
                

            .navigationTitle("식단")
            .navigationBarItems(trailing: WriteButton())
            
        }.navigationBarTitle("").navigationBarHidden(true)
    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            DietLists.remove(at: first)
        }
    }
    

}


struct DietTab_Previews: PreviewProvider {
    static var previews: some View {
        DietTab()
    }
}

fileprivate struct WriteButton: View{
    
    var body: some View{
        
        NavigationLink(destination: DietWrite()) {
            HStack {
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 20))
                Text("기록하기")
                    .bold()
                    .font(.system(size: 20))
            }.frame(minWidth: 0, maxWidth: 250)
            .padding()
            .foregroundColor(Color("primaryOrange"))
//            .background(Color("primaryOrange"))
            .cornerRadius(40)
        }
    
    }
}

