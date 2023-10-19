# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@raw_text = 'Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

def seed
  reset_db
  create_admin
  create_users
  create_plants(50)
  create_comments(2..8)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_admin
  user_data = {
      email: "admin@email.com",
      password: 'testtest',
      admin: true
    }
    user = User.create!(user_data)
    puts "Admin created with id #{user.id}"

end

def create_users
  i = 0

  10.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    # if i == 0
    #    user_data[:email] = "admin@email.com"
    #    user_data[:admin] = true
    #  end

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
  end
end

def create_sentence
  sentence_words = []

  (10..20).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def upload_random_image
    uploader = PlantImageUploader.new(Plant.new, :plant_image)
    uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/plants', '*')).sample))
    uploader
  end

def create_plants(quantity)
  quantity.times do
    user = User.all.sample
    plant = Plant.create(name: create_sentence, description: create_sentence, plant_image: upload_random_image, user_id: user.id)
    puts "Plant with id #{plant.id} just created"
  end
end

def create_comments(quantity)
  Plant.all.each do |plant|
    quantity.to_a.sample.times do
      user = User.all.sample
      comment = Comment.create(plant_id: plant.id, body: create_sentence, user_id: user.id)
      puts "Comment with id #{comment.id} for plant with id #{comment.plant.id} just created"
    end
  end
end

seed