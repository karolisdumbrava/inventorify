# Inventory Management System

A Ruby on Rails application designed to manage products, product variations, and inventories within different warehouses.

App can be reached https://inventorify.fly.dev/

## Features:

- **User Authentication:** Secure login and registration system using Devise.
- **Warehouses:** Create and manage multiple warehouses.
- **Inventories:** Assign products with variations to specific warehouses.
- **Products:** Add and manage products with details like name and description.
- **Product Variations:** Specify product variations, such as color, size, and price.
- **AJAX Product Search:** Search for products dynamically as you type.

## Prerequisites:

- Ruby
- PostgreSQL
- Yarn (for managing frontend dependencies)

## Setup:

1. **Clone the Repository:**
- https://github.com/karolisdumbrava/inventorify.git
- cd inventorify

2. **Install Dependencies:** 
- bundle install
- yarn install

3. **Setup Database:**
- rails db:create
- rails db:migrate

4. **Run the App:**
- bin/dev

## Usage:

1. Login/Register: Start by registering a new account or logging into an existing one.
2. Manage Warehouses: Once logged in, you can create or manage your warehouses.
3. Add Products: Add products and specify their details.
4. Product Variations: For each product, define its variations such as size, color, and price.
5. Assign Inventories: Specify the quantity of a specific product variation in a warehouse.
6. Search Products: Use the dynamic search feature to find products instantly.
