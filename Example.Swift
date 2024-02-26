//MARK: using 
struct ExampleView: View {

    @State private var isExpand = false
    
    var body: some View {
        ZStack { 
                ExpanedView(expanedContent: {expandedTopView},
                            foldedContent: {foldedTopView},
                            isExpanded: $isExpand)
                .appCornerRadius(25, corners: [.bottomLeft, .bottomRight])
                .shadow(color: Color.theme.primary.opacity(0.2), radius: 5, x: 0, y: 2)
    }
    }
}

//MARK: - Expanded view
extension ExampleView {
    private var seeMoreButtonTopview : some View {
        AppButton(state: .constant(.normal), style: .plain) {
            withAnimation {
                self.isExpand.toggle()
            }
        } builder: {
            VStack{
                Text(self.isExpand ? "See less" : "See more")
                    .appFont(.caption)
                Image(self.isExpand ? "dropUpNew" : "dropdownNew")
            }
        }
    }

    var foldedTopView : some View {
        VStack {
            VStack(alignment:.leading , spacing: 20 ){
                Text("floded")
            }
            .padding()
            seeMoreButtonTopview
        }.frame(width: UIScreen.main.bounds.width)
    }
    var expandedTopView : some View{
        VStack{
              Text("expanded")
            }
            .padding()
            seeMoreButtonTopview
        }.frame(width: UIScreen.main.bounds.width)
    }
}
