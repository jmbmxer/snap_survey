class AddTopicToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :topic, :text
  end
end
