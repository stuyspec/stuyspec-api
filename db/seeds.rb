# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.create( title: 'test1', content: 'test1')
Article.create( title: 'test2', content: 'test2')
Article.create( title: 'test3', content: 'test3')
Article.create( title: 'test4', content: 'test4')
Article.create( title: 'test5', content: 'test5')
Article.create( title: 'test6', content: 'test6')
Comment.create( content: 'test1', article_id: 1)
Comment.create( content: 'test2', article_id: 1)
Comment.create( content: 'test3', article_id: 1)
Comment.create( content: 'test4', article_id: 1)
Comment.create( content: 'test5', article_id: 1)
Comment.create( content: 'test6', article_id: 1)
User.create(username:'John Doe', email: 'john1@gmail.com', password: 'topsecret1', password_confirmation: 'topsecret1')
User.create(username:'John Doe', email: 'john2@gmail.com', password: 'topsecret2', password_confirmation: 'topsecret2')
User.create(username:'John Doe', email: 'john3@gmail.com', password: 'topsecret3', password_confirmation: 'topsecret3')
User.create(username:'John Doe', email: 'john4@gmail.com', password: 'topsecret4', password_confirmation: 'topsecret4')
User.create(username:'John Doe', email: 'john5@gmail.com', password: 'topsecret5', password_confirmation: 'topsecret5')
User.create(username:'John Doe', email: 'john6@gmail.com', password: 'topsecret6', password_confirmation: 'topsecret6')
Section.create( name: 'test1', slug: 'test1')
Section.create( name: 'test2', slug: 'test2')
Section.create( name: 'test3', slug: 'test3')
Section.create( name: 'test4', slug: 'test4')
Section.create( name: 'test5', slug: 'test5')
Section.create( name: 'test6', slug: 'test6')
Authorship.create(user_id:1, article_id: 1)
Authorship.create(user_id:2, article_id: 2)
Authorship.create(user_id:3, article_id: 3)
Authorship.create(user_id:4, article_id: 4)
Authorship.create(user_id:5, article_id: 5)
Authorship.create(user_id:6, article_id: 6)
Role.create(title: 'test1', slug:'test1')
Role.create(title: 'test2', slug:'test2')
Role.create(title: 'test3', slug:'test3')
Role.create(title: 'test4', slug:'test4')
Role.create(title: 'test5', slug:'test5')
Role.create(title: 'test6', slug:'test6')
UserRole.create(user_id: 1, role_id: 1)
UserRole.create(user_id: 2, role_id: 2)
UserRole.create(user_id: 3, role_id: 3)
UserRole.create(user_id: 4, role_id: 4)
UserRole.create(user_id: 5, role_id: 5)
UserRole.create(user_id: 6, role_id: 6)





