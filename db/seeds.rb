# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

templates = Template.create([
  {:template_name => 'DarkPath/Home'},
  {:template_name => 'DarkPath/Inside'},
  {:template_name => 'DarkPath/Inside-Left'},
  {:template_name => 'DarkPath/Admin'}
  ])

