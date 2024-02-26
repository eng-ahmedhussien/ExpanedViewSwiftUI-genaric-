struct ExpanedView <Content: View,Content2: View>: View{
    
    @State var sectionState: SectionState = .folded
    var expanedContent: Content
    var foldedContent: Content2
    @Binding var isExpanded : Bool
    
    init(@ViewBuilder expanedContent: ()->Content,@ViewBuilder foldedContent: ()->Content2,isExpanded:Binding<Bool>) {
        self.expanedContent = expanedContent()
        self.foldedContent = foldedContent()
        self._isExpanded = isExpanded
    }
    var body: some View {
        VStack {
            if isExpanded {
                self.expanedContent
            } else {
                self.foldedContent
            }
        }
        .background(Color.white)
    }
}
