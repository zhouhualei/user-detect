class AddLoginStatisticsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_times, :integer
    add_column :users, :total_online_seconds, :integer
    add_column :users, :last_login_time, :datetime
  end
end
