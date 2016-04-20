# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Group.superadmins
Group.authorized

users = []
3.times do |i|
  user = User.create!(email: "user#{i.next}@octoshell.ru",
                      password: "123456", password_confirmation: '123456')
  user.activate!
  user.activate!
  user.access_state='active'
  user.save
  users << user
end

admin = User.create!(email: "admin@octoshell.ru",
                     password: "123456", password_confirmation: '123456')
admin.activate!
admin.activate!
admin.groups << Group.find(name: 'superadmins')
admin.access_state='active'
admin.save!


Group.default!

# create projects prerequisites

c=Core::Country.create(title_en: 'Russia', title_ru: 'Россия')
c.save

c=Core::City.create(title_en: 'Moscow', title_ru: "Москва")
c.save

c=Core::Cluster.create(host: 'localhost', admin_login: 'octo', name: 'test')
c.save

c=Core::OrganizationKind(name: 'Российская коммерческая организация')
c.save

c=Core::CriticalTechnology(name: 'Робототехника')
c.save

c=Core::DirectionOfScience(name: 'Информационно-телекоммуникационные системы')
c.save

c=Core::ResearchArea(name: 'Математика')
c.save


