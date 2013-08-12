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
MonthlyBalance.create(:id => 2, :account_id => 1, :month => 201308, :date => '2013-08-01', :balance => 55402)

Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-01', :inout => 'out', :amount => 105)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-01', :inout => 'out', :amount => 20100)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-01', :inout => 'out', :amount => 15440)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-04', :inout => 'out', :amount => 65380)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-09', :inout => 'in', :amount => 100000)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-10', :inout => 'out', :amount => 98365)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-10', :inout => 'in', :amount => 145495)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-12', :inout => 'out', :amount => 32959)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-22', :inout => 'out', :amount => 30000)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-23', :inout => 'out', :amount => 50750)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-23', :inout => 'out', :amount => 9655)
Statement.create(:account_id => 1, :month => 201307, :date => '2013-07-30', :inout => 'out', :amount => 15440)
Statement.create(:account_id => 1, :month => 201308, :date => '2013-08-01', :inout => 'out', :amount => 105)
Statement.create(:account_id => 1, :month => 201308, :date => '2013-08-02', :inout => 'in', :amount => 200000)
Statement.create(:account_id => 1, :month => 201308, :date => '2013-08-05', :inout => 'out', :amount => 121313)
Statement.create(:account_id => 1, :month => 201308, :date => '2013-08-08', :inout => 'in', :amount => 50000)
Statement.create(:account_id => 1, :month => 201308, :date => '2013-08-12', :inout => 'out', :amount => 101198)
Statement.create(:account_id => 1, :month => 201308, :date => '2013-08-12', :inout => 'out', :amount => 32959)







