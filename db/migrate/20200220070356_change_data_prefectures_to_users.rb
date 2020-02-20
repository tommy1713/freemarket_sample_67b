class ChangeDataPrefecturesToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :prefectures, :string
  end
end
