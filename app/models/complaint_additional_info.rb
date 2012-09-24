class ComplaintAdditionalInfo < ActiveRecord::Base
  belongs_to :complaint
  belongs_to :status

  def self.latest
    order("created_at DESC, updated_at DESC").limit(1).first
  end

end
