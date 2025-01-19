class MyRestaurantDatabase {
  Map<String, dynamic>? findMenuById(int id) {
    return menu[id];
  }

  Map<int, dynamic> menu = {
    1: {
      "id": 1,
      "name": "Mozzarella Sticks",
      "currency": "₹",
      "price": 49.99,
      "categoryId": 1,
    },
    2: {
      "id": 2,
      "name": "Broccoli Cheddar Soup",
      "currency": "₹",
      "price": 99.99,
      "categoryId": 1,
    },
    3: {
      "id": 3,
      "name": "Vegetable Chilli",
      "currency": "₹",
      "price": 39.99,
      "categoryId": 2,
    },
    4: {
      "id": 4,
      "name": "Four Cheese",
      "currency": "₹",
      "price": 79.99,
      "categoryId": 2,
    },
    5: {
      "id": 5,
      "name": "Hot Fudge Sunday",
      "currency": "₹",
      "price": 99.99,
      "categoryId": 3,
    },
    6: {
      "id": 6,
      "name": "Brownie Milkshake",
      "currency": "₹",
      "price": 109.99,
      "categoryId": 3,
    },
  };

  Map<int, dynamic> categories = {
    1: {
      "id": 1,
      "name": "Appetizers And Snacks",
    },
    2: {
      "id": 2,
      "name": "Gourmet Burgers",
    },
    3: {
      "id": 3,
      "name": "Milkshakes",
    },
  };
}
