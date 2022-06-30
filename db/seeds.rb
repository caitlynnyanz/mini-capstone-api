# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create(name: "'Crime and Punishment' by Fyodor Dostoevsky", price: 18.99, image_url: "https://images-na.ssl-images-amazon.com/images/I/71CcO-jvRUL.jpg", description: "Crime and Punishment follows the mental anguish and moral dilemmas of Rodion Raskolnikov, an impoverished ex-student in Saint Petersburg..")

Product.create(name: "'War and Peace' by Leo Tolstoy", price: 21.99, image_url: "https://images-na.ssl-images-amazon.com/images/I/A1aDb5U5myL.jpg", description: "War and Peace chronicles the French invasion of Russia and the impact of the Napoleonic era on Tsarist society through the stories of five Russian aristocratic families..")

Product.create(name: "'Wuthering Heights' by Emily Bronte", price: 17.99, image_url: "https://static.wikia.nocookie.net/classical-literature/images/e/e9/Wuthering-heights1.jpg/revision/latest?cb=20190503012621", description: "Wuthering Heights concerns two families of the landed gentry living on the West Yorkshire moors, the Earnshaws and the Lintons, and their turbulent relationships with Earnshaw's foster son, Heathcliff..")

Product.create(name: "'The Picture of Dorian Gray' by Oscar Wilde", price: 14.99, image_url: "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781625587534/the-picture-of-dorian-gray-9781625587534_hr.jpg", description: "The story revolves around a portrait of Dorian Gray painted by Basil Hallward, a friend of Dorian's and an artist infatuated with Dorian's beauty..")

puts "Done!"
