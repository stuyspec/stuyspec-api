# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
articles = Article.create([{ title: 'Jerry is cool1', content: 'Jerry is amazing1'},{ title: 'Jerry is cool2', content: 'Jerry is amazing2'},{ title: 'Jerry is cool3', content: 'Jerry is amazing3'}])
Comment.create( content: 'Jerry is cool', article_id: 2)