class ChangeColumnName < ActiveRecord::Migration
  def change
    change_column(:short_visits, :visitor_ip, :string)
  end
end
