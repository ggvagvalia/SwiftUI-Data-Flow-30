# Online Grocery Store App 

This project is a SwiftUI-based single-page application that allows users to browse and manage their grocery shopping in an intuitive way. The app displays a list of grocery items, allows users to adjust quantities, and provides a checkout view with real-time updates.

<img width="300" alt="Screenshot 2024-09-23 at 12 29 48 AM" src="https://github.com/user-attachments/assets/0aa359ab-f4cf-4d02-8b5d-df3d3e72f881">  <img width="300" alt="Screenshot 2024-09-23 at 12 30 28 AM" src="https://github.com/user-attachments/assets/ed7302d4-6647-4b52-847b-32e3ab3ae803"> <img width="300" alt="Screenshot 2024-09-23 at 12 30 43 AM" src="https://github.com/user-attachments/assets/17afae3a-d9e4-4539-9543-63687cb55098">


### Features

Static Header: Displays the type of food (e.g., vegetables, fruits) with an accompanying image.
Scrolling Body: Shows all products of the selected type, where each product includes: Name; Price; Image; Buttons for adding/subtracting quantity; Option to delete the product
Static Footer: Contains a shopping cart summary that shows:
Total number of items
Total amount to be paid
Discount Button: Apply a 20% discount on all products when the discount button is clicked.
Stock Management: Products that are out of stock appear grayed out and cannot be added to the cart.

### ViewModel Architecture

All application logic is contained within the ViewModel to maintain clean separation between UI and logic.

