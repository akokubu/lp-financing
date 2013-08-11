# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Account.create(:id => 1, :name => '三井住友[赤坂]')
Account.create(:id => 2, :name => '三井住友[新宿]')
Account.create(:id => 3, :name => '三井住友[高田馬場]')
Account.create(:id => 4, :name => 'りそな')
Account.create(:id => 5, :name => 'みずほ')

MonthlyBalance.create(:id => 1, :account_id => 1, :month => 201307, :date => '2013-07-01', :balance => 148101)
MonthlyBalance.create(:id => 2, :account_id => 1, :month => 201308, :date => '2013-08-01', :balance => 348101)
