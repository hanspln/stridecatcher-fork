class AddValidationToActivitiesAndUsers < ActiveRecord::Migration[6.0]
  def change
    validate_foreign_key :activities, :users
  end
end
