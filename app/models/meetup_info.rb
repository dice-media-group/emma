class MeetupInfo < ApplicationRecord
  belongs_to :site, dependent: :destroy
end
