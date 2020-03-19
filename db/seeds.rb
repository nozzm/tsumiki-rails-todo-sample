# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create([
  {
    name: "消しゴムを買う",
    deadline: "2020-02-11",
  },
  {
    name: "線形代数の宿題をやる",
    deadline: "2020-02-15",
  },
  {
    name: "本屋に行く",
    deadline: "2020-02-10",
  },
  {
    name: "映画のチケットを買う",
    deadline: "2020-02-15",
  },
  {
    name: "プレゼンを作る",
    deadline: "2020-02-20",
  },
])