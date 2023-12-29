# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@raw_text = 'Роза Алексей Кактус Виктория Фикус Дмитрий Орхидея Екатерина Алоэ Игорь Герань Жанна Бамбук Захар Папоротник Карина Калатея Лев Ягода Мария Камнеломка Николай Пеларгония Ольга Аглаонема Павел Каланхоэ Раиса Суккулент Сергей Плющ Татьяна Гиацинт Ульяна Драцена Федор Азалия Христина Лаванда Цветан Крокус Шарлотта Ирис Эдуард Антуриум Юлия Зефиррантус Ярослав Петрушка Артем Передоз Белла Шефлера Валентин Мединилла Григорий Коктейль Дарина Мимоза Евгений Сансевиерия Зинаида Кислица Илья Адениум Ксения Кофе Леонид Астра Марк Лимон Надежда Лобелия Олег Ягодник Полина Гибискус Роман Чеснок София Лилейник Тимур Лилия Ульяна Безвременье Филипп Персик Христина Молодильник Цветелина Клен Эдгар Барвинок Яна Перец Артур Гранат Валерия Кукуруза Глеб'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

def seed
  reset_db
  clean_content_folders
  create_admin
  create_users_with_profiles
  create_plants(50)
  create_comments(2..8)
  create_comment_replies(1000)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def clean_content_folders
  FileUtils.rm_rf('public/uploads')
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

# def create_users
#   i = 0

#   10.times do
#     user_data = {
#       email: "user_#{i}@email.com",
#       password: 'testtest'
#     }

#     # if i == 0
#     #    user_data[:email] = "admin@email.com"
#     #    user_data[:admin] = true
#     #  end

#     user = User.create!(user_data)
#     puts "User created with id #{user.id}"

#     i += 1
#   end
# end


def create_users_with_profiles
  10.times do |i|
    # User creation
    user_data = {
      email: "user_#{i + 1}@email.com",
      password: 'testtest'
    }

    user = User.create!(user_data)

    # Profile creation with the same ID as the user
    profile_data = {
      user_id: user.id,
      username: "username_#{i + 1}",
      about: "Sample about for user #{i + 1}",
      location: "Sample location for user #{i + 1}"
    }

    profile = Profile.create!(profile_data)

    puts "User created with id #{user.id} and profile created with id #{profile.id} and profile number #{profile.id}"
  end
end

def create_sentence
  sentence_words = []

  2.times do
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

def create_comment_replies(quantity)
  quantity.times do
    user = User.all.sample
    comment = Comment.all.sample
    reply = comment.replies.create(plant_id: comment.plant_id, user_id: user.id, body: create_sentence)
    puts "Comment reply with id #{reply.id} for comment with id #{comment.id} just created"
  end
end

seed