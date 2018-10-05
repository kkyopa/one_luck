class Relationship < ApplicationRecord
    belongs_to :user
    belongs_to :luck
     belongs_to :target
end
