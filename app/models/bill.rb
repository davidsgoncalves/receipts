class Bill < ApplicationRecord
  mount_uploader :receipt, ReceiptUrlUploader
end
