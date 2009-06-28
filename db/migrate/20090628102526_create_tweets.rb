class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.column :twitter_id, :bigint
      t.string :text
      t.string :retranslation

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
