class Contact < ActiveRecord::Base
  #validate content is typed in name, email on form. otherwise triggers error "flash hash"
  validates :name, presence: true
  validates :email, presence: true
end