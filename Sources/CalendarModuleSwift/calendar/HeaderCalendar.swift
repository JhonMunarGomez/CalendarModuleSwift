import SwiftUI

struct HeaderCalendar: View
{
    @Binding var dateReference: Date
    
    var body: some View
    {
        HStack
        {
            Spacer()
            Button(action: previousMonth)
            {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
            Text(CalendarHelper().monthYearString(dateReference))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            Button(action: nextMonth)
            {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
            Spacer()
        }
    }
    
    func previousMonth()
    {
        dateReference = CalendarHelper().minusMonth(dateReference)
    }
    
    func nextMonth()
    {
        dateReference = CalendarHelper().plusMonth(dateReference)
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCalendar(dateReference: .constant(Date()))
    }
}
