//
//  SampleFileStack.swift
//  DrAda
//
//  Created by Amit Gupta on 10/17/22.
//

import SwiftUI
import FilestackSDK

struct SampleFileStack: View {
    @State var animalName = " "
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage? = UIImage(named: "paws")
    
    var body: some View {
        HStack {
            VStack (alignment: .center,
                    spacing: 20){
                Text("Animal Friends")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                        Text(animalName)
                if let l=inputImage {
                    Image(uiImage: l).resizable()
                        .aspectRatio(contentMode: .fit)
                }
             
                        Button("Who am I?"){
                            self.buttonPressed()
                        }
                        .padding(.all, 14.0)
                        .foregroundColor(.white)
                            .background(Color.green)
                        .cornerRadius(10)
            }
            .font(.title)
        }.sheet(isPresented: $showingImagePicker, onDismiss: processImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func buttonPressed() {
        print("Button pressed")
        self.showingImagePicker = true
    }
    
    func processImage() {
        self.showingImagePicker = false
        self.animalName="Checking..."
        guard let inputImage = inputImage else {return}
        print("Processing image due to Button press")
        let imageJPG=inputImage.jpegData(compressionQuality: 0.0034)!
        let client=Client(apiKey: "AJodtieRSXayQvraX2pJAz")
        let uploadOptions = UploadOptions.defaults 
        
        let imageB64 = Data(imageJPG).base64EncodedData()
        let uploader=client.upload(using: imageJPG, options:uploadOptions,uploadProgress: { progress in
            // Here you may update the UI to reflect the upload progress.
            print("Progress: \(progress)")
        }) { response in
            // Try to obtain Filestack handle
            if let json = response.json, let handle = json["handle"] as? String {
                let url="https://cdn.filestackcontent.com/\(handle)"
                print("Handle is \(handle), and URL is \(url)")
                self.animalName=url
            } else if let error = response.error {
                print("Error is \(error)")
            }
        }
        
    }
}

struct SampleFileStack_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

