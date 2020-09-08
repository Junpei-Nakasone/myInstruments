class Instrument < ApplicationRecord
    belongs_to :user
    attachment :image

    with_options presence: true do
        validates :title
        validates :description
        validates :image
    end
end
