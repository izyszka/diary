class Rate < ApplicationRecord
  belongs_to :movie
  validates :ip, uniqueness: { scope: :movie,
    message: "only one vote per one ip adress is allowed" }
end
