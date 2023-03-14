class CreateCityWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :city_weathers do |t|
      t.belongs_to :user, foreign_key: true
      t.string :iata
      t.json :response

      t.timestamps
    end
  end
end
