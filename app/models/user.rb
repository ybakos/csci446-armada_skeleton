class User < ActiveRecord::Base

  acts_as_authentic

  has_paper_trail
  
  belongs_to :role, :counter_cache => true

  default_scope :include => :role

  before_create :assign_default_role

  def role_symbols
    [role.name.downcase.to_sym]
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.deliver_password_reset_instructions(self)  
  end

  def is?(role_symbol)
    role_symbols.include? role_symbol
  end
  
  def is_admin?
    role_symbols.include?(:administrator) || role_symbols.include?(:developer)
  end

  private

    def assign_default_role
      self.role = Role.find_by_name('member') if role_id.blank?
    end

end


# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  first_name          :string(255)     not null
#  last_name           :string(255)     not null
#  email               :string(255)     not null
#  role_id             :integer         not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer         default(0), not null
#  failed_login_count  :integer         default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

