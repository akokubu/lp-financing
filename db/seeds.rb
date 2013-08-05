# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Account.create(:name => '三井住友[赤坂]')
Account.create(:name => '三井住友[新宿]')
Account.create(:name => '三井住友[高田馬場]')
Account.create(:name => 'りそな')
Account.create(:name => 'みずほ')
