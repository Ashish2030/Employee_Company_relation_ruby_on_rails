class Chnagetable < ActiveRecord::Migration[6.0]
  def change
    remove_timestamps :companies
  end
end
