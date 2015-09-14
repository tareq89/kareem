# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AccountType.create(key: "অন্যান্য", value: "other", is_debit: false)
AccountType.create(key: "আয়", value: "income", is_debit: false)
AccountType.create(key: "ব্যয়", value: "spent", is_debit: true)
AccountType.create(key: "ধার দিয়েছি", value: "loan_given", is_debit: true)
AccountType.create(key: "ধার পরিশোধ হয়েছে", value: "loan_paid", is_debit: false)
AccountType.create(key: "ঋণ নিয়েছি", value: "loan_taken", is_debit: false)
AccountType.create(key: "ঋণ পরিশোধ হয়েছে", value: "loan_repaid", is_debit: true)
