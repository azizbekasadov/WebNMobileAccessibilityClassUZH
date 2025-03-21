import SwiftUI


//MealsView represents a view, which shows all restaurants in a list.

struct MealsView: View {
    //Load sample restaurant models from the Restaurant class
    let mensas: [Restaurant] = Restaurant.sampleData
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(mensas){ m in
                    NavigationLink(destination: RestaurantView(restaurant: m)){
                        RestaurantCardView(restaurant: m)
                            .accessibilityIdentifier("restaurantCard_\(m.id.uuidString)")
                    }
                }
            }
            .accessibilityIdentifier("restaurantList")
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.stack)
        }
    }
}

struct MealsView_Previews: PreviewProvider{
    static var previews: some View{
            MealsView()
        
    }
}

