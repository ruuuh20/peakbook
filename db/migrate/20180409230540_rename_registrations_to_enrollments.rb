class RenameRegistrationsToEnrollments < ActiveRecord::Migration[5.1]
  def change
    rename_table :registrations, :enrollments
  end
end
