//
//  ContentView.swift
//  swiftui_collections_card
//
//  Created by cf on 2020/2/3.
//  Copyright © 2020 cf. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}


let sectionData1 = Section(
    title: "后赤壁赋图卷",
    text: "北宋乔仲常绘卷",
    logo: "北宋",
    image: Image("北宋乔仲常绘卷"),
    color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
)
let sectionData2 = Section(
    title: "销闲清课图",
    text: "由孙克弘绘制",
    logo: "明代",
    image: Image("san_shu_tu_juan06"),
    color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
)

let sectionData3 = Section(
    title: "销闲清课图",
    text: "由孙克弘绘制",
    logo: "明代",
    image: Image("san_shu_tu_juan06"),
    color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
)


let sectionData = [sectionData1,sectionData2,sectionData3]

struct SectionView2: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct SectionView: View {
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Card01:View{
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("销闲清课图")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(height:200)
            .background(Color.blue)
            .cornerRadius(8)
            .shadow(radius: 10)
            .padding()
            
        }
    }
}
struct Card02:View {
    
    var body: some View {
        HStack {
            
            Image("san_shu_tu_juan06")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.white, lineWidth: 3))
                .shadow(radius: 5)
                .frame(width: 180, height:180, alignment: .center)
            
            
            VStack(alignment:.leading) {
                Text("销闲清课图")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("由孙克弘绘制")
                    .font(.subheadline)
                    .foregroundColor(.white)
                HStack{
                    Image(systemName: "t.square.fill")
                        .foregroundColor(.pink)
                    
                    Text(": 明代")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .bold()
                        .italic()
                    
                }
            }.padding()
            
        }.frame(width: 380, height: 200)
            .background(Color.orange)
            .cornerRadius(8)
            .shadow(radius: 5)
        
        
    }
}

struct CardScroll: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(sectionData) { item in
                    GeometryReader { geometry in
                        SectionView(section: item)
                            .rotation3DEffect(Angle(degrees:
                                Double(geometry.frame(in: .global).minX - 30) / -20
                            ), axis: (x: 0, y: 10, z: 0))
                    }
                    .frame(width: 275, height: 275)
                }
            }
            .padding(30)
            .padding(.bottom, 30)
        }
        .offset(y: -30)
        
    }
}
struct ContentView: View {
    var body: some View {
        List{
            CardScroll()
            Card01()
            Card02()
            SectionView(section: sectionData1)
            SectionView2(section: sectionData2,width: screen.width - 60, height: 275)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
