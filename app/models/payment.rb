# == Schema Information
#
# Table name: payments
#
#  id              :bigint(8)        not null, primary key
#  paid            :boolean          default(FALSE)
#  payday          :date
#  estimated_value :decimal(, )
#  paid_value      :decimal(, )
#  receipt         :string
#  bill_image      :string
#  bill_id         :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :bill
end
