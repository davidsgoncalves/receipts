# == Schema Information
#
# Table name: bills
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  value        :decimal(, )
#  installments :integer
#  perpetual    :boolean
#  receipt      :string
#

class Bill < ApplicationRecord
  mount_uploader :receipt, ReceiptUrlUploader
end
