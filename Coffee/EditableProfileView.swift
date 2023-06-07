import SwiftUI

struct UserProfile {
    var name: String
    var profileImage: String // Holding the image name
}

struct EditableProfileView: View {
    @State private var name: String = "User Name"
    @State private var selectedImage: String = "profile_photo" // Placeholder Image

    var body: some View {
        VStack {
            Image(selectedImage)
                .resizable()
                .scaledToFill()
                .onTapGesture {
                    selectedImage = "new_profile_photo" // Simulate the selection of a new image
                }
            
            TextField("Enter your name", text: $name)
            
            Button(action: {
                selectedImage = "new_profile_photo" // Simulate the selection of a new image
            }) {
                Text("Select Profile Picture")
            }
            
            Button(action: {
                // Simulate saving the user's profile information
                let userProfile = UserProfile(name: name, profileImage: selectedImage)
                // The userProfile object would be stored somewhere in a real app
            }) {
                Text("Save Profile")
            }
        }
    }
}

struct EditableProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditableProfileView()
    }
}
