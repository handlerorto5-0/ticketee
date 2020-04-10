unless User.exists?(email: "admin@mail.ru")
  User.create!(email: "admin@mail.ru", password: "password", admin: true)
end
unless User.exists?(email: "viewer@mail.ru")
  User.create!(email: "viewer@mail.ru", password: "password")
end
["Sublime Text 3", "Internet Explorer", "NeoVim"].each do |name|
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A sample project about #{name}")
  end
end
