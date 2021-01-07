class AddLearnMorePdfLinkToHireMe < ActiveRecord::Migration[6.0]
  def change
    add_column :hire_mes, :learn_more_pdf_link, :text
  end
end
