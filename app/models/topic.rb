class Topic < ApplicationRecord
  validates :subject, {length: {maximum: 10}}
  validates :info, {presence: true, length: {maximum: 300}}
end
