class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_url
      t.integer :visits, default: 0

      t.timestamps
    end
  end
end
