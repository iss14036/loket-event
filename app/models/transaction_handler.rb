class TransactionHandler
  class QuotaIsNotEnough < StandardError
    def message
      "Quota is not enough, check your amount of ticket again"
    end
  end

  class CategoryTicketIsExist < StandardError
    def message
      "Category ticket is already exist for the event, check again"
    end
  end
end
