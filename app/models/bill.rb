# == Schema Information
#
# Table name: bills
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  fixed_value_cd  :integer
#  value           :decimal(, )
#  type_cd         :integer
#  installments    :integer
#  payday_limit    :integer
#  require_receipt :boolean
#  require_doc     :boolean
#  late_fine       :boolean
#  obs             :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  paid            :boolean          default(FALSE)
#  starts_at       :date
#

class Bill < ApplicationRecord
  has_many :payments
  as_enum :fixed_value, fixed: 0, variable: 1, prefix: true
  as_enum :type, uniq: 0, in_installment: 1, perpetual: 2, prefix: true

  validates_presence_of :fixed_value_cd, :type_cd, :name, :starts_at
  # mount_uploader :receipt, ReceiptUrlUploader

  after_create :create_payments

  def create_payments
    case type_cd
    when 0
      create_single_payment(self.starts_at)
    when 1
      self.installments.times do |index|
        create_single_payment(self.starts_at + index.month)
      end
    else
      true
    end
  end

  def create_single_payment(date)
    payment = Payment.new bill: self

    payment.payday = date
    payment.estimated_value = value if fixed_value_cd == 0
    payment.save!
  end
end
