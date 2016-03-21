class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  mount_uploader :photo, PhotoUploader
  


  def read?
    !!read_at
  end
end
