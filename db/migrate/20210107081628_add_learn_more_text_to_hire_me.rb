class AddLearnMoreTextToHireMe < ActiveRecord::Migration[6.0]
  def change
    add_column :hire_mes, :learn_more_text, :string
  end
end
