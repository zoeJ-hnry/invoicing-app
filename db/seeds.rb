# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Invoice.destroy_all

Item.destroy_all

User.destroy_all

users = User.create!([{
    name: "Zoe",
    email: "zoe@email.com"
},
{
    name: "Jo",
    email: "jo@email.com" 
}])

invoices = Invoice.create!([{
    invoice_number: "INV-1",
    user: users.first,
    total: 102.50,
    client: "James Shaw"
},
{
    invoice_number: "INV-2",
    user: users.last,
    total: 50,
    client: "Marama Davidson"  
},
{
    invoice_number: "INV-3",
    user: users.last,
    total: 3000.333  ,
    client: "Chloe Swarbrick"
},
{
    invoice_number: "INV-4",
    user: users.first,
    total: 36.25,
    client: "Jacinda Ardern" 
}])

Item.create!([{
    description: "services1",
    invoice: invoices.first,
    price: 102.50
},
{
    description: "services2",
    invoice: invoices.first,
    price: 50   
},
{
    description: "services3",
    invoice: invoices.first, 
    price: 3000.333  
},
{
    description: "services1",
    invoice: invoices[1],    
    price: 20.25  
},
{
    description: "services1",
    invoice: invoices[2],    
    price: 20.25  
},
{
    description: "services2",
    invoice: invoices[2],    
    price: 50  
},
{
    description: "services1",
    invoice: invoices.last,    
    price: 36.25  
}])
